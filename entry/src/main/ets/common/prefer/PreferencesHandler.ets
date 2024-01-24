import preferences from '@ohos.data.preferences'
import Constants from '../Constants';
import PreferencesListener from './PreferencesListener';

export default class PreferencesHandler {
  static instances: PreferencesHandler = new PreferencesHandler()
  private preferences: preferences.Preferences | null = null;
  private defaultValue = '';
  private listeners: PreferencesListener[];

  private constructor() {
    this.listeners = new Array();
  }

  public async configure(context: Context) {
    this.preferences = await preferences.getPreferences(context, Constants.PREFERENCE_ID);
    this.preferences.on('change', (data: Record<string, Object>) => {
      for (let preferencesListener of this.listeners) {
        preferencesListener.onDataChanged(data.key as string)
      }
    })
  }


  public async set(key:string,value:string){
    if(this.preferences!==null){
      await this.preferences.put(key,value);
      await this.preferences.flush();
    }
  }

  public async get(key:string){
    let data:string = '';
    if(this.preferences!=null){
      data = await this.preferences.get(key,this.defaultValue) as string;
    }
    return data;
  }


  public clear(){
    if(this.preferences!=null){
      this.clear();
    }
  }

  public addPreferencesListener(listener:PreferencesListener){
    this.listeners.push(listener);
  }
}