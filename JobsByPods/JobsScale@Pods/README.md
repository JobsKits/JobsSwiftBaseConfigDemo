# 📏比例尺

* **JobsScale**主要是协调**iPhone**的不同设备屏幕和设计稿之间的比例转换问题

  * 对于UI宽高各一个比例尺（参考[**Flutter**](https://flutter.dev/)中关于屏幕的适配方案）

    ```swift
    3.w // 宽
    3.h // 高
    ```

  * 对于字体单独的一个比例尺

  * App启动时需要配置当前UI锚定的设计稿尺寸

    ```swift
    // MARK: - 比例尺
    JobsScale.setup(designWidth: 375, designHeight: 812)
    ```

  * 兼容**iPad**