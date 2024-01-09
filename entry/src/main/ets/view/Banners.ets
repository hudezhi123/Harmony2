import { BannerInfo } from '../viewmodel/BannerInfo';

@Component
export struct Banners {
  private swiperController: SwiperController = new SwiperController();
  bannerList: Array<BannerInfo>;

  build() {
    Column() {
      Swiper(this.swiperController) {
        ForEach(this.bannerList, (item: BannerInfo) => {
          Image(item.imagePath)
            .width("100%")
            .height("100%")
            .objectFit(ImageFit.Fill)
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
    }
  }
}