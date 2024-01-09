@Preview
@Component
export struct TodoItem {
  build() {
    Row() {
      TextInput({ placeholder: "目标" })
        .fontSize(14)
        .width(160)
        .height(30)

      Checkbox().select(true).margin({left:60})
    }
    .justifyContent(FlexAlign.SpaceBetween)
    .backgroundColor(Color.White)
    .borderRadius(10)
    .padding({ left: 20, right: 20 })
    .margin({ left: 10, right: 10 })
  }
}