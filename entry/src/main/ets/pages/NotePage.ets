import router from '@ohos.router'
import Prompt from '@system.prompt'
import Constants from '../common/Constants'
import { TitleBar } from '../view/TitleBar'
import { BillInfo } from '../viewmodel/bean/BillInfo'
import { NoteTypeInfo } from '../viewmodel/bean/NoteTypeInfo'
import noteViewModel from '../viewmodel/NoteViewModel'

@Component
@Entry
struct NotePage {
  @State billList: Array<BillInfo> = []

  aboutToAppear() {
  }

  onPageShow() {
    noteViewModel.getBillInfoList((billList: Array<BillInfo>) => {
      this.billList = billList;
    })
  }

  @Builder TotalSummaryView() {
    Row() {
      Column() {
        Text("2024年").fontSize(12).fontColor("#999999")
        Row() {
          Text() {
            Span("06").fontSize(20).fontWeight(FontWeight.Medium)
            Span("月").fontSize(14)
          }

          Image($r('app.media.icon_pull_down'))
            .width(10)
            .height(10)
            .objectFit(ImageFit.Contain)
            .margin({ left: 6 })
        }.margin({ top: 6 })
      }.alignItems(HorizontalAlign.Center)
      .width("30%")

      Divider().vertical(true).height(20).width(1)
      Column() {
        Text("收入").fontSize(12).fontColor("#999999")
        Text("12,345.12").fontSize(20).fontWeight(FontWeight.Medium).margin({ top: 6 })
      }.alignItems(HorizontalAlign.Center).width("35%")

      Divider().vertical(true).height(20).width(1)
      Column() {
        Text("支出").fontSize(12).fontColor("#999999")
        Text("12,345.12").fontSize(20).fontWeight(FontWeight.Medium).margin({ top: 6 })
      }.alignItems(HorizontalAlign.Center).width("35%").margin({ top: 4 })

    }
    .width("100%")
    .height(70)
    .alignItems(VerticalAlign.Center)
    .justifyContent(FlexAlign.SpaceEvenly)
  }

  @Builder BillItem(billInfo: BillInfo, noteTypeInfo: NoteTypeInfo) {
    Row() {
      Image(noteTypeInfo.selectedIcon).width(30).height(30).margin({ left: 15 })
      Column() {
        Text(noteTypeInfo.name).fontWeight(FontWeight.Medium).fontSize(18)
        Text(`${billInfo.time}`).fontColor("#999999").margin({ top: 4 })
      }
      .alignItems(HorizontalAlign.Start)
      .margin({ left: 10 })

      Blank()

      Text() {
        Span(billInfo.billType === BillInfo.PAY ? "-" : "").fontWeight(FontWeight.Bold)
        Span(`${billInfo.amount}`).fontWeight(FontWeight.Bold)
      }.margin({ right: 15 })
    }
    .borderRadius(10)
    .height(70)
    .width("90%")
    .backgroundColor(Color.White)
    .shadow({ radius: 6, color: '#1F000000', offsetX: 2, offsetY: 4 })
  }

  @Builder MoreItemAction(index: number) {
    Row() {
      Button() {
        Image($r('app.media.ic_delete'))
          .fillColor(Color.White)
          .width(20)
      }
      .width(40)
      .height(40)
      .type(ButtonType.Circle)
      .backgroundColor("#d81e06")
      .margin(6)
      .onClick(() => {
        this.deleteBill(index)
      })

      Button() {
        Image($r('app.media.icon_edit'))
          .fillColor(Color.White)
          .width(20)
      }
      .width(40)
      .height(40)
      .type(ButtonType.Circle)
      .backgroundColor("#1afa29")
      .margin(6)
      .onClick(() => {
        this.editBill(index)
      })
    }
  }

  /**
   * 删除
   */
  private deleteBill(index: number) {
    let billInfo = this.billList[index]
    noteViewModel.deleteBillById(billInfo.billId, (ret) => {
      if (ret) {
        animateTo({ duration: 10000 }, () => {
          this.billList.splice(index, 1)
        })
      } else {
        Prompt.showToast({ message: "删除失败！", duration: 1000 })
      }
    })
  }

  /**
   * 修改
   */
  private editBill(index: number) {
    let billInfo = this.billList[index]
    this.toCreateBill(billInfo.billId)
  }

  build() {

    Stack() {
      Column() {
        TitleBar({ titleName: "记账本" })
        this.TotalSummaryView()
        List({ space: 10 }) {
          ForEach(this.billList, (billInfo: BillInfo, index: number) => {
            ListItem() {
              this.BillItem(billInfo, this.getNoteTypInfoById(billInfo.billType, billInfo.noteTypeInfo.noteTypeId))
            }
            .swipeAction({ end: this.MoreItemAction(index) })
            .transition({ type: TransitionType.Delete, translate: { x: "100%", y: 0 }, opacity: 0 })
          }, (billInfo: BillInfo) => JSON.stringify(billInfo.billId))

        }
        .alignListItem(ListItemAlign.Center)
        .margin({ top: 20 })
        .width("100%")
        .layoutWeight(1)

      }.width("100%")
      .height("100%")

      Button() {
        Image($r('app.media.icon_create_record'))
          .width(20)
          .height(20)
          .objectFit(ImageFit.Contain)
      }
      .backgroundColor(Constants.THEME_YELLOW)
      .width(40)
      .height(40)
      .position({ x: "80%", y: "80%" })
      .onClick(() => {
        this.toCreateBill()
      })

    }.width("100%").height("100%").backgroundColor("#f9f9f9")

  }

  getNoteTypInfoById(billType: number, noteTypeId: number): NoteTypeInfo {
    let noteTypeList = billType === BillInfo.PAY ?
    noteViewModel
      .getPayTypeList()
      .filter((noteTypeInfo: NoteTypeInfo) => {
        return noteTypeInfo.noteTypeId === noteTypeId
      }) : noteViewModel.getIncomeTypeList().filter((noteTypeInfo) => {
      return noteTypeInfo.noteTypeId === noteTypeId
    })
    if (noteTypeList) {
      return noteTypeList[0];
    }
    return undefined
  }

  toCreateBill(billId: number = -1) {
    router.pushUrl({ url: "pages/AddBillPage", params: {
      billId: billId
    } }).catch((err) => {
    })
  }
}