import { TitleBar } from '../view/TitleBar'
import { TodoStateTitle } from '../view/TodoStateTitle'


@Entry
@Component
export struct TodoPage {
  build() {
    Column() {
      TodoStateTitle()

      TitleBar({ titleName: "待办事项", rightActionType: TitleBar.ACTION_NONE })

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
