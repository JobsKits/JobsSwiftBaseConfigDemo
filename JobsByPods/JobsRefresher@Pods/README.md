# `JobsRefresher`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

## 一、简介

* 开发动机 ➤ 逐步舍弃[**MJRefresh**](https://github.com/CoderMJLee/MJRefresh)
  * 年久失修，不更新维护
  * OC代码，需要上升到纯Swift支持
  * 里面存在很多废弃代码
  * 不兼容[**Lottie**](https://github.com/airbnb/lottie-ios)动画，需要额外开支
  * 不支持水平方向的刷新和拉新
  * 不支持阿拉伯习惯（从右往左）
* 已实现功能
  * 横向 / 纵向的刷新和拉新
  * 支持显示最近一次的刷新的时间
  * 支持静默刷新和拉新  ➤ 隐藏刷新的头部和拉新的尾部
  * 支持[**Lottie**](https://github.com/airbnb/lottie-ios)动画  ➤ 如果没有配置[**Lottie**](https://github.com/airbnb/lottie-ios)动画则回退到普通模式
  * 拉动到触发实际操作的时候，有用户感官反馈
    * 震动反馈 ➤ 可以开启 / 关闭
    * 播放声音 ➤ 支持**文件全名**和**主文件名**

## 二、使用方式

### 1、`UITableView`（演示垂直）

```swift
private lazy var tableView: UITableView = {
    UITableView(frame: .zero, style: .plain)
        .byRowHeight(52)
        .byTableFooterView(UIView())
        .byDataSource(self)
        .byAddTo(view) { [unowned self] make in
            make.top.equalTo(collectionView.snp.bottom)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        .showRefreshHeaderInfo(YES)   // 竖向Header + 横向Left
        .showRefreshFooterInfo(NO)  // 竖向Footer + 横向Right
        .setHeaderLottie(.custom(.init(animationName: "LottieLogo1")))
        .setFooterLottie(.disabled) // 强制 footer 回退菊花（即使全局配置了）
        .enableRefreshHaptics(true)
        .setRefreshSound("Sound.wav")
        // 下拉刷新 Header
        .byRefreshHeader(component: JobsDefaultHeader(),
                         container: self,
                         trigger: 66) { [weak self] in
            guard let self else { return }
            jobsRunOnMain(self) { vc in
                try? await Task.sleep(nanoseconds: 1_000_000_000)
                self.rows = 20
                self.tableView.byReloadData()
                self.tableView.switchRefreshHeader(to: .normal)
                self.tableView.switchRefreshFooter(to: .normal) // 复位“无更多”
            }
        }
        // 上拉加载 Footer
        .byRefreshFooter(component: JobsDefaultFooter(),
                         container: self,
                         trigger: 66) { [weak self] in
            guard let self else { return }
            jobsRunOnMain(self) { vc in
                try? await Task.sleep(nanoseconds: 1_000_000_000)
                if self.rows < 60 {
                    self.rows += 20
                    self.tableView.byReloadData()
                    self.tableView.switchRefreshFooter(to: .normal)
                } else {
                    self.tableView.switchRefreshFooter(to: .noMoreData)
                }
            }
        }
}()
```

### 2、`UICollectionView`（演示水平）collectionView

```swift
private lazy var collectionView: UICollectionView = {
    UICollectionView(frame: .zero, collectionViewLayout: hLayout)
        .byDataSource(self)
        .byDelegate(self)
        .byRegisterCell(HCell.self)
        .byBackgroundView(nil)
        .byShowsHorizontalScrollIndicator(false)
        .byAlwaysBounceHorizontal(true)// 即使不满一屏也允许左右拉
        .byAddTo(view) { [unowned self] make in
            make.left.right.equalToSuperview()
            make.height.equalTo(topHeight)
            if view.jobs_hasVisibleTopBar() {
                make.top.equalTo(self.gk_navigationBar.snp.bottom).offset(10)
            } else {
                make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            }
        }
				.showRefreshHeaderInfo(NO)   // 竖向Header + 横向Left
				.showRefreshFooterInfo(YES)  // 竖向Footer + 横向Right
        .setLeftLottie(.custom(.init(animationName: "9squares_AlBoardman")))
        .setRightLottie(.inherit)     // 继承全局（没有全局就回退菊花）
        .enableRefreshHaptics(true)
        .setRefreshSound("Sound.wav") 
        // 左侧拉：比如“上一页/回退”
        .bySideRefresh(with: JobsDefaultLeftRefresher(),
                           container: self,
                           at: .left,
                           trigger: 70) { [weak self] in
            guard let self else { return }
            jobsRunOnMain(self) { vc in
                try? await Task.sleep(nanoseconds: 900_000_000)
                // 模拟“刷新完成”：减少一个 item 并刷新
                self.hItems = max(8, self.hItems - 1)
                self.collectionView.byReloadData()
                self.collectionView.switchSideRefresh(.left, to: .normal)
            }
       }
       // 右侧拉：比如“下一页/加载更多卡片”
       .bySideRefresh(with: JobsDefaultRightRefresher(),
                          container: self,
                          at: .right,
                          trigger: 70) { [weak self] in
           guard let self else { return }
           jobsRunOnMain(self) { vc in
               try? await Task.sleep(nanoseconds: 900_000_000)
               self.hItems += 3
               self.collectionView.byReloadData()
               self.collectionView.switchSideRefresh(.right, to: .normal)
           }
       }
}()
```

## 三、未尽事宜

* 需要支持阿拉伯方式，即：
  * 从左到右拉 ➤ 拉新
  * 从右往左拉 ➤ 刷新

## 四、其他

* 附：[⏬ **Lottie** 动画文件下载](https://lottiefiles.com/)
* [演示**Demo**](https://github.com/JobsKits/JobsSwiftBaseConfigDemo)

## 五、特别鸣谢

* [**MJRefresh**](https://github.com/CoderMJLee/MJRefresh) ➤ 关键词：纵向刷新、**Objc**
* [**XZMRefresh**](https://github.com/xiezhongmin/XZMRefresh) ➤ 关键词：横向刷新、参考[**MJRefresh**](https://github.com/CoderMJLee/MJRefresh)、**Objc**
* [**CollectionViewSideRefresh**](https://github.com/dangercheng/CollectionViewSideRefresh) ➤ **Objc**
* [**DGElasticPullToRefresh**](https://github.com/gontovnik/DGElasticPullToRefresh) ➤ **Swift**
* [**ESPullToRefresh**](https://github.com/eggswift/pull-to-refresh) ➤ **Swift**
