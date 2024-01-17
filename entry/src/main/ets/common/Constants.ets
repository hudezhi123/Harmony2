export default class Constants {
  static readonly DURATION: number = 1000;
  static readonly MORNING_TIME: number = 6;
  static readonly EVENING_TIME: number = 18;
  static readonly NIGHT_TIME: number = 19;

  /**
   * The http timeout duration.
   */
  static readonly HTTP_READ_TIMEOUT: number = 10000;

  /**
   * Http request success status code.
   */
  static readonly HTTP_CODE_200: number = 200;
  static readonly HTTP_RESPONSE_SUCCESS_CODE: number = 0;
  static readonly THEME_YELLOW: string = "#ffe100";
  static readonly THEME_BACKGROUND = "#f9f9f9";
}

/**
 * The request method enum.
 */
export const enum RequestMethod {
  POST = 'POST',
  GET = 'GET'
}

/**
 * The request content type enum.
 */
export const enum ContentType {
  JSON = 'application/json',
  FORM = 'multipart/form-data'
}