export class ArticleBean {
  adminAdd: false;
  apkLink: string = "";
  audit: 1;
  author: string;
  canEdit: false;
  chapterId: number = 0;
  chapterName: string = "";
  collect: boolean = false;
  courseId: number = 0;
  desc: string = "";
  descMd: string = "";
  envelopePic: string = "";
  fresh: boolean = false;
  host: string = "";
  id: number = 0;
  isAdminAdd: boolean = false;
  link: string = "";
  niceDate: string = "";
  niceShareDate: string = "";
  origin: string = "";
  prefix: string = "";
  projectLink: string = "";
  publishTime: number = 0;
  realSuperChapterId: number = 0;
  selfVisible: number = 0;
  shareDate: number = 0;
  shareUser: string = "";
  superChapterId: number = 0;
  superChapterName: string = "";
  tags: Array<Tag> = [];
  title: string = "";
  type: number = 0;
  userId: number = 0;
  visible: number = 1; // 0 不可见   1 可见
  zan: number = 0;
  articleImg: Resource = $r('app.media.icon_article_bg')
}

export class Tag {
  name: string = "";
  url: string = "";
}