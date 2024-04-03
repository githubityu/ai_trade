import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

//http://106.38.204.149:9002/home_api/api/login/signUp?account=18939877709&passWord=11111&code=1234&type=0
@immutable
class Constants {
  // static const String rootUrl = 'http://homeeasy-api.t.phcer.com/home_api/';
  //http://10.168.1.249:18080/hk_api/api/login/sendMobileCode?mobile=%2B18939559563&type=0
  //static const String rootUrl = 'http://xjp-user-api.t.phcer.com/hk_api/';

  //http://8.209.240.50:18086/hk_api/swagger-ui/index.html#/
  /// http://106.38.204.135/ef-api/api/news?limit=1&page=1&type=0
  static const String rootUrl = 'http://106.38.204.135/ef-api/';
  static const String endpoint = '${rootUrl}api/';
  static const String newsUrl = '${endpoint}homepage/newsShow&id=';

  static String dummyProfilePic =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6TaCLCqU4K0ieF27ayjl51NmitWaJAh_X0r1rLX4gMvOe0MDaYw&s';
  static const String data = 'data';
  static const String message = 'message';
  static const String code = 'code';
  static const String addPic = 'addPic';
  static const int sendCodeSeconds = 30;
  static const int phoneLength = 11;
  static const int codeLength = 6;
  static const int postCodeLength = 6;
  static const int minPwdLength = 6;
  static const String defaultAreaCode = 'SG +65';
  static const String FGF = '|';
  static const String FGF2 = ',';
  static const String ZWF = '-';
  static const String KEY_ADDRESS = 'address';
  static const String KEY_LIST = 'account';
  static const String keyGuide = 'keyGuide';
  static const String phone = 'phone';

  static const String accessToken = 'accessToken';
  static const String refreshToken = 'refreshToken';

  static const String theme = 'AppTheme';
  static const String noSign = 'TA还什么都没有留下~';
  static const String themeBg =
      'https://pic3.zhimg.com/80/v2-5504020145e0adf9dd431b969615b896_1440w.webp';
  static const String pic2 =
      'https://pic3.zhimg.com/80/v2-5504020145e0adf9dd431b969615b896_1440w.webp';
  static const String pic1 =
      'https://www.pgyer.com/app/qrcode/ai_trade';

  static const String localChange = 'localChange';
  static const String appTheme = 'appTheme';
  static const String buyFee = 'buyFee';
  static const String sellFee = 'sellFee';
  static const int PAGE_START = 1;
  static const int PAGE_SIZE = 10;
  static const String FEE = "100";
  static const String U = "USD";
  static const bool isCenterTitle = true;

  static const String webUrl4 =
      'http://xjp-user-api.t.phcer.com/hk_api/api/comm/findServiceNotice?language=en&id=1';

  static const String testTitle = '为什么我们要坚持进行双碳行动？';
  static const String testContent =
      '“航空碳资产管理”是北京绿色交易所“碳”主题培训精品课程——“碳资产管理”的衍生产品，内容涵盖双碳与碳交易、配额碳资产、信用碳资产、航空碳资产管理和碳交易模拟五大模块，在“碳资产管理”培训既有内容基础上增加了航空碳减排的国际治理、航空碳减排路径.....';
}
