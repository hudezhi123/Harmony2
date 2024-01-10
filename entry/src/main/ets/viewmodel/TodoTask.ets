@Observed
export class TodoTask {
  static total: number = 1;
  id: number = TodoTask.total++;
  destName: string = "目标";
  isFinished: boolean = false;
}