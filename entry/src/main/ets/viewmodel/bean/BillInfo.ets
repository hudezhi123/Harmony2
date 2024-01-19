import { NoteTypeInfo } from './NoteTypeInfo';

export class BillInfo {
  static readonly PAY = 1;
  static readonly INCOME = 2;
  billId: number; // id
  billType: number = BillInfo.PAY; // 收入 还是 支出
  amount: number | string = 100; // 金额
  mark: string = ""; // 备注
  time: string = ""; // 时间
  address: string = ""; // 地点
  photos?: string = ""; // 照片证明，可以没有  照片路径，以 ； 隔开
  noteTypeInfo: NoteTypeInfo; // 交通/生活费等
}