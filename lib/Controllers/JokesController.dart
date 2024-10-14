import 'package:flame/Model/JokesModel.dart';
import 'package:flame/Services/NinjaApi.dart';
import 'package:get/get.dart';

class JokesController extends GetxController{
  NinjaApi ninjaApi=NinjaApi();
  final Rx<Jokes?> joke=Jokes(joke: "").obs;
  Future<void> fetchData()async{
    try{
      final Jokes? a=await ninjaApi.fetchJokes();
      joke.value=a;
    }catch(e){
      print(e);
    }
  }
}