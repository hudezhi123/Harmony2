import { TaskStateInfo } from '../viewmodel/TaskStateInfo';
import { TodoTask } from '../viewmodel/TodoTask'

@Component
export struct TodoItem {
  @ObjectLink taskInfo: TodoTask;
  @Consume taskStateInfo: TaskStateInfo;

  build() {
    Row() {
      TextInput({ text: this.taskInfo.destName, placeholder: "请输入你的目标" })
        .fontSize(14)
        .width(160)
        .height(30)
        .padding({ left: 10, top: 0, bottom: 0 })

      Checkbox().select(this.taskInfo.isFinished).margin({ left: 60 })
        .onChange((isChecked) => {
          this.taskInfo.isFinished = isChecked
          if (isChecked) {
            this.taskStateInfo.finishedTask++;
          } else {
            this.taskStateInfo.finishedTask--;
          }
        })
    }
    .justifyContent(FlexAlign.SpaceBetween)
    .backgroundColor(Color.White)
    .borderRadius(10)
    .width("100%")
    .padding({ left: 20, right: 20, top: 12, bottom: 12 })
    .shadow({ radius: 6, color: '#1F000000', offsetX: 2, offsetY: 4 })
  }
}