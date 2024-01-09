import { TodoItem } from '../view/TodoItem'
import { TodoStateTitle } from '../view/TodoStateTitle'

@Entry
@Component
export struct TodoPage {
  build() {
    Column() {
      TodoStateTitle()

      Row() {
        Button("添加您的目标")
          .backgroundColor(Color.Orange)
          .width("100%")
      }
      .width("100%")
      .padding(10)

    }
    .backgroundColor("#f9f9f9")
    .width("100%")
    .height("100%")
  }
}
