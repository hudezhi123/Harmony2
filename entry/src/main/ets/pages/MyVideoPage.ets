import { TitleBar } from '../view/TitleBar';
@Entry
@Component
struct MyVideoPage {
  private controller: TabsController = new TabsController();
  @State curTabIndex: number = 0

  @Builder TabView(index: number, tabText: string = "在线视频") {

    Column() {
      Text(tabText)
        .fontColor(index === this.curTabIndex ? "#ffe100" : "#999999")
        .fontSize(index === this.curTabIndex ? 18 : 14)
        .fontWeight(index === this.curTabIndex ? FontWeight.Bold : FontWeight.Normal)
        .height(40)
      if (index === this.curTabIndex) {
        Divider()
          .width("100%")
          .height(4)
          .backgroundColor("#ffe100")
          .margin({ top: 4 })
      }
    }
  }

  build() {
    Column(){
      TitleBar({ titleName: "我的视频", rightActionType: TitleBar.ACTION_NONE })
      Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
        TabContent() {

        }.tabBar(this.TabView(0))

        TabContent() {

        }.tabBar(this.TabView(1, "离线视频"))
      }.onChange((index) => {
        this.curTabIndex = index
      })
    }
  }
}