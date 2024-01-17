import { DateDialog } from '../dialog/DateDialog';
import { TimeDialog } from '../dialog/TimeDialog';
import { TitleBar } from '../view/TitleBar'
import { NoteTypeInfo } from '../viewmodel/bean/NoteTypeInfo';
import noteViewModel from '../viewmodel/NoteViewModel';


@Entry
@Component
struct AddBillPage {
  @State chosenIndex: number = -1
  @State isCheckedPay: boolean = true

  // timeDialogController: CustomDialogController = new CustomDialogController({
  //   builder: TimeDialog({
  //     cancel:()=>{
  //
  //     },
  //     confirm:(timeResult)=>{
  //
  //     }
  //   }),
  //   autoCancel: true,
  //   gridCount: 4,
  //   alignment: DialogAlignment.Default,
  //   customStyle: false
  // });
  // dateDialogController: CustomDialogController = new CustomDialogController({
  //   builder:DateDialog({
  //     cancel:()=>{
  //
  //     },
  //     confirm:(dateResult)=>{
  //
  //     }
  //   }),
  //   autoCancel: true,
  //   gridCount: 4,
  //   alignment: DialogAlignment.Default,
  //   customStyle: false
  // });

  build() {
    Column() {
      TitleBar({
        leftCallBack: () => {
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
          })
      }
      .width(160)
      .height(35)
      .borderRadius(20)
      .justifyContent(FlexAlign.SpaceEvenly)
      .margin({ top: 20 })

      Row() {
        Text("日期：")

        Text()
      }.height(60).margin({ left: 20, right: 20 })

      Row() {
        Text("日期：")

        Text()
      }.height(60).margin({ left: 20, right: 20 })

      Divider().width("100%").padding({ left: 20, right: 20 })
      Row() {
        Image($r('app.media.icon_rmb')).width(20).height(20).objectFit(ImageFit.Contain)
        TextInput()
          .backgroundColor(Color.White)
          .padding({ left: 4 })
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
          .type(InputType.Number)
      }.height(60).margin({ left: 20, right: 20 })

      Divider().width("100%").padding({ left: 20, right: 20 })

      Row() {
        Text("备注：")
        TextInput()
          .backgroundColor(Color.White)
          .fontSize(18)
          .padding({ left: 0 })
      }.height(60).margin({ left: 20, right: 20 })

      Divider().width("100%").padding({ left: 20, right: 20 })

      Grid() {
        ForEach(noteViewModel.getPayTypeList(), (typeInfo: NoteTypeInfo, index: number) => {
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
    })
  }

  showDatePickerDialog() {

  }

  showTimePickerDialog() {

  }
}