import { ApiService } from '../api/ApiService';
import { httpRequestGet, httpRequestPost } from '../api/HttpUtil';
import ResponseResult from '../api/ResponseResult';
import Constants from '../common/Constants';

class LoginAndRegisterViewModel {
  login(username: string, password: string): Promise<string> {
    return new Promise(async (resolve: Function, reject: Function) => {
      let url = `${ApiService.BASE_URL}${ApiService.LOGIN}`;
      let params = {
        username: username,
        password: password
      }
      httpRequestPost(url, params).then((data: ResponseResult) => {
        if (data.errorCode === Constants.HTTP_RESPONSE_SUCCESS_CODE) {
          resolve(data.data)
        } else {
          reject("网络请求失败！")
        }
      }).catch(() => {
        reject("网络请求失败！")
      })
    });
  }
}

let loginViewModel = new LoginAndRegisterViewModel();

export default loginViewModel as LoginAndRegisterViewModel;
