import { FunctionBean } from '../viewmodel/FunctionBean'
import { CommonItem } from './CommonItem'

import mineViewModel from '../viewmodel/MineViewModel'

@Preview
@Component
export struct Mine {
  functionList: Array<FunctionBean> = []

  aboutToAppear() {
    this.functionList = mineViewModel.getFunctionList()
  }

  build() {
    Column() {
      Row() {
        Image($r("app.media.icon_header"))
          .width(50)
          .height(50)
          .borderRadius(25)
          .borderWidth(1)
          .borderColor(Color.Red)
          .margin({ left: 20 })
        Column() {
          Text("安之若素")
          Text(`id: ${1234567}`)
            .margin({ top: 4 })
            .fontColor("#999999")
        }
        .alignItems(HorizontalAlign.Start)
        .justifyContent(FlexAlign.Center)
        .height(50)
        .margin({ left: 20 })
      }
      .width("100%")
      .height(80)
      .backgroundColor(Color.White)
      .borderRadius(10)

      List({ space: 10 }) {
        ForEach(this.functionList, (functionBean: FunctionBean) => {
          ListItem() {
            CommonItem({ functionBean: functionBean })
          }.onClick(()=>{

          })
        }, (functionBean) => JSON.stringify(functionBean))
      }.margin({ top: 10, bottom: 10 })
      .padding({ bottom: 10 })

      Blank()

      Button("退出登录", { type: ButtonType.Capsule })
        .width("90%")
        .height(30)
        .backgroundColor("#ff7799")
        .margin({ bottom: 40 })
        .fontColor(Color.White)
    }
    .width("100%")
    .height("100%")
    .padding(10)
    .backgroundColor("#f9f9f9")
  }
}