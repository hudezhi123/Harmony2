import { ApiService } from '../api/ApiService';
import { httpRequestGet, httpRequestPost, loginRequest, loginRequestTest, registerRequest } from '../api/HttpUtil';
import ResponseResult from '../api/ResponseResult';
import Constants from '../common/Constants';
import { LoginAndRegisterBean } from './LoginAndReigsterBean';

class LoginAndRegisterViewModel {
  login(username: string, password: string): Promise<LoginAndRegisterBean> {
    return new Promise(async (resolve: Function, reject: Function) => {
      let url = `${ApiService.BASE_URL}${ApiService.LOGIN}`;
      loginRequest(url, username, password).then((data: ResponseResult) => {
        resolve(data.data)
      }).catch((errMsg) => {
        reject(errMsg)
      })
    });
  }

  register(username: string, password: string, repassword: string): Promise<string> {
    return new Promise(async (resolve: Function, reject: Function) => {
      let url = `${ApiService.BASE_URL}${ApiService.REGISTER}`;
      registerRequest(url, username, password, repassword).then((data: ResponseResult) => {
        resolve(data.data)
      }).catch((errMsg) => {
        reject(errMsg)
      })
    });
  }
}

let loginViewModel = new LoginAndRegisterViewModel();

export default loginViewModel as LoginAndRegisterViewModel;
