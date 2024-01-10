import { TaskStateInfo } from '../viewmodel/TaskStateInfo'
import { TodoTask } from '../viewmodel/TodoTask'
import { TodoItem } from './TodoItem'

@Component
export struct TodoTaskList {
  @State todoTaskList: Array<TodoTask> = []
  @Consume taskStateInfo: TaskStateInfo;

  build() {
    Column() {
      Row() {
        Button("添加您的目标")
          .backgroundColor(Color.Orange)
          .width("100%")
          .onClick(() => {
            this.addTask()
          })
      }
      .width("100%")
      .padding(10)

      List({ space: 10 }) {
        ForEach(this.todoTaskList, (taskInfo) => {
          ListItem() {
            TodoItem({ taskInfo })
          }
          .margin({ left: 10, right: 10 })
        }, (taskInfo) => JSON.stringify(taskInfo))
      }
    }.height("100%")
  }

  addTask() {
    this.todoTaskList.push(new TodoTask())
    this.taskStateInfo.totalTask = this.todoTaskList.length
  }
}
