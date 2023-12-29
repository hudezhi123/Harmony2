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
     let promise = httpRequestPost(url, params).then((data: ResponseResult) => {
        if (data.errorCode === Constants.HTTP_RESPONSE_SUCCESS_CODE) {
          resolve(data.data)
        } else {
          reject(data.errorMsg)
        }
      }).catch((errMsg) => {
        reject(errMsg)
      })
    });
  }

  register(username: string, password: string, repassword: string): Promise<string> {
    return new Promise(async (resolve: Function, reject: Function) => {
      let url = `${ApiService.BASE_URL}${ApiService.REGISTER}`;
      let params = {
        username: username,
        password: password,
        repassword: repassword
      }
      httpRequestPost(url, params).then((data: ResponseResult) => {
        if (data.errorCode === Constants.HTTP_RESPONSE_SUCCESS_CODE) {
          resolve(data.data)
        } else {
          reject(data.errorMsg)
        }
      }).catch((errMsg) => {
        reject(errMsg)
      })
    });
  }
}

let loginViewModel = new LoginAndRegisterViewModel();

export default loginViewModel as LoginAndRegisterViewModel;
