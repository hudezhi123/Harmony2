import { TaskStateInfo } from '../viewmodel/TaskStateInfo'
import { TodoTask } from '../viewmodel/TodoTask'
import { TodoViewModel } from '../viewmodel/TodoViewModel'
import { TodoItem } from './TodoItem'

@Component
export struct TodoTaskList {
  @State todoTaskList: Array<TodoTask> = []
  @Consume taskStateInfo: TaskStateInfo;
  chosenTasks: number[] = []
  @State isSelectAll: boolean = false

  @Builder DeleteItemAction(index: number) {
    Button() {
      Image($r('app.media.ic_delete'))
        .fillColor(Color.White)
        .width(20)
    }
    .width(40)
    .height(40)
    .type(ButtonType.Circle)
    .backgroundColor(Color.Red)
    .margin(6)
    .onClick(() => {
      this.todoTaskList.splice(index, 1)
      this.taskStateInfo.totalTask = this.todoTaskList.length
      this.taskStateInfo.finishedTask = 0
    })
  }

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
        ForEach(this.todoTaskList, (taskInfo, index) => {
          ListItem() {
            TodoItem({ taskInfo:taskInfo })
          }
          .margin({ left: 10, right: 10 })
          .swipeAction({ end: this.DeleteItemAction(index), start: this.DeleteItemAction(index) })
        }, (taskInfo) => JSON.stringify(taskInfo))
      }.layoutWeight(1)

      Row() {
        Row() {
          Text("全选")
            .fontColor(Color.White)
          CheckboxGroup()
            .id(TodoViewModel.TODO_TASK_GROUP_ID)
            .selectAll(this.isSelectAll)
            .onChange((event) => {
              if (event.status === SelectStatus.All) {
                this.isSelectAll = true
              }
            })
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
        .onClick(() => {
          this.deleteTasks()
        })

      }
      .height(40)
      .width("95%")
      .backgroundColor("#fffa9898")
      .justifyContent(FlexAlign.SpaceAround)
      .borderRadius(25)
    }.height("100%")

  }

  deleteTasks() {
    let tasks: TodoTask[] = []
    this.todoTaskList.map((task) => {
      if (!task.isFinished) {
        tasks.push(task)
      }
    })
    this.todoTaskList = tasks
    this.taskStateInfo.totalTask = this.todoTaskList.length
    this.taskStateInfo.finishedTask = 0
    this.isSelectAll = false
  }

  addTask() {
    this.todoTaskList.push(new TodoTask())
    this.taskStateInfo.totalTask = this.todoTaskList.length
    this.isSelectAll = false
  }
}
