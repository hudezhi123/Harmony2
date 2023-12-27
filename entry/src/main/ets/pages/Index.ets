import router from '@ohos.router'
import { Constants as Const } from "../common/Constants"
import { splashImages } from '../viewmodel/SplashViewModel';

@Entry
@Component
struct Index {
  private swiperController: SwiperController = new SwiperController();
  @State isShowGuide: boolean = true;
  private splashData: Resource[] = [];
  @State countDown: number = 5
  private timer: number = -1;

  aboutToAppear() {
    let hours = new Date().getHours();
    if (hours >= Const.MORNING_TIME && hours < Const.EVENING_TIME) {
      this.splashData = splashImages.day;
    } else if (hours >= Const.EVENING_TIME && hours <= Const.NIGHT_TIME) {
      this.splashData = splashImages.dusk;
    } else {
      this.splashData = splashImages.night
    }
    setTimeout(() => {
      this.isShowGuide = true;
      this.startTiming();
    }, 3000)
  }

  startTiming() {
    this.timer = setInterval(() => {
      this.countDown--;
      if (this.countDown === 0) {
        this.clearTiming();
        this.jumpToMainPage();
      }
    }, 1000)
  }

  clearTiming() {
    if (this.timer !== -1) {
      clearInterval(this.timer);
      this.timer = -1;
    }
  }

  build() {

    Column() {
      Stack() {
        if (this.isShowGuide) {
          Swiper(this.swiperController) {
            ForEach(this.splashData, (item: Resource) => {
              Image(item)
                .width("100%")
                .height("100%")
                .objectFit(ImageFit.Contain)
            })
          }
          .loop(true)
          .interval(2000)
          .autoPlay(true)
          .indicatorStyle({
            bottom: "100vp",
            color: "#99ffffff"
          })
          .curve(Curve.Linear)

          Text() {
            Span("跳过")
            Span(`${this.countDown}`)
          }
          .width(65)
          .height(26)
          .fontColor(Color.White)
          .fontSize(16)
          .borderRadius(10)
          .backgroundColor("#4d182431")
          .onClick(()=>{
            this.jumpToMainPage()
          })
          .textAlign(TextAlign.Center)
          .position({
            x:"78%",
            y:20
          })
        } else {
          Column() {
            Image($r('app.media.ic_splash'))
              .width($r('app.float.vp_192'))
              .height($r('app.float.vp_192'))
              .offset({
                y: "15%"
              })
              .objectFit(ImageFit.Contain)

            Text("北京欢迎您！")
              .fontColor(Color.White)
              .fontSize(26)
              .fontWeight(FontWeight.Bold)
              .margin({ top: 20 })
              .offset({
                y: "25%"
              })
          }
          .width("100%")
          .height("100%")
          .backgroundColor($r('app.color.theme_red'))
        }
      }
    }

  }

  jumpToMainPage() {
    router.pushUrl({ url: "pages/MainPage" })
  }
}