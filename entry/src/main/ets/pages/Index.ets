import router from '@ohos.router'
import Constants from "../common/Constants"
import { Banners } from '../view/Banners';
import { BannerInfo } from '../viewmodel/BannerInfo';
import { splashImages } from '../viewmodel/SplashViewModel';

@Entry
@Component
struct Index {
  private swiperController: SwiperController = new SwiperController();
  @State isShowGuide: boolean = true;
  private splashData: BannerInfo[] = [];
  @State countDown: number = 5
  private timer: number = 1;

  aboutToAppear() {
    let hours = new Date().getHours();
    if (hours >= Constants.MORNING_TIME && hours < Constants.EVENING_TIME) {
      this.splashData = splashImages.day;
    } else if (hours >= Constants.EVENING_TIME && hours <= Constants.NIGHT_TIME) {
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
        this.clearTiming()
        this.jumpToLoginPage();
      }
    }, 1000)
  }

  aboutToDisappear(){
    this.clearTiming()
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
          Banners({ bannerList: this.splashData })
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
          .onClick(() => {
            this.jumpToLoginPage()
          })
          .textAlign(TextAlign.Center)
          .position({
            x: "78%",
            y: 40
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

  jumpToLoginPage() {
    this.clearTiming();
    router.replaceUrl({ url: "pages/LoginPage" })
  }
}