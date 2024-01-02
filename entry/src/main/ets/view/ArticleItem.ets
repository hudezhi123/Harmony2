import { ArticleBean } from '../viewmodel/ArticleBean'

@Preview
@Component
export default struct ArticleItem {
  article: ArticleBean

  build() {
    Row() {
      Image($r('app.media.icon_article_bg'))
        .width(60)
        .height(40)
      .borderRadius(8)
      Column(){
        Text("Google开发者")
          .fontSize(14)
      }
    }
    .width("100%")
    .height(100)
    .borderRadius(10)
    .backgroundColor(Color.Red)
  }
}