export class TaskStateInfo {
  finishedTask: number;
  totalTask: number;

  constructor(finishedTask: number, totalTask: number) {
    this.finishedTask = finishedTask;
    this.totalTask = totalTask;
  }
}