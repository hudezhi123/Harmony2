export class FunctionBean {
  id: number;
  icon: Resource;
  displayName: string | Resource;
  pagePath?: string

  constructor(id: number, icon: Resource, displayName: string, pagePath: string = "") {
    this.id = id;
    this.icon = icon;
    this.displayName = displayName;
    this.pagePath = pagePath;
  }
}