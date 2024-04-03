import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/coin_model.dart';

class IsarUtils {
   static late Isar _isar;
   static IsarUtils? _instance;
   IsarUtils._();
   static Future<void> _init() async {
     final dir = await getApplicationDocumentsDirectory();
     _isar = Isar.open(
       directory: dir.path, schemas: [CoinBuyModelSchema,CoinSellAiModelSchema],
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
   static Future<List<CoinBuyModel?>> findAll(){
    return _isar.coinBuyModels.buildQuery<CoinBuyModel?>().findAllAsync();
   }

   static Future<List<CoinSellAiModel?>> findAll2(String coinName){
     return  _isar.coinSellAiModels.where().coinNameEqualTo(coinName,caseSensitive: false).sortByIdDesc().findAllAsync(limit: 5);
   }



   static CoinBuyModel? getById(int id){
     return _isar.coinBuyModels.get(id);
   }







}