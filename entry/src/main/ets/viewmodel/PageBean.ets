export class PageBean<T> {
  curPage: number;
  offset: number;
  over: number;
  size: number;
  total: number;
  datas: Array<T>;
}