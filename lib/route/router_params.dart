import 'dart:collection';

import 'package:flutter/widgets.dart';


class ParamsEditPage {
  final String title;
  final String content;
  final int type;

  ParamsEditPage(this.title, this.content, {this.type = 1});
}

class ParamsWebPage {
  final String title;
  final String url;

  ParamsWebPage(this.title, this.url);
}

class ParamsScanImage {
  final List<String> picUrls;
  final int? index;
  final bool? isLocal;
  final String? tag;
  final Function(List<String>)? functions;

  ParamsScanImage(this.picUrls, {this.index, this.isLocal, this.functions,this.tag});
}

class ParamsCalendarList {
  final DateTime startTime, endTime;
  final List<DateTime> invalidDays;
  final ValueNotifier<LinkedHashSet<DateTime>> selectDaysVN;
  final List<String> times;
  final bool isMulti;
  final bool isWeekEnd;

  ParamsCalendarList(this.startTime, this.endTime, this.invalidDays,
      this.isMulti, this.isWeekEnd, this.times, this.selectDaysVN);
}

class ParamsProductList {
  final int hourNum, serviceId, type;
  final String serviceName;

  ParamsProductList(this.hourNum, this.serviceId, this.serviceName, this.type);
}

class ParamsProductListPage {
  final int hourNum, serviceId, classifyId, index, weekdayNum, weekendNum;

  ParamsProductListPage(this.hourNum, this.serviceId, this.classifyId,
      this.weekdayNum, this.weekendNum,
      {this.index = 0});
}

class ParamsSessionsListPage {
  final int hourNum, classifyId, sessionNum,type;

  ParamsSessionsListPage(
      this.hourNum, this.classifyId, this.sessionNum, this.type);
}
class ParamsProductDetail {
  final String serviceName, name;
  final int id,type;
  ParamsProductDetail(
      this.serviceName, this.name,this.id,this.type);
}
class ParamsOrderDetailPay {
  final String orderNo;
  final int? classifyId,hourNum;
  final bool isList;
  ParamsOrderDetailPay(
      this.orderNo, {this.isList = false,this.classifyId,this.hourNum});
}


class ParamsNoticeDetail {
  final int id, isRead;

  ParamsNoticeDetail(this.id, this.isRead);
}
