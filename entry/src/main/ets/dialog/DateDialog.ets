@CustomDialog
export struct DateDialog {
  dialogTitle: string = "日期选择";
  controller: CustomDialogController;
  datePickerResult: DatePickerResult
  cancel: () => void
  confirm: (datePickerResult: DatePickerResult) => void

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
            this.confirm(this.datePickerResult)
          })
      }.width("100%")
      .justifyContent(FlexAlign.SpaceBetween)
      .margin({ bottom: 20 })

      DatePicker({
        start: new Date('2000-1-1'),
        end: new Date('2050-1-1')
      }).onChange((datePickerResult) => {
        this.datePickerResult = datePickerResult;
      })
    }.padding(20)
  }
}