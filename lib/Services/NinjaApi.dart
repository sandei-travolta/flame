import 'dart:convert';

import 'package:flame/utils/Constants.dart';
import 'package:http/http.dart' as http;

import '../Model/JokesModel.dart';
class NinjaApi{
  Constants constants=Constants();
  Uri chuckNorrisApi=Uri.parse("https://api.api-ninjas.com/v1/chucknorris?");
  Future<Jokes?> fetchJokes()async{
    try{
      final response=await http.get(chuckNorrisApi,headers: {'X-Api-Key': constants.apiKey});
      if(response.statusCode==200){
        return Jokes.fromJson(json.decode(response.body));
      }
      else{
        return null;
      }
    }
    catch(e){
      print(e);
    }
  }
}