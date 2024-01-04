import { ArticleBean } from '../viewmodel/ArticleBean'

@Preview
@Component
export default struct ArticleItem {
  article: ArticleBean = new ArticleBean()

  build() {
    Row() {
      Image($r('app.media.icon_article_bg'))
        .width(80)
      Column() {
        Text(`${this.article.title}`)
          .fontSize(14)
          .fontWeight(FontWeight.Medium)
        Row() {
          Text(`${this.article.chapterName}`)
            .fontSize(14)
            .fontColor("#12af00")
          Text(`${this.article.niceDate}`)
            .fontSize(14)
            .fontColor("#ff999999")
        }
        .width("100%")
        .margin({ top: 6 })
        .justifyContent(FlexAlign.SpaceBetween)
      }
      .layoutWeight(1)
      .margin({ left: 10 })
      .alignItems(HorizontalAlign.Start)
    }
    .width("100%")
    .height(100)
    .borderRadius(10)
    .padding(10)
    .backgroundColor(Color.White)
  }
}