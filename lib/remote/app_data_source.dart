import 'dart:io';

import 'package:ai_trade/models/export_models.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ai_trade/exports.dart';

import 'app_dio.dart';

part 'app_data_source.g.dart';

final appDataSourceProvider = Provider((ref) => AppDataSource(ref));

///http://106.38.204.135/ef-api/api/news?limit=1&page=1&type=0
@RestApi()
abstract class AppDataSource {
  factory AppDataSource(Ref ref) => _AppDataSource(ref.read(dioProvider));

  ///多文件上传
  @POST('common/uploadFiles')
  @MultiPart()
  Future<ResponseBodyMt> postFormData3(
      @Part() List<File> file, @CancelRequest() cancelRequest);

  @GET('news')
  Future<ResponseBodyMt> news(
      @Queries() Map<String, dynamic> map, @CancelRequest() cancelRequest);

  @GET('markets')
  Future<ResponseBodyMt> markets(
      @Queries() Map<String, dynamic> map, @CancelRequest() cancelRequest);
  @GET('views')
  Future<ResponseBodyMt> views(
      @Queries() Map<String, dynamic> map, @CancelRequest() cancelRequest);

  @GET('https://data.mifengcha.com/api/v3/price')
  Future<List<CoinPriceModel>> priceS(
      @Queries() Map<String, dynamic> map, @CancelRequest() cancelRequest);
}
