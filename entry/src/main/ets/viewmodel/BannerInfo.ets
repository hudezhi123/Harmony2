export class BannerInfo {
  desc: string = "";
  id: number = 10;
  imagePath: string | Resource;
  isVisible: number = 0;
  order: number = 0;
  title: string = "";
  type: number = 0;
  url: string = "";

  constructor(imagePath?: string | Resource) {
    this.imagePath = imagePath;
  }
}