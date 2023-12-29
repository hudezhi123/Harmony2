import router from '@ohos.router'
import prompt from '@ohos.promptAction'
import LoginAndRegisterViewModel from '../viewmodel/LoginAndRegisterViewModel'

@Extend(TextInput) function inputStyle() {
  .placeholderColor('#99182431')
  .height('45vp')
  .fontSize('18fp')
  .width('100%')
  .backgroundColor(Color.White)
  .padding({ left: 8 })
  .margin({ top: '12vp' })
  .caretColor(Color.Green)
}

@Extend(Text) function tagStyle() {
  .fontWeight(FontWeight.Medium)
  .fontColor(Color.Black)
  .fontSize(16)
}

@Extend(Line) function lineStyle() {
  .width('100%')
  .height('1vp')
  .backgroundColor('#33182431')
}


@Entry
@Component
struct LoginAndRegisterPage {
  @State userName: string = "";
  @State password: string = "";
  @State repassword: string = "";

  register() {
    if (this.userName === '' || this.password === '' || this.repassword === '') {
      prompt.showToast({ message: "输入不能为空" });
      return
    }
    LoginAndRegisterViewModel.register(this.userName, this.password, this.repassword).then((response) => {
      this.toMainPage();
    }).catch((errorMsg) => {
      prompt.showToast({ message: errorMsg, bottom: "100" })
    })
  }

  toMainPage() {
    router.pushUrl({ url: "pages/MainPage" })
  }

  build() {
    Column({ space: 20 }) {
      Text("注册")
        .fontSize(36)
        .fontColor("#000000")
        .fontWeight(FontWeight.Bold)
        .margin({ top: "50" })

      Column() {
        Text("账号").tagStyle()
        TextInput({ placeholder: "请输入账号" })
          .type(InputType.PhoneNumber)
          .onChange((value) => {
            this.userName = value;
          }).inputStyle()

        Line().lineStyle()
      }
      .margin({ top: 20 })
      .width("100%")
      .alignItems(HorizontalAlign.Start)

      Column() {
        Text("密码")
          .tagStyle()
        TextInput({ placeholder: "请输入密码" })
          .width("80%")
          .type(InputType.Password)
          .onChange((value) => {
            this.password = value;
          }).inputStyle()

        Line().lineStyle()
      }.width("100%")
      .alignItems(HorizontalAlign.Start)

      Column() {
        Text("确认密码")
          .tagStyle()
        TextInput({ placeholder: "请再次输入密码" })
          .width("80%")
          .type(InputType.Password)
          .onChange((value) => {
            this.repassword = value;
          }).inputStyle()

        Line().lineStyle()
      }.width("100%")
      .alignItems(HorizontalAlign.Start)


      Button("注册")
        .width("95%")
        .margin({ top: 20 })
        .onClick(() => {
          this.register()
        })
    }
    .width("100%")
    .height("100%")
    .padding({ left: "12vp", right: "12vp", bottom: "24vp" })
  }

}