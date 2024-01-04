import { FunctionBean } from '../viewmodel/FunctionBean'
import { CommonItem } from './CommonItem'

@Preview
@Component
export struct Mine {
  functionList: Array<FunctionBean> = []

  build() {
    Column() {
      List({ space: 4 }) {
        ForEach(this.functionList, (functionBean: FunctionBean) => {
          ListItem(){
            CommonItem({functionBean:functionBean})
          }
        }, (functionBean) => JSON.stringify(functionBean))
      }
      .margin({ left: 10, right: 10 })
    }
    .width("100%")
    .height("100%")
    .backgroundColor("#f9f9f9")
  }
}