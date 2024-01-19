import { FunctionBean } from './FunctionBean'

export class MineViewModel {
  getFunctionList(): Array<FunctionBean> {

    return [
      new FunctionBean(0, $r('app.media.icon_todo_mine'), "待办事项", "pages/TodoPage"),
      new FunctionBean(1, $r('app.media.icon_favor_mine'), "我的收藏"),
      new FunctionBean(2, $r('app.media.icon_todo_mine'), "我的视频", "pages/MyVideoPage"),
      new FunctionBean(3, $r('app.media.icon_node_cash'), "我的账单", "pages/NotePage"),
      new FunctionBean(4, $r('app.media.icon_todo_mine'), "健康生活", "pages/HealthyLifePage"),
      new FunctionBean(5, $r('app.media.icon_todo_mine'), "待办事项"),
      new FunctionBean(6, $r('app.media.icon_todo_mine'), "待办事项"),
      new FunctionBean(7, $r('app.media.icon_todo_mine'), "待办事项")
    ]
  }
}

let mineViewModel = new MineViewModel()

export default mineViewModel