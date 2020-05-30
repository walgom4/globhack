import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtil{

  Future<String> getString(String key) async{
    try{
      final SharedPreferences prefData = await SharedPreferences.getInstance();
      return prefData.getString(key);
    }catch(ex){
      throw ex;
    }
  }

  Future<void> setString(String key, String value) async{
    try{
      final SharedPreferences prefData = await SharedPreferences.getInstance();
      prefData.setString(key, value);
    }catch(ex){
      throw ex;
    }
  }

  Future<int> getInt(String key) async{
    try{
      final SharedPreferences prefData = await SharedPreferences.getInstance();
      return prefData.getInt(key);
    }catch(ex){
      throw ex;
    }
  }

  Future<void> setInt(String key, int value) async{
    try{
      final SharedPreferences prefData = await SharedPreferences.getInstance();
      prefData.setInt(key, value);
    }catch(ex){
      throw ex;
    }
  }

  Future<void> setList(String key, List<String> value) async{
    try{
      final SharedPreferences prefData = await SharedPreferences.getInstance();
      prefData.setStringList(key, value);
    }catch(ex){
      throw ex;
    }
  }

  Future<List<String>> getList(String key) async{
    try{
      final SharedPreferences prefData = await SharedPreferences.getInstance();
      return prefData.getStringList(key);
    }catch(ex){
      throw ex;
    }
  }

  Future<double> getDouble(String key) async{
    try{
      final SharedPreferences prefData = await SharedPreferences.getInstance();
      return prefData.getDouble(key);
    }catch(ex){
      throw ex;
    }
  }

  Future<void> setDouble(String key, double value) async{
    try{
      final SharedPreferences prefData = await SharedPreferences.getInstance();
      prefData.setDouble(key, value);
    }catch(ex){
      throw ex;
    }
  }

  Future<bool> getBool(String key) async{
    try{
      final SharedPreferences prefData = await SharedPreferences.getInstance();
      return prefData.getBool(key);
    }catch(ex){
      throw ex;
    }
  }

  Future<void> setBool(String key, bool value) async{
    try{
      final SharedPreferences prefData = await SharedPreferences.getInstance();
      prefData.setBool(key, value);
    }catch(ex){
      throw ex;
    }
  }

  Future<void> deleteValue(String key) async{
    try{
      final SharedPreferences prefData = await SharedPreferences.getInstance();
      prefData.remove(key); 
    }catch(ex){
      throw ex;
    }
  }

  Future<void> clear() async{
    try{
      final SharedPreferences prefData = await SharedPreferences.getInstance();
      prefData.clear(); 
    }catch(ex){
      throw ex;
    }
  }
}