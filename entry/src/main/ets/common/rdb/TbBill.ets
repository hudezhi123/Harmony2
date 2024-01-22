import relationalStore from '@ohos.data.relationalStore';
import { BillInfo } from '../../viewmodel/bean/BillInfo';
import { NoteTypeInfo } from '../../viewmodel/bean/NoteTypeInfo';
import RdbManager from './RdbManager';

export default class TbBill {
  static readonly TABLE = {
    tableName: "tableBill",
    sqlCreate: 'CREATE TABLE IF NOT EXISTS tableBill(billId INTEGER PRIMARY KEY AUTOINCREMENT, billType INTEGER, amount DOUBLE,mark TEXT,time TEXT,address TEXT,photos TEXT,noteTypeId INTEGER)',
    columns: [
      'billId', // id
      'billType', // 收入 还是 支出
      'amount', // 金额
      'mark', // 备注
      'time', // 时间
      'address', // 地点
      'photos', // 照片证明，可以没有  照片路径，以 ； 隔开
      'noteTypeId' // 交通/生活费等
    ]
  }
  private rdbManager = new RdbManager(TbBill.TABLE.tableName, TbBill.TABLE.sqlCreate, TbBill.TABLE.columns)

  constructor(callback: Function = () => {
  }) {
    this.rdbManager.getRdbStore(callback)
  }

  getRdbStore(callback: Function = () => {
  }) {
    this.rdbManager.getRdbStore(callback)
  }

  insert(billInfo: BillInfo, callback: Function = () => {
  }) {
    const valueBucket: relationalStore.ValuesBucket = generateBucket(billInfo)
    this.rdbManager.insert(valueBucket, callback)
  }

  update(billInfo: BillInfo, callback: Function = () => {
  }) {
    const valueBucket: relationalStore.ValuesBucket = generateBucket(billInfo)
    let predicates = new relationalStore.RdbPredicates(TbBill.TABLE.tableName);
    this.rdbManager.update(predicates, valueBucket, callback)
  }

  delete(billInfo: BillInfo, callback: Function) {
    let predicates = new relationalStore.RdbPredicates(TbBill.TABLE.tableName);
    predicates.equalTo('billId', billInfo.billId);
    this.rdbManager.delete(predicates, callback);
  }

  deleteById(billId: number, callback: Function) {
    let predicates = new relationalStore.RdbPredicates(TbBill.TABLE.tableName);
    predicates.equalTo('billId', billId);
    this.rdbManager.delete(predicates, callback);
  }

  query(callback: Function = () => {}) {
    let predicates = new relationalStore.RdbPredicates(TbBill.TABLE.tableName)
    this.rdbManager.query(predicates, (resultSet: relationalStore.ResultSet) => {
      let count: number = resultSet.rowCount;
      if (count === 0 || typeof count === 'string') {
        callback([])
      } else {
        resultSet.goToFirstRow();
        const result: Array<BillInfo> = [];
        for (let i = 0;i < count; i++) {
          let tmp: BillInfo = new BillInfo();
          tmp.billId = resultSet.getLong(resultSet.getColumnIndex('billId'));
          tmp.billType = resultSet.getLong(resultSet.getColumnIndex('billType'));
          tmp.amount = resultSet.getDouble(resultSet.getColumnIndex('amount'));
          tmp.mark = resultSet.getString(resultSet.getColumnIndex('mark'));
          tmp.time = resultSet.getString(resultSet.getColumnIndex('time'));
          tmp.address = resultSet.getString(resultSet.getColumnIndex('address'));
          tmp.photos = resultSet.getString(resultSet.getColumnIndex('photos'));
          tmp.noteTypeInfo = {
            noteTypeId : resultSet.getLong(resultSet.getColumnIndex('noteTypeId'))
          } as NoteTypeInfo
          result[i] = tmp;
          resultSet.goToNextRow();
        }
        callback(result)
      }
    });
  }

  queryById(billId:number,callback:Function=()=>{}){
    let predicates = new relationalStore.RdbPredicates(TbBill.TABLE.tableName);
    predicates.equalTo('billId',billId).distinct();
    this.rdbManager.query(predicates,(resultSet:relationalStore.ResultSet)=>{
      let count: number = resultSet.rowCount;
      if (count === 0 || typeof count === 'string') {
        callback(null)
      }else{
        resultSet.goToFirstRow();
        let tmp: BillInfo = new BillInfo();
        tmp.billId = resultSet.getLong(resultSet.getColumnIndex('billId')),
        tmp.billType = resultSet.getLong(resultSet.getColumnIndex('billType')),
        tmp.amount = resultSet.getDouble(resultSet.getColumnIndex('amount')),
        tmp.mark = resultSet.getString(resultSet.getColumnIndex('mark')),
        tmp.time = resultSet.getString(resultSet.getColumnIndex('time')),
        tmp.address = resultSet.getString(resultSet.getColumnIndex('address')),
        tmp.photos = resultSet.getString(resultSet.getColumnIndex('photos')),
        tmp.noteTypeInfo = {
          noteTypeId : resultSet.getLong(resultSet.getColumnIndex('noteTypeId'))
        } as NoteTypeInfo
        callback(tmp)
      }
    })
  }
}


/**
 * @param billInfo
 * @returns
 */
function generateBucket(billInfo: BillInfo): relationalStore.ValuesBucket {
  let bucket: relationalStore.ValuesBucket = {
    billType: billInfo.billType,
    amount: billInfo.amount,
    mark: billInfo.mark,
    time: billInfo.time,
    address: billInfo.address,
    photos: billInfo.photos,
    noteTypeId: billInfo.noteTypeInfo.noteTypeId
  };

  return bucket;
}