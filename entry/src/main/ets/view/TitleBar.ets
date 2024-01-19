import router from '@ohos.router'

@Preview
@Component
export struct TitleBar {
  titleName: string = "标题";
  rightActionType: number = 0;
  rightContent: Resource | string;
  leftCallBack?: () => void
  rightCallback?: () => void
  static readonly ACTION_NONE: number = 0
  static readonly ACTION_TEXT: number = 1
  static readonly ACTION_IMG: number = 2

  build() {

   Column(){

     Row() {
       Image($r("app.media.ic_dark_right_arrow"))
         .rotate({ angle: 180 })
         .width(24)
         .padding(5)
         .onClick(() => {
           if (this.leftCallBack) {
             this.leftCallBack()
           } else {
             router.back()
           }

         })
       Text(this.titleName)
         .fontSize(18)
         .fontColor(Color.Black)
         .fontWeight(FontWeight.Medium)
       if (this.rightActionType === TitleBar.ACTION_TEXT) {
         Text(this.rightContent).onClick(() => {
           this.rightCallback()
         })
       } else if (this.rightActionType === TitleBar.ACTION_IMG) {
         Image(this.rightContent).width(20).height(20).onClick(() => {
           this.rightCallback()
         })
       } else {
         Text().width(20).height(20)
       }
     }
     .width("100%")
     .backgroundColor(Color.White)
     .justifyContent(FlexAlign.SpaceBetween)
     .height(48).margin({top:22})
   }.height(70)
  }
}