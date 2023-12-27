export class ApiService {
  static readonly BASE_URL = "https://www.wanandroid.com";



  /**
   * 首页文章列表
   * GET
   */
  static readonly HOME_ARTICLE_LIST = "/article/list/0/json";

  /**
   * 首页banner
   * GET
   */
  static readonly HOME_BANNER = "/banner/json";

  /**
   * 登录
   * username，password
   */
  static readonly LOGIN = "/user/login";

  /**
   * 注册
   * username,password,repassword
   */
  static readonly REGISTER = "/user/register";

  /**
   * 退出登录
   * GET
   */
  static readonly LOGOUT = "/logout/json";
}