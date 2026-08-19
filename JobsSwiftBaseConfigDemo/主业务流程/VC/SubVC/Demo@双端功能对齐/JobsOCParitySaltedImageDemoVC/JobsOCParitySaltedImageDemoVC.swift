//
//  JobsOCParitySaltedImageDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年7月24日，星期五.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsByUIKit
import JobsInheritance
import JobsSwiftBaseDefines
import JobsSwiftTools
import JobsToast
import GKNavigationBarSwift
import SnapKit

private enum JobsImageStringCodec: CaseIterable {
    case hexadecimal
    case base16
    case base32
    case base64
    case base85
    case mime

    var title: String {
        switch self {
        /// 十六进制字符串
        case .hexadecimal:
            return "利用十六进制字符串进行存取".tr
        /// Base16 编码
        case .base16:
            return "利用Base16编码进行存取".tr
        /// Base32 编码
        case .base32:
            return "利用Base32编码进行存取".tr
        /// Base64 编码
        case .base64:
            return "利用Base64编码进行存取".tr
        /// Base85 编码
        case .base85:
            return "利用Base85编码进行存取".tr
        /// MIME 编码
        case .mime:
            return "利用MIME编码进行存取".tr
        }
    }
}

final class JobsSaltedImageStoreDemoVC: BaseVC {

    private let codecs = JobsImageStringCodec.allCases

    private lazy var tableView: UITableView = {
        UITableView(frame: .zero, style: .plain)
            .byDataSource(self)
            .byDelegate(self)
            .byRowHeight(62)
            .byTableFooterView(UIView.jobsMake { _ in })
            .byBackgroundColor(JobsCor.systemBackground)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(gk_navigationBar.snp.bottom)
                make.left.right.bottom.equalToSuperview()
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemBackground)
        jobsSetupGKNav(title: "图片加盐后转字符串存取".tr)
        tableView.byVisible(YES)
    }
}

extension JobsSaltedImageStoreDemoVC: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        codecs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseIdentifier = "JobsSaltedImageCodecCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier)
            ?? UITableViewCell(style: .default, reuseIdentifier: reuseIdentifier)
        return cell
            .byText(codecs[indexPath.row].title)
            .byTitleFont(JobsFont.systemFont(ofSize: 16))
            .byTitleCor(JobsCor.label)
            .byAccessoryType(.disclosureIndicator)
            .byBackgroundColor(JobsCor.secondarySystemBackground)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: YES)
        JobsSaltedImageCodecDemoVC(codec: codecs[indexPath.row]).byPush(self)
    }
}

private final class JobsSaltedImageCodecDemoVC: BaseVC {

    private let codec: JobsImageStringCodec
    private let prefixSalt = "Jobs@Swift#Image<"
    private let suffixSalt = ">egamI#tfiwS@sboJ"
    private var encodedText = ""

