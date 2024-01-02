import http from '@ohos.net.http';
import ResponseResult from './ResponseResult';
import Constants, { ContentType } from '../common/Constants'
import { ApiService } from './ApiService';

export function httpRequestGet(url: string): Promise<ResponseResult> {
  let requestOptions = getRequestOptions(http.RequestMethod.POST)
  return httpRequest(url, requestOptions)
}

export function loginRequest(url: string, username: string, password: string) {
  url = `${url}?username=${username}&password=${password}`
  let requestOptions = getRequestOptions(http.RequestMethod.POST)
  requestOptions.extraData = {}
  return httpRequest(url, requestOptions)
}

export function loginRequestTest(url: string, username: string, password: string) {
  url = `${url}?username=${username}&password=${password}`
  let requestOptions = getRequestOptions(http.RequestMethod.POST)
  requestOptions.extraData = {}
  return httpRequest(url, requestOptions)
}

export function registerRequest(url: string, username: string, password: string, repassword: string) {
  url = `${url}?username=${username}&password=${password}&repassword=${repassword}`;
  let requestOptions = getRequestOptions(http.RequestMethod.POST)
  requestOptions.extraData = {}
  return httpRequest(url, requestOptions)
}

export function getArticleList(url: string, page: number) {
  url = `${url}${ApiService.HOME_ARTICLE_LIST}${page}${ApiService.JSON}`;
  let requestOptions = getRequestOptions(http.RequestMethod.POST)
  requestOptions.extraData = {}
  return httpRequest(url, requestOptions)
}

export function httpRequestPost(url: string, params?: string | Object | ArrayBuffer): Promise<ResponseResult> {
  let requestOptions = getRequestOptions(http.RequestMethod.POST)
  requestOptions.extraData = params
  return httpRequest(url, requestOptions)
}

export function getRequestOptions(method: http.RequestMethod): http.HttpRequestOptions {
  return {
    method: method,
    readTimeout: Constants.HTTP_READ_TIMEOUT,
    connectTimeout: Constants.HTTP_READ_TIMEOUT,
    header: {
      'Content-Type': ContentType.JSON
    }
  }
}

export function httpRequest(url: string, requestOptions: http.HttpRequestOptions): Promise<ResponseResult> {
  let httpRequest = http.createHttp()
  let responseResult = httpRequest.request(url, requestOptions)
  let serverData = new ResponseResult();
  return responseResult.then((value: http.HttpResponse) => {
    if (value.responseCode == Constants.HTTP_CODE_200) {
      let result = `${value.result}`;
      console.log("http_response", result)
      let resultJson: ResponseResult = JSON.parse(result);
      if (resultJson.errorCode == 0) {
        serverData.data = resultJson.data;
      } else {
        serverData.errorMsg = `${resultJson.errorMsg}`;
        serverData.errorCode = resultJson.errorCode;
      }
    } else {
      serverData.errorMsg = "网络请求失败，稍后重试！";
    }
    return serverData;
  }).catch((errMsg) => {
    serverData.errorMsg = errMsg;
    return serverData;
  });

}