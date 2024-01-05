export class FunctionBean {
  id:number;
  icon: Resource;
  displayName: string | Resource;

  constructor(id:number,icon: Resource, displayName: string) {
    this.id = id;
    this.icon = icon;
    this.displayName = displayName;
  }
}