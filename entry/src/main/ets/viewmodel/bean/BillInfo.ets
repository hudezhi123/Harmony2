import { NoteTypeInfo } from './NoteTypeInfo';

export class BillInfo {
  billId: number; // id
  billType: number; // 收入 还是 支出
  amount: number; // 金额
  mark: string; // 备注
  time: number; // 时间
  address: string; // 地点
  photos?: string; // 照片证明，可以没有  照片路径，以 ； 隔开
  noteTypeId: number; // 交通/生活费等
}