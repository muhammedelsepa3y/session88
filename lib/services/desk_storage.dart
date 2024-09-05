import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DeskStorage extends ChangeNotifier{
  int counter=0;
  static String? token;
  getAllData()async{
    var box = await Hive.openBox("counter");
    counter =box.get("counterValue")??0;
    notifyListeners();
  }
  Future<int> getCounterFromLocalDB() async {
    var box = await Hive.openBox("counter");
    return box.get("counterValue")??0;
  }

  incrementValue()async{
    var box = await Hive.openBox("counter");
    int oldValue=(box.get("counterValue")??0);
    await box.put("counterValue", ++oldValue);
    counter++;
    notifyListeners();
  }
}
