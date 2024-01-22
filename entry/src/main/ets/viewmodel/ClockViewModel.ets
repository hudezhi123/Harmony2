
import AlarmItem from './AlarmItem';
export class ClockViewModel {
  static instant: ClockViewModel = new ClockViewModel()

  private alarms:Array<AlarmItem>;
}