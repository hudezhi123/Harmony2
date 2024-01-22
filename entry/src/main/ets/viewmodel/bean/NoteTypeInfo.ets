export class NoteTypeInfo {
  noteTypeId: number;
  type: NoteType;
  unSelectedIcon: Resource;
  selectedIcon: Resource;
  name: string;

  constructor(noteTypeId: number = 0, type: NoteType = NoteType.OTHER, unSelectedIcon: Resource = undefined, selectedIcon: Resource=undefined, name: string="") {
    this.noteTypeId = noteTypeId;
    this.type = type;
    this.unSelectedIcon = unSelectedIcon;
    this.selectedIcon = selectedIcon;
    this.name = name;
  }
}

export enum NoteType {
  TRANSPORT, // 交通
  DELICIOUS, // 美食
  SHOPPING, // 购物
  LODGING, //住宿
  ENTERTAINMENT, // 休闲娱乐
  LIFE, // 生活支出
  EDUCATION, // 教育
  HEALTH, // 健康
  CHILD, // 孩子

  CASH_GIFT, // 礼金  结婚、红包等
  DEBT, //债务
  OTHER, // 其他
  INVEST, // 投资
  SALARY, //薪资
  REWARD, // 奖金
  EXPENSE, // 报销
  RECYCLE, // 回收
  PART_TIME, // 兼职

}
