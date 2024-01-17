import router from '@ohos.router'
import Constants from '../common/Constants'
import { TitleBar } from '../view/TitleBar'

@Component
@Entry
struct NotePage {
  @Builder TotalSummaryView() {
    Row() {

      Column() {
        Text("2024年").fontSize(12).fontColor("#999999")
        Row() {
          Text() {
            Span("06").fontSize(20).fontWeight(FontWeight.Medium)
            Span("月").fontSize(14)
          }

          Image($r('app.media.icon_pull_down'))
            .width(10)
            .height(10)
            .objectFit(ImageFit.Contain)
            .margin({left:6})
        }.margin({top:6})
      }.alignItems(HorizontalAlign.Center)
      .width("30%")

      Divider().vertical(true).height(20).width(1)
      Column() {
        Text("收入").fontSize(12).fontColor("#999999")
        Text("12,345.12").fontSize(20).fontWeight(FontWeight.Medium).margin({top:6})
      }.alignItems(HorizontalAlign.Center) .width("35%")

      Divider().vertical(true).height(20).width(1)
      Column() {
        Text("支出").fontSize(12).fontColor("#999999")
        Text("12,345.12").fontSize(20).fontWeight(FontWeight.Medium).margin({top:6})
      }.alignItems(HorizontalAlign.Center) .width("35%").margin({top:4})

    }
    .width("100%")
    .height(70)
    .alignItems(VerticalAlign.Center)
    .justifyContent(FlexAlign.SpaceEvenly)
  }

  build() {

    Stack() {
      Column() {
        TitleBar({ titleName: "记账本" })
        this.TotalSummaryView()
      }.width("100%")
      .height("100%")

      Button() {
        Image($r('app.media.icon_create_record'))
          .width(20)
          .height(20)
          .objectFit(ImageFit.Contain)
      }.backgroundColor(Constants.THEME_YELLOW)
      .width(40)
      .height(40)
      .position({ x: "80%", y: "80%" })
      .onClick(()=>{

      })

    }.width("100%").height("100%")

  }

  toCreateBill(){
    router.pushUrl({url:"pages/AddBillPage"})
  }
}