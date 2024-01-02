import { ApiService } from '../api/ApiService';
import { getArticleList } from '../api/HttpUtil';
import { ArticleBean } from './ArticleBean';

class MainViewModel {
  getArticleList(page: number): Promise<Array<ArticleBean>> {
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

