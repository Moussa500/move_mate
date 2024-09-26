import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'base_model.dart';

class LocalData {
  final SharedPreferences sharedPreferences;
  LocalData(this.sharedPreferences);
  Future<bool> saveAtring(String string,String key)async{
    return sharedPreferences.setString(key,string);
  }

  Future<String?> getAString(String key)async{
    final String? jsonString=sharedPreferences.getString(key);
    return jsonString;
  }

  Future<bool> saveAThing(model,String key)async{
    var thing=model.toJson();
    return sharedPreferences.setString(key,json.encode(thing));
  }

  Future<dynamic> getAThingFromCash<T extends BaseModel>(String key,{required model}){
    final String jsonString=sharedPreferences.getString(key)?? "";

    if (jsonString!="") {
      final Map<String,dynamic> jsonMap=json.decode(jsonString);
      dynamic thing=model.fromJson(jsonMap);
      return Future.value(thing);
    }else{
      return Future.value(null);
    }
  }
  Future<bool> clear()async{
    return sharedPreferences.clear();
  }
}