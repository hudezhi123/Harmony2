import { TitleBar } from '../view/TitleBar'


@Entry
@Component
export struct TodoPage {
  build() {
    Column() {
      TitleBar({ titleName: "待办事项", rightActionType: TitleBar.ACTION_NONE })




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
  }

  /**
   * 状态
   */
  @Builder TodoStatusBar(){

  }

  /**
   * 状态
   */
  @Builder TodoStatusBar() {

  }

  /**
   * 待办事项条目
   */
  @Builder TodoItem() {

  }

  @Builder TodoMenu() {

  }

}

  /**
   * 待办事项条目
   */
  @Builder TodoItem(){

  }

  @Builder TodoMenu(){

  }
}