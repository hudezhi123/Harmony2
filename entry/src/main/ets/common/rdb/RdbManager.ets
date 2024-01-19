import relationalStore from '@ohos.data.relationalStore'
import hilog from '@ohos.hilog';


export default class RdbManager {
  private rdbStore: relationalStore.RdbStore | null = null;
  private static readonly TAG = "RdbManager";
  private tableName: string;
  private sqlCreateTable: string;
  private columns: Array<string>;
  readonly STORE_CONFIG: relationalStore.StoreConfig = {
    name: 'database.db',
    securityLevel: relationalStore.SecurityLevel.S1
  };

  constructor(tableName: string, sqlCreateTable: string, columns: Array<string>) {
    this.tableName = tableName;
    this.sqlCreateTable = sqlCreateTable;
    this.columns = columns;
  }

  getRdbStore(callback: Function = () => {
  }) {
    if (!callback || typeof callback === 'undefined' || callback === undefined) {
      return;
    }
    if (this.rdbStore !== null) {
      callback()
      return
    }
    let context: Context = getContext(this) as Context;
    relationalStore.getRdbStore(context, this.STORE_CONFIG, (err, rdb) => {
      if (err) {
        return;
      }
      this.rdbStore = rdb;
      this.rdbStore.executeSql(this.sqlCreateTable);
      callback();
    })
  }

  insert(data: relationalStore.ValuesBucket, callback: Function = () => {
  }) {
    if (!callback || typeof callback === 'undefined' || callback === undefined) {
      return;
    }
    let resFlag: boolean = false;
    const valueBucket: relationalStore.ValuesBucket = data
    if (this.rdbStore) {
      this.rdbStore.insert(this.tableName, valueBucket, (err, ret) => {
        if (err) {
          callback(resFlag)
          return;
        }
        callback(ret)
      })
    }
  }

  update(predicates: relationalStore.RdbPredicates, data: relationalStore.ValuesBucket, callback: Function = () => {
  }) {
    if (!callback || typeof callback === 'undefined' || callback === undefined) {
      return;
    }
    let resFlag: boolean = false;
    const valueBucket: relationalStore.ValuesBucket = data;
    if (this.rdbStore) {
      this.rdbStore.update(valueBucket, predicates, (err, ret) => {
        if (err) {
          callback(resFlag);
          return;
        }
        callback(!resFlag);
      })
    }
  }

  delete(predicates: relationalStore.RdbPredicates, bucketValue: relationalStore.ValuesBucket, callback: Function = () => {
  }) {
    if (!callback || typeof callback === 'undefined' || callback === undefined) {
      return;
    }
    let resFlag: boolean = false;
    if (this.rdbStore) {
      this.rdbStore.delete(predicates, (err, ret) => {
        if (err) {
          callback(resFlag);
          return;
        }
        callback(!resFlag);
      });
    }
  }

  query(predicates: relationalStore.RdbPredicates, callback: Function = () => {
  }) {
    if (!callback || typeof callback === 'undefined' || callback === undefined) {
      return;
    }
    if (this.rdbStore) {
      this.rdbStore.query(predicates, this.columns, (err, resultSet) => {
        if (err) {
          return;
        }
        callback(resultSet);
        resultSet.close();
      });
    }
  }
}
