import { TaskStateInfo } from '../viewmodel/TaskStateInfo';

@Preview
@Component
struct TodoStateTitle {
  @State taskStateInfo: TaskStateInfo = new TaskStateInfo(3, 5);

  build() {
    Row({ space: 10 }) {
      Text("待完成目标: ").fontWeight(FontWeight.Bold)
      Progress({
        type: ProgressType.Capsule,
        value: this.taskStateInfo.finishedTask,
        total: this.taskStateInfo.totalTask
      })
        .height(40)
        .layoutWeight(1)
        .color(Color.Orange)
      Text() {
        Span(`${this.taskStateInfo.finishedTask}`)
          .fontColor(Color.Orange).fontWeight(FontWeight.Bold)
          .fontSize(18)
        Span(` / ${this.taskStateInfo.totalTask}`)
          .fontColor(Color.Red).fontWeight(FontWeight.Bold)
          .fontSize(14)
      }
      .fontWeight(FontWeight.Medium)
    }
    .borderRadius(10)
    .backgroundColor(Color.White)
    .margin({ left: 10, right: 10, top: 16, bottom: 16 })
    .padding(12)
  }
}