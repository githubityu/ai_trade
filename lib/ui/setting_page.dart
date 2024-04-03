import 'package:ai_trade/exports.dart';
import 'package:ai_trade/route/app_router.dart';
import 'package:ai_trade/util/export_util.dart';
import 'package:flutter/material.dart';

import '../gen/export_gen.dart';
import '../local/constants.dart';
import 'buy_page.dart';

class SettingPage extends HookWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final buyFee = ShowUtils.getFee(isBuyFee: true);
    final sellFee = ShowUtils.getFee(isBuyFee: false);
    final refresh = useState(false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
      ),
      body: Column(
        children: ListTile.divideTiles(context: context, tiles: [
          ListTile(
            onTap: (){
              userAppRouter().push(RoutePath.updateFeePage,extra: true).then((value){
                if(value==true){
                  refresh.value =!refresh.value;
                }
              });
            },
            title: Text(ShowUtils.toPercent(d(buyFee), isMul: false)),
            leading: const Text("买入手续费率"),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            onTap: (){
              userAppRouter().push(RoutePath.updateFeePage,extra: false).then((value){
                if(value==true){
                  refresh.value =!refresh.value;
                }
              });
            },
            title: Text(ShowUtils.toPercent(d(sellFee), isMul: false)),
            leading: Text("卖出手续费率"),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          const ListTile(
            title: Text(Constants.U),
            leading: Text("货币"),
          )
        ]).toList(),
      ),
    );
  }
}

class UpdateFeePage extends HookWidget {
  final bool isBuyFee;

  const UpdateFeePage({super.key, required this.isBuyFee});

  @override
  Widget build(BuildContext context) {
    final editC = useTextEditingController();
    final title = useRef(isBuyFee ? "买入手续费率" : "卖出手续费率");
    final buyFee = ShowUtils.getFee(isBuyFee: isBuyFee);
    useEffect((){
      editC.text = buyFee;
      return null;
    },[]);
    return Scaffold(
        appBar: AppBar(
          title: Text("修改手续费率"),
          actions: [
            ElevatedButton(
              onPressed: () {
                final fee = editC.text;
                if (fee.isNotEmpty) {
                  final feeNum = d(fee);
                  if (feeNum > d("0")) {
                    ShowUtils.updateFee(fee, isBuyFee: isBuyFee);
                    Utils.showToast("保存成功");
                    userAppRouter().pop(true);
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorName.themeColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: const Text("保存"),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: ItemEditContent(
            controller: editC,
            title: title.value,
          ),
        ));
  }
}
