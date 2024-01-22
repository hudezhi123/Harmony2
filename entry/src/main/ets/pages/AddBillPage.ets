import systemDateTime from '@ohos.systemDateTime';
import Prompt from '@system.prompt';
import router from '@ohos.router';
import TbBill from '../common/rdb/TbBill';
import { DateDialog } from '../dialog/DateDialog';
import { TimeDialog } from '../dialog/TimeDialog';
import { TitleBar } from '../view/TitleBar'
import { BillInfo } from '../viewmodel/bean/BillInfo';
import { NoteTypeInfo } from '../viewmodel/bean/NoteTypeInfo';
import noteViewModel from '../viewmodel/NoteViewModel';


@Entry
@Component
struct AddBillPage {
  static readonly TAG: string = "AddBillPage"
  @State chosenIndex: number = -1
  @State isCheckedPay: boolean = true
  @State chosenDate: string = ""
  @State chosenTime: string = ""
  private tbBill = new TbBill(() => {
  });
  @State billInfo: BillInfo = new BillInfo()
  private isEdit = false
  timeDialogController: CustomDialogController = new CustomDialogController({
    builder: TimeDialog({
      cancel: () => {
        this.timeDialogController.close()
      },
      confirm: (timeResult) => {
        this.chosenTime = this.formatTime(timeResult.hour, timeResult.minute)
        this.timeDialogController.close()
      }
    }),
    autoCancel: true,
    gridCount: 4,
    alignment: DialogAlignment.Default,
    customStyle: false
  });
  dateDialogController: CustomDialogController = new CustomDialogController({
    builder: DateDialog({
      cancel: () => {
        this.dateDialogController.close()
      },
      confirm: (dateResult) => {
        this.chosenDate = dateResult.year + "-" + this.formatTime(dateResult.month, dateResult.day)
        this.dateDialogController.close()
      }
    }),
    autoCancel: true,
    gridCount: 4,
    alignment: DialogAlignment.Default,
    customStyle: false
  });

  aboutToAppear() {
    let billId = router.getParams()['billId']
    if (billId !== -1 && billId) {
      this.isEdit = true
      this.queryBillById(billId)
    } else {
      this.isEdit = false
      this.billInfo.billType = BillInfo.PAY
      systemDateTime.getDate().then((date: Date) => {
        this.chosenDate = date.getFullYear() + "-" + this.formatDate(date.getMonth() + 1, date.getDate())
        this.chosenTime = this.formatTime(date.getHours(), date.getMinutes())
        this.billInfo.time = `${this.chosenDate + " " + this.chosenTime}`
      }).catch((err) => {
        console.log(AddBillPage.TAG, err)
      })
    }


  }

  formatTime(hour: number, minute: number): string {
    return this.format(hour) + ":" + this.format(minute);
  }

  formatDate(month: number, day: number): string {
    return this.format(month) + "-" + this.format(day);
  }

  format(no: number): string {
    return no < 10 ? `0${no}` : no.toString()
  }

  aboutToDisappear() {
    this.timeDialogController.close()
    this.dateDialogController.close()
    this.timeDialogController = undefined
    this.dateDialogController = undefined
  }

