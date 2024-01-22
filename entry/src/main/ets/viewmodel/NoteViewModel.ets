import TbBill from '../common/rdb/TbBill';
import { BillInfo } from './bean/BillInfo';
import { NoteType, NoteTypeInfo } from './bean/NoteTypeInfo';

export class NoteViewModel {
  static readonly PAY = 1;
  static readonly INCOME = 2;
  private tbBill = new TbBill(() => {
  });

  getPayTypeList(): Array<NoteTypeInfo> {
    return [
      new NoteTypeInfo(1001, NoteType.TRANSPORT, $r('app.media.icon_todo_mine'), $r('app.media.icon_todo_mine'), "交通"),
      new NoteTypeInfo(1002, NoteType.DELICIOUS, $r('app.media.icon_todo_mine'), $r('app.media.icon_todo_mine'), "餐饮"),
      new NoteTypeInfo(1003, NoteType.SHOPPING, $r('app.media.icon_todo_mine'), $r('app.media.icon_todo_mine'), "购物"),
      new NoteTypeInfo(1004, NoteType.LODGING, $r('app.media.icon_todo_mine'), $r('app.media.icon_todo_mine'), "住宿"),
      new NoteTypeInfo(1005, NoteType.ENTERTAINMENT, $r('app.media.icon_todo_mine'), $r('app.media.icon_todo_mine'), "休闲娱乐"),
      new NoteTypeInfo(1006, NoteType.LIFE, $r('app.media.icon_todo_mine'), $r('app.media.icon_todo_mine'), "日常生活"),
      new NoteTypeInfo(1007, NoteType.EDUCATION, $r('app.media.icon_todo_mine'), $r('app.media.icon_todo_mine'), "教育"),
      new NoteTypeInfo(1008, NoteType.HEALTH, $r('app.media.icon_todo_mine'), $r('app.media.icon_todo_mine'), "健康"),
      new NoteTypeInfo(1009, NoteType.CHILD, $r('app.media.icon_todo_mine'), $r('app.media.icon_todo_mine'), "孩子"),
      new NoteTypeInfo(1010, NoteType.CASH_GIFT, $r('app.media.icon_todo_mine'), $r('app.media.icon_todo_mine'), "礼金"),
      new NoteTypeInfo(1011, NoteType.DEBT, $r('app.media.icon_todo_mine'), $r('app.media.icon_todo_mine'), "债务"),
      new NoteTypeInfo(1012, NoteType.OTHER, $r('app.media.icon_todo_mine'), $r('app.media.icon_todo_mine'), "其他")
    ]
  }

  getIncomeTypeList(): Array<NoteTypeInfo> {
    return [
      new NoteTypeInfo(2001, NoteType.SALARY, $r('app.media.icon_todo_mine'), $r('app.media.icon_todo_mine'), "薪资"),
      new NoteTypeInfo(2002, NoteType.INVEST, $r('app.media.icon_todo_mine'), $r('app.media.icon_todo_mine'), "投资理财"),
      new NoteTypeInfo(2003, NoteType.CASH_GIFT, $r('app.media.icon_todo_mine'), $r('app.media.icon_todo_mine'), "礼金"),
      new NoteTypeInfo(2004, NoteType.REWARD, $r('app.media.icon_todo_mine'), $r('app.media.icon_todo_mine'), "奖金"),
      new NoteTypeInfo(2005, NoteType.DEBT, $r('app.media.icon_todo_mine'), $r('app.media.icon_todo_mine'), "债务"),
      new NoteTypeInfo(2006, NoteType.OTHER, $r('app.media.icon_todo_mine'), $r('app.media.icon_todo_mine'), "兼职"),
      new NoteTypeInfo(2004, NoteType.REWARD, $r('app.media.icon_todo_mine'), $r('app.media.icon_todo_mine'), "报销"),
      new NoteTypeInfo(2005, NoteType.DEBT, $r('app.media.icon_todo_mine'), $r('app.media.icon_todo_mine'), "回收"),
      new NoteTypeInfo(2006, NoteType.OTHER, $r('app.media.icon_todo_mine'), $r('app.media.icon_todo_mine'), "其他")
    ]
  }

  getBillInfoList(callback: Function = () => {
  }) {
    this.tbBill.getRdbStore(() => {
      this.tbBill.query(callback)
    })
  }


  deleteBillById(billId: number, callback: Function = () => {
  }) {
    this.tbBill.getRdbStore(() => {
      this.tbBill.deleteById(billId, callback)
    })

  }
}

let noteViewModel = new NoteViewModel();
export default noteViewModel;