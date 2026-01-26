# `JobsRefresher`

[toc]

## 一、开发动机

* 逐步舍弃[**MJRefresh**](https://github.com/CoderMJLee/MJRefresh)
  * 年久失修，不更新维护
  * OC代码，需要上升到纯Swift支持
  * 里面存在很多废弃代码
  * 不兼容[**Lottie**](https://github.com/airbnb/lottie-ios)动画，需要额外开支
  * 不支持水平方向的刷新和拉新
  * 不支持阿拉伯习惯（从右往左）

## 二、使用方式

### 1、`UITableView`（演示垂直）

```swift
private lazy var tableView: UITableView = {
    UITableView(frame: .zero, style: .plain)
        .byRowHeight(52)
        .byTableFooterView(UIView())
        .byDataSource(self)
        .byAddTo(view) { [unowned self] make in
            make.top.equalTo(topCollectionView.snp.bottom)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        // 下拉刷新 Header
        .configRefreshHeader(component: JobsDefaultHeader(),
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
        .configRefreshFooter(component: JobsDefaultFooter(),
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

### 2、`UICollectionView`（演示水平）

```swift
private lazy var collectionView: UICollectionView = {
    UICollectionView(frame: .zero, collectionViewLayout: hLayout)
       .byDataSource(self)
       .byDelegate(self)
       .registerCell(HCell.self)
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
       // 左侧拉：比如“上一页/回退”
       .configSideRefresh(with: JobsDefaultLeftRefresher(),
                          container: self,
                          at: .left,
                          trigger: 70) { [weak self] in
           guard let self else { return }
           jobsRunOnMain(self) { vc in
               try? await Task.sleep(nanoseconds: 900_000_000)
               // 模拟“刷新完成”：减少一个 item 并刷新
               self.hItems = max(8, self.hItems - 1)
               self.topCollectionView.byReloadData()
               self.topCollectionView.switchSideRefresh(.left, to: .normal)
           }
       }
       // 右侧拉：比如“下一页/加载更多卡片”
       .configSideRefresh(with: JobsDefaultRightRefresher(),
                                       container: self,
                                       at: .right,
                                       trigger: 70) { [weak self] in
           guard let self else { return }
           jobsRunOnMain(self) { vc in
               try? await Task.sleep(nanoseconds: 900_000_000)
               self.hItems += 3
               self.topCollectionView.byReloadData()
               self.topCollectionView.switchSideRefresh(.right, to: .normal)
           }
       }
}()
```

## 三、未尽事宜

* 横向左拉要显示上次刷新的时间
* 需要支持阿拉伯方式，即：
  * 从左到右拉 ➤ 拉新
  * 从右往左拉 ➤ 刷新
* 需要支持[**Lottie**](https://github.com/airbnb/lottie-ios)动画
* 需要支持静默刷新/加载 ➤ 完全隐藏刷新头和刷新尾的UI

## 四、特别鸣谢

* [**MJRefresh**](https://github.com/CoderMJLee/MJRefresh) ➤ 关键词：纵向刷新、Objc
* [**XZMRefresh**](https://github.com/xiezhongmin/XZMRefresh) ➤ 关键词：横向刷新、参考[**MJRefresh**](https://github.com/CoderMJLee/MJRefresh)、Objc
* 

