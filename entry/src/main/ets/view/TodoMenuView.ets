
@Component
export struct TodoMenuView {
  build() {
    Row() {
      Row() {
        Text("全选")
          .fontColor(Color.White)
        CheckboxGroup()
      }.height(40)
      .width(90)
      .backgroundColor("#aaaaaa")
      .borderRadius(25)
      .justifyContent(FlexAlign.Center)

      Button({ type: ButtonType.Capsule }) {
        Text("删除")
          .fontColor(Color.White)
      }
      .backgroundColor(Color.Red)
      .width(80)
      .height(40)

    }
    .height(40)
    .width("95%")
    .backgroundColor("#fffa9898")
    .justifyContent(FlexAlign.SpaceAround)
    .borderRadius(25)
  }
}