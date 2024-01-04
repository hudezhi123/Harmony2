import { ApiService } from '../api/ApiService';
import { getArticleList } from '../api/HttpUtil';
import { ArticleBean } from './ArticleBean';
import { PageBean } from './PageBean';

class MainViewModel {
  getArticleList(page: number): Promise<PageBean<ArticleBean>> {
    return new Promise(async (resolve: Function, reject: Function) => {
      getArticleList(ApiService.BASE_URL, page).then((data) => {
        resolve(data.data)
      }).catch((errorMsg) => {
        reject(errorMsg)
      })
    });
  }
}

let mainViewModel = new MainViewModel();

export default mainViewModel as MainViewModel;

