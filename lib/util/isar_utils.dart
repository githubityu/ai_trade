
import 'package:ai_trade/exports.dart';
import 'package:ai_trade/util/app_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/coin_model.dart';

class IsarUtils {
   static late Isar _isar;
   static IsarUtils? _instance;
   IsarUtils._();
   static Future<void> _init() async {
     String directory = "";
     if(!kIsWeb){
       final dir = await getApplicationDocumentsDirectory();
       directory = dir.path;
     }else{
       await Isar.initialize();
     }
     _isar = Isar.open(
       directory: directory, schemas: [CoinBuyModelSchema,CoinInfoModelSchema,InputCostModelSchema],
     );
   }
   static Future<IsarUtils> getInstance() async {
       if(_instance==null){
         _instance = IsarUtils._();
         await _init();
       }
       return _instance!;
   }


   ///写
   static void write<T>(T Function(Isar isar) callback){
     _isar.write(callback);
   }
   static void writeAsyncWith<T>(T Function(Isar,String ) callback,String message){
     _isar.writeAsyncWith(message,callback);
   }

   static bool isOpen(){
    return _isar.isOpen;
   }
   static Future<List<CoinBuyModel?>> findAll(){
    return _isar.coinBuyModels.where().findAllAsync();
   }

   static Future<CoinBuyModel?> findAll2(int id ){
     return  _isar.coinBuyModels.getAsync(id);
   }
   static Future<List<CoinInfoModel>> findCoinInfoModel(List<String> coinNames){
     return _isar.coinInfoModels.where().anyOf(coinNames, (q, element) => q.symbolEqualTo(element,caseSensitive: false)).findAllAsync();
   }

   static Future<List<InputCostModel>> findInputCostModel()  {
     return _isar.inputCostModels.where().findAllAsync();
   }


   static Future insertCoinInfoModel() async {
     final count =  _isar.coinInfoModels.count();
     if(count==0){
       ///插入数据
       await AppUtils.parseJson();
     }
   }
   static CoinBuyModel? getById(int id){
     return _isar.coinBuyModels.get(id);
   }

}