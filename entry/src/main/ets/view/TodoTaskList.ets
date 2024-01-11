import { TaskStateInfo } from '../viewmodel/TaskStateInfo'
import { TodoTask } from '../viewmodel/TodoTask'
import { TodoViewModel } from '../viewmodel/TodoViewModel'
import { TodoItem } from './TodoItem'

@Component
export struct TodoTaskList {
  @State todoTaskList: Array<TodoTask> = []
  @Consume taskStateInfo: TaskStateInfo;
  chosenTasks: number[] = []

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
      }.layoutWeight(1)

      Row() {
        Row() {
          Text("全选")
            .fontColor(Color.White)
          CheckboxGroup()
            .id(TodoViewModel.TODO_TASK_GROUP_ID)
        }
        .height(40)
        .width(90)
        .backgroundColor("#aaaaaa")
        .borderRadius(25)
        .justifyContent(FlexAlign.Center)

        Button({ type: ButtonType.Capsule }) {
          Text("删除")
            .fontColor(Color.White)
        }
        .backgroundColor(Color.Red)
        .width(80)
        .height(40)

      }
      .height(40)
      .width("95%")
      .backgroundColor("#fffa9898")
      .justifyContent(FlexAlign.SpaceAround)
      .borderRadius(25)
    }.height("100%")

  }

  addTask() {
    this.todoTaskList.push(new TodoTask())
    this.taskStateInfo.totalTask = this.todoTaskList.length
  }
}
