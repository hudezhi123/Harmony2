export default class ResponseResult {
  errorCode: number;
  errorMsg: string | Resource;
  data: string | Object | boolean | ArrayBuffer;
}