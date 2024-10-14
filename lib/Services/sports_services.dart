import 'package:flame/utils/Constants.dart';
import 'package:http/http.dart' as http;
class SportsService{
  String GET_LOGO="https://media.api-sports.io/football/teams/42.png";

  var headers={
    'x-rapidapi-key':Constants().SPORTS_API_KEY,
    'x-rapidapi-host':'v3.football.api-sports.io'
  };
  void fetchLogo()async{
    var request=http.Request('GET',Uri.parse(GET_LOGO));
    request.headers.addAll(headers);
    http.StreamedResponse response=await request.send();
    if(response.statusCode==200){
      var body=await response.stream.bytesToString();
      print(body);
    }
    else{
      print(response.statusCode);
    }
  }
}