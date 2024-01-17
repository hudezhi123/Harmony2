@Component
@Preview
export struct TimeDialog {
  timeResult: TimePickerResult
  dialogTitle: string = "时间选择";
  controller: CustomDialogController;
  cancel: () => void
  confirm: (timeResult: TimePickerResult) => void

  build() {
    Column() {
      Row() {
        Text("取消")
          .alignSelf(ItemAlign.Start)
          .fontColor("#1296db")
          .fontSize(18)
        Text(this.dialogTitle).fontSize(18)
          .onClick(() => {
            this.controller.close()
            this.cancel()
          })
        Text("确定").alignSelf(ItemAlign.End)
          .fontColor("#1296db")
          .fontSize(18)
          .onClick(() => {
            this.controller.close()
            this.confirm(this.timeResult)
          })
      }.width("100%")
      .justifyContent(FlexAlign.SpaceBetween)
      .margin({ bottom: 20 })

      TimePicker()
        .onChange((timeResult) => {
          this.controller.close()
          this.timeResult = timeResult
        })
    }.padding(20)
  }
}