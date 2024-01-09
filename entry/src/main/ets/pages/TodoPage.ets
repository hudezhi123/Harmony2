
import { TodoItem } from '../view/TodoItem'
import { TodoStateTitle } from '../view/TodoStateTitle'
import { TitleBar } from '../view/TitleBar'


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
      TitleBar({ titleName: "待办事项", rightActionType: TitleBar.ACTION_NONE })

    }
    .backgroundColor("#f9f9f9")
  }

  /**
   * 状态
   */
  @Builder TodoStatusBar(){

  }

  /**
   * 待办事项条目
   */
  @Builder TodoItem(){

  }

  @Builder TodoMenu(){
>>>>>>> 6117171 (optimize)

    }
    .backgroundColor("#f9f9f9")
    .width("100%")
    .height("100%")
  }
<<<<<<< HEAD
}
=======
}
>>>>>>> 6117171 (optimize)
