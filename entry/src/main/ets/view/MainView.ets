import Prompt from '@system.prompt'
import { ArticleBean } from '../viewmodel/ArticleBean'
import { BannerInfo } from '../viewmodel/BannerInfo'
import MainViewModel from '../viewmodel/MainViewModel'
import { PageBean } from '../viewmodel/PageBean'
import ArticleItem from './ArticleItem'
import { Banners } from './Banners'

@Preview
@Component
export struct MainView {
  @State page: number = 0
  @State articleList: Array<ArticleBean> = []
  @State bannerList: Array<BannerInfo> = []

  aboutToAppear() {
    MainViewModel.getArticleList(this.page).then((pageBean: PageBean<ArticleBean>) => {
      this.articleList = pageBean.datas;
    }).catch((errorMsg) => {
      Prompt.showToast({ message: errorMsg, bottom: 100 })
    })
  }

  build() {
    Column() {
      Banners({ bannerList: $this.bannerList })
      List({ space: 10 }) {
        ForEach(this.articleList, (bean: ArticleBean) => {
          ListItem() {
            ArticleItem({ article: bean })
          }
          .margin({ left: 10, right: 10 })
        }, (bean) => JSON.stringify(bean))
      }
      .width("100%")
      .height("100%")
    }
    .backgroundColor("#f9f9f9")
    .width("100%")
    .height("100%")
  }
}