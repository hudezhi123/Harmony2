import { FunctionBean } from '../viewmodel/FunctionBean'

@Preview
@Component
export struct CommonItem {
  functionBean?: FunctionBean = new FunctionBean(1, $r("app.media.icon_favor_mine"), "待办事项")

  build() {
    Column() {
      Row() {
        if (this.functionBean.icon) {
          Image(this.functionBean.icon)
            .width(20)
            .height(20)
            .objectFit(ImageFit.Contain)
            .margin({ left: 10 })
        }
        Text(this.functionBean.displayName)
          .fontColor(Color.Black)
          .fontSize(16)
          .margin({ left: 10 })
        Blank()
        Image($r('app.media.ic_dark_right_arrow'))
          .width(20)
          .height(20)
          .margin({ right: 10 })
      }
      .height("100%")
      .width("100%")

      Divider()
        .height(1)
        .padding({ left: 10, right: 10 })
    }
    .justifyContent(FlexAlign.SpaceBetween)
    .height(40)
    .backgroundColor(Color.White)
    .borderRadius(6)
  }
}