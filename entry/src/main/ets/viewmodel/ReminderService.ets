
import notificationManager from '@ohos.notificationManager'
import notification from '@ohos.notificationManager'
import reminderAgent from '@ohos.reminderAgentManager'
import Constants from '../common/Constants'
import ReminderItem from './ReminderItem'
export default class ReminderService{

  public openNotificationPermission(){
    notificationManager.requestEnableNotification().then(()=>{

    }).catch(()=>{

    })
  }

  public addReminder(alarmItem:ReminderItem,callback?:(reminderId:number)=>void){
    let reminder = this.
  }

  public initReminder(item:ReminderItem):reminderAgent.ReminderRequestAlarm{

    return {
      reminderType: item.remindType,
      hour: item.hour,
      minute: item.minute,
      daysOfWeek: item.repeatDays,
      title: item.name,
      ringDuration: item.duration * Constants.DEFAULT_TOTAL_MINUTE,
      snoozeTimes: item.intervalTimes,
      timeInterval: item.intervalMinute * Constants.DEFAULT_TOTAL_MINUTE,
      actionButton: [
        {
          title: '关闭',
          type: reminderAgent.ActionButtonType.ACTION_BUTTON_TYPE_CLOSE
        },
        {
          title: '稍后提醒',
          type: reminderAgent.ActionButtonType.ACTION_BUTTON_TYPE_SNOOZE
        },
      ],
      wantAgent: {
        pkgName: Constants.BUNDLE_NAME,
        abilityName: Constants.ABILITY_NAME
      },
      notificationId: item.notificationId,
      expiredContent: 'this reminder has expired',
      snoozeContent: 'remind later',
      slotType: notification.SlotType.SOCIAL_COMMUNICATION
    }
  }
}