    private lazy var chooseButton: UIButton = {
        UIButton.sys()
            .byTitle("点击按钮".tr, for: .normal)
            .bySubTitle("选取相册图片".tr, for: .normal)
            .byImage("plus.circle.fill".sysImg, for: .normal)
            .byTitleFont(JobsFont.boldSystemFont(ofSize: 19))
            .bySubTitleFont(JobsFont.systemFont(ofSize: 14))
            .byTitleColor(JobsCor.label, for: .normal)
            .bySubTitleColor(JobsCor.secondaryLabel, for: .normal)
            .byTintColor(JobsCor.systemGreen)
            .byBackgroundColor(JobsCor.secondarySystemBackground, for: .normal)
            .byCornerRadius(12)
            .onTap { [weak self] _ in
                self?.chooseImage()
            }
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(gk_navigationBar.snp.bottom).offset(10)
                make.left.right.equalToSuperview().inset(12)
                make.height.equalTo(200)
            }
    }()

    private lazy var restoreButton: UIButton = {
        UIButton.sys()
            .byTitle("点击按钮".tr, for: .normal)
            .bySubTitle("编码转译成图片".tr, for: .normal)
            .byImage("photo.badge.arrow.down".sysImg, for: .normal)
            .byTitleFont(JobsFont.boldSystemFont(ofSize: 19))
            .bySubTitleFont(JobsFont.systemFont(ofSize: 14))
            .byTitleColor(JobsCor.label, for: .normal)
            .bySubTitleColor(JobsCor.secondaryLabel, for: .normal)
            .byTintColor(JobsCor.systemBlue)
            .byBackgroundColor(JobsCor.secondarySystemBackground, for: .normal)
            .byCornerRadius(12)
            .onTap { [weak self] _ in
                self?.restoreImage()
            }
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(chooseButton.snp.bottom).offset(10)
                make.left.right.equalToSuperview().inset(12)
                make.height.equalTo(200)
            }
    }()

    private lazy var encodedTextView: UITextView = {
        UITextView.jobsMake { _ in }
            .byText("暂无编码数据！！！".tr)
            .byFont(JobsFont.monospacedSystemFont(ofSize: 12, weight: .regular))
            .byTextColor(JobsCor.label)
            .byEditable(false)
            .byBackgroundColor(JobsCor.systemGray6)
            .byCornerRadius(10)
            .byTextContainerInset(UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(restoreButton.snp.bottom).offset(10)
                make.left.right.equalToSuperview().inset(12)
                make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(12)
            }
    }()

    init(codec: JobsImageStringCodec) {
        self.codec = codec
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        nil
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemBackground)
        jobsSetupGKNav(title: codec.title)
        chooseButton.byVisible(YES)
        restoreButton.byVisible(YES)
        encodedTextView.byVisible(YES)
    }

    private func chooseImage() {
        pickFromPhotoLibrary(maxSelection: 1, imagesOnly: true) { [weak self] images in
            guard let self,
                  let image = images.first,
                  let data = image.pngData() ?? image.jpegData(compressionQuality: 0.92) else { return }
            guard let payload = encode(data) else {
                encodedTextView.byText("编码失败".tr)
                return
            }
            encodedText = prefixSalt + payload + suffixSalt
            chooseButton
                .byImage(image, for: .normal)
                .bySubTitle("已选择图片，完成加盐编码".tr, for: .normal)
            let preview = String(encodedText.prefix(1000))
            let suffix = encodedText.count > preview.count ? "\n\n……仅展示前 1000 个字符" : ""
            encodedTextView.byText(preview + suffix)
        }
    }

    private func restoreImage() {
        guard encodedText.hasPrefix(prefixSalt),
              encodedText.hasSuffix(suffixSalt) else {
            "请先选取图片并完成编码".toast
            return
        }
        let payload = String(
            encodedText
                .dropFirst(prefixSalt.count)
                .dropLast(suffixSalt.count)
        )
        guard let data = decode(payload),
              let image = UIImage(data: data) else {
            "去盐或图片解码失败".toast
            return
        }
        restoreButton
            .byImage(image, for: .normal)
            .bySubTitle("图片已成功还原".tr, for: .normal)
        "图片往返成功：\(data.count) B".toast
    }

    private func encode(_ data: Data) -> String? {
        switch codec {
        /// 十六进制字符串编码
        case .hexadecimal:
            return data.map { String(format: "%02x", $0) }.joined()
        /// Base16 大写编码
        case .base16:
            return data.map { String(format: "%02X", $0) }.joined()
        /// Base32 编码
        case .base32:
            return base32Encode(data)
        /// Base64 编码
        case .base64:
            return data.base64EncodedString()
        /// Base85 编码
        case .base85:
            return base85Encode(data)
        /// MIME 数据 URL 编码
        case .mime:
            return "data:image/png;base64,\(data.base64EncodedString())"
        }
    }

    private func decode(_ text: String) -> Data? {
        switch codec {
        /// 十六进制字符串解码
        case .hexadecimal:
            return hexDecode(text)
        /// Base16 解码
        case .base16:
            return hexDecode(text)
        /// Base32 解码
        case .base32:
            return base32Decode(text)
        /// Base64 解码
        case .base64:
            return Data(base64Encoded: text)
        /// Base85 解码
        case .base85:
            return base85Decode(text)
        /// MIME 数据 URL 解码
        case .mime:
            guard let commaIndex = text.firstIndex(of: ",") else { return nil };return Data(
                base64Encoded: String(text[text.index(after: commaIndex)...])
            )
        }
    }

    private func hexDecode(_ text: String) -> Data? {
        guard text.count.isMultiple(of: 2) else { return nil }
        var data = Data()
        var index = text.startIndex
        while index < text.endIndex {
            let nextIndex = text.index(index, offsetBy: 2)
            guard let byte = UInt8(text[index..<nextIndex], radix: 16) else { return nil }
            data.append(byte)
            index = nextIndex
        };return data
    }

    private func base32Encode(_ data: Data) -> String {
        let alphabet = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ234567")
        var buffer = 0
        var bitsLeft = 0
        var output = ""
        data.forEach { byte in
            buffer = (buffer << 8) | Int(byte)
            bitsLeft += 8
            while bitsLeft >= 5 {
                output.append(alphabet[(buffer >> (bitsLeft - 5)) & 31])
                bitsLeft -= 5
            }
        }
        if bitsLeft > 0 {
            output.append(alphabet[(buffer << (5 - bitsLeft)) & 31])
        }
        while !output.count.isMultiple(of: 8) {
            output.append("=")
        };return output
    }

    private func base32Decode(_ text: String) -> Data? {
        let alphabet = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ234567")
        let lookup = Dictionary(uniqueKeysWithValues: alphabet.enumerated().map { ($0.element, $0.offset) })
        var buffer = 0
        var bitsLeft = 0
        var output = Data()
        for character in text.uppercased() where character != "=" {
            guard let value = lookup[character] else { return nil }
            buffer = (buffer << 5) | value
            bitsLeft += 5
            if bitsLeft >= 8 {
                output.append(UInt8((buffer >> (bitsLeft - 8)) & 0xFF))
                bitsLeft -= 8
            }
        };return output
    }

    private func base85Encode(_ data: Data) -> String {
        let bytes = [UInt8](data)
        var output = ""
        var index = 0
        while index < bytes.count {
            let count = min(4, bytes.count - index)
            var value: UInt32 = 0
            for offset in 0..<4 {
                value <<= 8
                if offset < count {
                    value |= UInt32(bytes[index + offset])
                }
            }
            var encoded = Array(repeating: Character("!"), count: 5)
            for position in stride(from: 4, through: 0, by: -1) {
                encoded[position] = Character(UnicodeScalar(Int(value % 85) + 33)!)
                value /= 85
            }
            output.append(contentsOf: encoded.prefix(count + 1))
            index += count
        };return output
    }

    private func base85Decode(_ text: String) -> Data? {
        let characters = Array(text)
        var output = Data()
        var index = 0
        while index < characters.count {
            let count = min(5, characters.count - index)
            var value: UInt64 = 0
            for offset in 0..<5 {
                let scalar: UInt64
                if offset < count {
                    guard let ascii = characters[index + offset].asciiValue,
                          ascii >= 33,
                          ascii <= 117 else { return nil }
                    scalar = UInt64(ascii - 33)
                } else {
                    scalar = 84
                }
                value = value * 85 + scalar
            }
            guard value <= UInt32.max else { return nil }
            let decoded = [
                UInt8((value >> 24) & 0xFF),
                UInt8((value >> 16) & 0xFF),
                UInt8((value >> 8) & 0xFF),
                UInt8(value & 0xFF)
            ]
            output.append(contentsOf: decoded.prefix(max(0, count - 1)))
            index += count
        };return output
    }
}
