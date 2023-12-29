import http from '@ohos.net.http';
import ResponseResult from './ResponseResult';
import Constants, { ContentType } from '../common/Constants'

export function httpRequestGet(url: string): Promise<ResponseResult> {
  return httpRequest(url, http.RequestMethod.GET)
}

export function httpRequestPost(url: string, params?: string | Object | ArrayBuffer): Promise<ResponseResult> {
  return httpRequest(url, http.RequestMethod.POST, params)
}

export function httpRequest(url: string, method: http.RequestMethod, params?: string | Object | ArrayBuffer): Promise<ResponseResult> {
  let httpRequest = http.createHttp()
  let responseResult = httpRequest.request(url, {
    method: method,
    readTimeout: Constants.HTTP_READ_TIMEOUT,
    connectTimeout: Constants.HTTP_READ_TIMEOUT,
    header: {
      'Content-Type': ContentType.JSON
    },
    extraData: params
  })
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