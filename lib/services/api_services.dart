import 'dart:convert';
import 'dart:io';

import 'package:chatgpt/constants/api_constants.dart';
import 'package:chatgpt/models/models_model.dart';
import 'package:http/http.dart' as http;

class ApiServices{

  static Future<List<ModelsModel>> getModels()async{
  try{
    var response = await http.get(Uri.parse("$baseUrl/models"),headers: {
      "Authorization":"Bearer $apiKey"
    });
    Map<String,dynamic> jsonResponse = jsonDecode(response.body);
    if(jsonResponse['error']!= null){
      throw HttpException(jsonResponse["error"]["message"]);
    }
    print("json response : $jsonResponse");
    List temp =[];
    for (var value in jsonResponse["data"]){
       temp.add(value);
      // log("temp ${value['id']}");
    }
  return ModelsModel.modelsFromSnapshot(temp);
  }catch(err){
    print('error $err');
    rethrow;
  }


  }
}