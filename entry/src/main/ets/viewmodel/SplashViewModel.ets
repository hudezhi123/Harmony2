import { BannerInfo } from './BannerInfo'

interface ISplash {
  day: BannerInfo[];
  dusk: BannerInfo[];
  night: BannerInfo[];
}

export const splashImages: ISplash = {
  day: [
    new BannerInfo($r('app.media.splash1')),
    new BannerInfo($r('app.media.splash2')),
    new BannerInfo($r('app.media.splash3'))
  ],
  dusk: [
    new BannerInfo($r('app.media.splash4')),
    new BannerInfo($r('app.media.splash5')),
    new BannerInfo($r('app.media.splash6'))
  ],
  night: [
    new BannerInfo($r('app.media.splash7')),
    new BannerInfo($r('app.media.splash8')),
    new BannerInfo($r('app.media.splash9'))
  ]
}