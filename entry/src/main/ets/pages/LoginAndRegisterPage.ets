import router from '@ohos.router'
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
  @State userName: string = ""
  @State password: string = ""

  login() {
    LoginAndRegisterViewModel.login(this.userName, this.password).then((response) => {
      this.toMainPage();
    }).catch((errorMsg) => {

    })
  }

  toMainPage() {
    router.pushUrl({url:"pages/MainPage"})
  }

  toRegister() {

  }

  forgetPassword() {

  }

  build() {
    Column({ space: 20 }) {
      Text("登录")
        .fontSize(36)
        .fontColor("#000000")
        .fontWeight(FontWeight.Bold)
        .margin({ top: "20%" })

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

      Text("忘记密码?")
        .fontColor(Color.Blue)
        .alignSelf(ItemAlign.End)
        .onClick(() => {
          this.forgetPassword()
        })

      Button("登录")
        .width("95%")
        .margin({ top: 20 })
        .onClick(() => {
          this.login()
        })
      Button("注册")
        .width("95%")
        .margin({ top: 4 })
        .backgroundColor(Color.White)
        .borderWidth(1)
        .borderColor(Color.Blue)
        .fontColor(Color.Black)
        .onClick(() => {
          this.toRegister()
        })

      Blank()
      Row() {
        Line().width(30).height('1vp').backgroundColor(Color.Gray)
        Text("其他登录方式")
        Line().width(30).height('1vp').backgroundColor(Color.Gray)
      }

      Row({ space: 30 }) {
        this.ThirdLoginItem($r('app.media.ic_third_google'), "谷歌")
        this.ThirdLoginItem($r('app.media.ic_third_facebook'), "脸书")
        this.ThirdLoginItem($r('app.media.ic_third_apple'), "苹果")
      }
      .width("100%")
      .justifyContent(FlexAlign.Center)
      .margin({ bottom: 30 })
    }
    .width("100%")
    .height("100%")
    .padding({ left: "12vp", right: "12vp", bottom: "24vp" })
  }

  @Builder ThirdLoginItem(img: Resource, text: string) {
    Column() {
      Image(img).width(40).height(40)
      Text(text).fontSize(16).fontColor(Color.Black)
        .margin({ top: 10 })
    }
  }
}