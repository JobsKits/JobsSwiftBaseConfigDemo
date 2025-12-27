import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const MethodChannel platform = MethodChannel('com.jobs/native_flutter');
final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 支持 iOS 通过 initialRoute 传参（可选）
  // 例如：/page?payload={"requestId":"123","foo":"bar"}
  final String defaultRoute =
      WidgetsBinding.instance.platformDispatcher.defaultRouteName;
  final Map<String, dynamic> initialArgs = _argsFromInitialRoute(defaultRoute);

  // iOS -> Flutter：打开/跳转指定页面并带参
  platform.setMethodCallHandler((call) async {
    switch (call.method) {
      case 'open':
        final args = _asMap(call.arguments);
        final route = (args['route'] as String?) ?? '/page';
        navKey.currentState?.pushNamed(route, arguments: args);
        return true;

      case 'close':
        navKey.currentState?.maybePop();
        return true;

      default:
        throw PlatformException(
          code: 'unimplemented',
          message: 'Method ${call.method} not implemented in Flutter',
        );
    }
  });

  runApp(App(initialArgs: initialArgs));
}

class App extends StatelessWidget {
  const App({super.key, required this.initialArgs});
  final Map<String, dynamic> initialArgs;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navKey,
      onGenerateRoute: (settings) {
        final name = settings.name ?? '/';
        if (name == '/' || name == '/page') {
          final args = (settings.arguments is Map)
              ? Map<String, dynamic>.from(settings.arguments as Map)
              : initialArgs;

          return MaterialPageRoute(
            settings: settings,
            builder: (_) => FlutterPage(args: args),
          );
        }

        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(title: const Text('Unknown route')),
            body: Center(child: Text('No route: $name')),
          ),
        );
      },
    );
  }
}

Map<String, dynamic> _asMap(dynamic v) {
  if (v is Map) return Map<String, dynamic>.from(v);
  return <String, dynamic>{};
}

/// 解析 initialRoute 里带的 payload（可选用）
/// 形如：/page?payload=<urlEncodedJson>
Map<String, dynamic> _argsFromInitialRoute(String routeName) {
  try {
    final uri = Uri.tryParse(routeName);
    if (uri == null) return {};
    final payload = uri.queryParameters['payload'];
    if (payload == null || payload.isEmpty) return {};
    final decoded = Uri.decodeComponent(payload);
    final jsonObj = jsonDecode(decoded);
    if (jsonObj is Map) return Map<String, dynamic>.from(jsonObj);
  } catch (_) {}
  return {};
}

/// 你的页面
class FlutterPage extends StatefulWidget {
  const FlutterPage({super.key, required this.args});
  final Map<String, dynamic> args;

  @override
  State<FlutterPage> createState() => _FlutterPageState();
}

class _FlutterPageState extends State<FlutterPage> {
  late final TextEditingController _controller;

  String get requestId => (widget.args['requestId']?.toString() ?? '');

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: widget.args['prefill']?.toString() ?? '',
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _finish() async {
    // Flutter -> iOS：回传结果
    final resultPayload = <String, dynamic>{
      'requestId': requestId, // 用于 iOS 匹配是哪一次打开
      'data': <String, dynamic>{
        'text': _controller.text,
        'timestamp': DateTime.now().toIso8601String(),
      },
    };

    try {
      await platform.invokeMethod('result', resultPayload);
    } catch (_) {
      // iOS 没实现也不会影响 Flutter 关闭页面
    }

    if (mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final prettyArgs = const JsonEncoder.withIndent('  ').convert(widget.args);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Page'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: _finish, // 关闭也回传
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('收到的参数：'),
            const SizedBox(height: 8),
            Expanded(
              child: SingleChildScrollView(
                child: SelectableText(prettyArgs),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: '输入要回传给 iOS 的内容',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _finish,
              child: const Text('返回并回传给 iOS'),
            ),
          ],
        ),
      ),
    );
  }
}
