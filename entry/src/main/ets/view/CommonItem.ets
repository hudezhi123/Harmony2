import { FunctionBean } from '../viewmodel/FunctionBean'

@Preview
@Component
export struct CommonItem {
  functionBean?: FunctionBean

  build() {
    Column() {
      Row() {
        if (this.functionBean.icon) {
          Image(this.functionBean.icon).width(30).height(30)
        }
        Text(this.functionBean.displayName)
          .fontColor(Color.Black)
          .fontSize(16)
          .margin({ left: 20 })
        Image($r('app.media.ic_dark_right_arrow'))
          .width(20)
          .height(20)
          .margin({ right: 10 })
      }
      .height("100%")
      .width("100%")
      .justifyContent(FlexAlign.SpaceBetween)

      Divider()
        .padding({ left: 10, right: 10 })
    }
    .justifyContent(FlexAlign.SpaceBetween)
    .height(40)
    .backgroundColor(Color.White)
    .borderRadius(6)
  }
}