
import 'dart:convert';

import 'package:flutterapptracker/uitilits/app_url.dart';
import 'package:http/http.dart'as http;

import '../model/worldstate.dart';

class StateServices{
  Future<Worldstate>fetchworldstate()async{
    final response =await http.get(Uri.parse(AppUrl.worldstaeapi));

    if(response.statusCode==200){
      var data=jsonDecode(response.body);
      return Worldstate.fromJson(data);
    }else{
      throw Exception('Error');
    }
  }

  Future<List<dynamic>> CountryApi() async {
    var data;
    final response=await http.get(Uri.parse(AppUrl.CounterList));
    if(response.statusCode==200){
      data =jsonDecode(response.body);
      return data;
    }
    else{
      throw Exception("Error");
    }
  }
}