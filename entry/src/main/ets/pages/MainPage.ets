import { Main } from '../view/MainView';
import { Mine } from '../view/MineView';
import { Orders } from '../view/OrdersView';
import { Trade } from '../view/TradeView';
import { BottomTabsList } from '../viewmodel/BottomTabsModel';


@Entry
@Component
struct MainPage {
  @State @Watch('onIndexChanged') bottomTabIndex: number = 0;
  private controller: TabsController = new TabsController();

  onIndexChanged() {

  }

  @Builder TabBuilder(index: number) {
    Column() {
      Image(this.bottomTabIndex === index ? BottomTabsList[index].iconSelected : BottomTabsList[index].icon)
        .width(30)
        .height(30)
        .objectFit(ImageFit.Contain)

      Text(BottomTabsList[index].text)
        .fontSize(12)
        .opacity(0.6)
        .fontColor(this.bottomTabIndex === index ?
          "#ffe100" : "#000000")
        .margin({ top: 4 })
    }
  }

  build() {
    Flex({
      direction: FlexDirection.Column,
      alignItems: ItemAlign.End,
      justifyContent: FlexAlign.End
    }) {
      Tabs({ barPosition: BarPosition.End, index: 0, controller: this.controller }) {
        TabContent() {
          Main()
        }.tabBar(this.TabBuilder(0))

        TabContent() {
          Trade()
        }.tabBar(this.TabBuilder(1))

        TabContent() {
          Orders()
        }.tabBar(this.TabBuilder(2))

        TabContent() {
          Mine()
        }.tabBar(this.TabBuilder(3))
      }
      .barHeight("10%")
      .onChange((index: number) => {
        this.bottomTabIndex = index;
      })
    }
    .width("100%")
    .height("100%")
  }
}