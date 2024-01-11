import { TitleBar } from '../view/TitleBar'
import { TodoItem } from '../view/TodoItem'
import { TodoStateTitle } from '../view/TodoStateTitle'
import { TodoTaskList } from '../view/TodoTaskList'
import { TaskStateInfo } from '../viewmodel/TaskStateInfo'
import { TodoTask } from '../viewmodel/TodoTask'



@Entry
@Component
struct TodoPage {
  @Provide taskStateInfo: TaskStateInfo = new TaskStateInfo()

  build() {
    Column() {
      TitleBar({ titleName: "待办事项", rightActionType: TitleBar.ACTION_NONE })
      TodoStateTitle()
      TodoTaskList()
        .layoutWeight(1)
        .margin({bottom:70})
    }
    .backgroundColor("#f7f7f7")
    .width("100%")
    .height("100%")
  }
}


