import { BottomTabItem } from './BottomTabItem'

export const BottomTabsList: Array<BottomTabItem> = [
  {
    icon: $r('app.media.ic_main_normal'),
    iconSelected: $r('app.media.ic_main_selected'),
    text: "首页"
  },
  {
    icon: $r('app.media.ic_trade_normal'),
    iconSelected: $r('app.media.ic_trade_selected'),
    text: "交易"
  },
  {
    icon: $r('app.media.ic_order_normal'),
    iconSelected: $r('app.media.ic_order_selected'),
    text: "订单"
  },
  {
    icon: $r('app.media.ic_mine_normal'),
    iconSelected: $r('app.media.ic_mine_selected'),
    text: "我的"
  }
]