  build() {
    Column() {
      TitleBar({
        leftCallBack: () => {
          router.back()
        },
        titleName: "新建账单"
      })
      Row() {
        Text('支出')
          .fontColor(Color.White)
          .borderRadius({ bottomLeft: 20, topLeft: 20 })
          .width(80)
          .textAlign(TextAlign.Center)
          .height("100%")
          .backgroundColor(this.isCheckedPay ? "#1296db" : "#9a9a9a")
          .onClick(() => {
            this.isCheckedPay = true
            this.billInfo.billType = BillInfo.PAY
          })
        Text('收入')
          .fontColor(Color.White)
          .height("100%")
          .textAlign(TextAlign.Center)
          .borderRadius({ topRight: 20, bottomRight: 20 })
          .backgroundColor(!this.isCheckedPay ? "#1296db" : "#9a9a9a")
          .width(80)
          .onClick(() => {
            this.isCheckedPay = false
            this.billInfo.billType = BillInfo.INCOME
          })
      }
      .width(160)
      .height(35)
      .borderRadius(20)
      .justifyContent(FlexAlign.SpaceEvenly)
      .margin({ top: 20 })

      Row() {
        Text("日期：").fontWeight(FontWeight.Medium)
        Text(this.chosenDate)
          .layoutWeight(1)
        Image($r('app.media.icon_date_tag'))
          .width(20)
          .height(20).onClick(() => {
          this.showDatePickerDialog()
        })
      }.height(60).margin({ left: 20, right: 20 })

      Divider().width("100%").padding({ left: 20, right: 20 })
      Row() {
        Text("时间：").fontWeight(FontWeight.Medium)
        Text(this.chosenTime).layoutWeight(1)
        Image($r('app.media.icon_time_tag'))
          .width(20)
          .height(20).onClick(() => {
          this.showTimePickerDialog()
        })
      }.height(60).margin({ left: 20, right: 20 })

      Divider().width("100%").padding({ left: 20, right: 20 })
      Row() {
        Image($r('app.media.icon_rmb')).width(20).height(20).objectFit(ImageFit.Contain)
        TextInput({ text: `${this.billInfo.amount}` })
          .backgroundColor(Color.White)
          .padding({ left: 4 })
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
          .type(InputType.Normal)
          .margin({ right: 20 })
          .onChange((value) => {
            this.billInfo.amount = value
          })
      }.height(60).margin({ left: 20, right: 20 })

      Divider().width("100%").padding({ left: 20, right: 20 })

      Row() {
        Text("备注：").fontWeight(FontWeight.Medium)
        TextInput({ text: this.billInfo.mark })
          .backgroundColor(Color.White)
          .fontSize(18)
          .padding({ left: 0 })
          .type(InputType.Normal)
          .layoutWeight(1)
          .onChange((value) => {
            this.billInfo.mark = value
          })
      }.height(60).width("100%").padding({ left: 20, right: 20 })

      Divider().width("100%").padding({ left: 20, right: 20 })

      Grid() {
        ForEach(this.isCheckedPay ? noteViewModel.getPayTypeList() : noteViewModel.getIncomeTypeList(), (typeInfo: NoteTypeInfo, index: number) => {
          GridItem() {
            this.ItemTypeView(typeInfo, index)
          }
        }, (typeInfo: NoteTypeInfo) => JSON.parse(typeInfo.noteTypeId.toString()))
      }
      .columnsTemplate("1fr 1fr 1fr 1fr 1fr")
      .width("100%")
      .rowsGap(20)
      .layoutWeight(1)
      .padding(20)
      .margin({ top: 20 })

      Button("保存").width(200).height(40).onClick(() => {
        if (this.isEdit) {
          this.updateBillInfo()
        } else {
          this.saveBillInfo()
        }
      }).margin({ bottom: 50 })
    }
  }

  @Builder ItemTypeView(noteType: NoteTypeInfo, index: number) {
    Column() {
      Stack() {
        Image(this.chosenIndex === index ? noteType.selectedIcon : noteType.unSelectedIcon)
          .width(25)
          .height(25)
          .objectFit(ImageFit.Contain)
      }.width(40).height(40)
      .backgroundColor(this.chosenIndex === index ? "#331296db" : "#00000000")
      .borderRadius(8)

      Text(noteType.name)
        .fontColor(this.chosenIndex === index ? "#1296db" : "#999999")
        .margin({ top: 4 })
    }.onClick(() => {
      this.chosenIndex = index;
      this.billInfo.noteTypeInfo = noteType
    })
  }

  showDatePickerDialog() {
    this.dateDialogController.open()
  }

  showTimePickerDialog() {
    this.timeDialogController.open()
  }

  saveBillInfo() {
    if (this.billInfo.amount && this.billInfo.noteTypeInfo) {
      this.tbBill.getRdbStore(() => {
        this.tbBill.insert(this.billInfo, (ret) => {
          if (ret) {
            Prompt.showToast({ message: "保存成功！" })
            router.back()
          } else {
            Prompt.showToast({ message: "保存失败！" })
          }
        })
      })
    } else {
      Prompt.showToast({ message: "填写信息", duration: 1000 })
    }

  }

  updateBillInfo() {
    this.tbBill.update(this.billInfo, (ret) => {
      if (ret) {
        Prompt.showToast({ message: "更新成功！" })
        router.back()
      } else {
        Prompt.showToast({ message: "更新失败！" })
      }
    })
  }

  queryBillById(billId: number) {
    this.tbBill.getRdbStore(() => {
      this.tbBill.queryById(billId, (billInfo: BillInfo) => {
        this.billInfo = billInfo
        let noteTypeId = billInfo.noteTypeInfo.noteTypeId
        let fullTime = billInfo.time.split(" ")
        this.chosenDate = fullTime[0]
        this.chosenTime = fullTime[1]
        this.isCheckedPay = this.billInfo.billType === BillInfo.PAY
        let list = this.isCheckedPay ? noteViewModel.getPayTypeList() : noteViewModel.getIncomeTypeList()
        this.chosenIndex = list.findIndex((noteTypeInfo: NoteTypeInfo) => {
          return noteTypeInfo.noteTypeId === noteTypeId
        })
      })
    })
  }
}