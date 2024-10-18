import 'package:flutter_dotenv/flutter_dotenv.dart';

class Constants{
  String databaseName="Tasks";
  String categoriesDb="Categories";
  String apiKey="";
  String tasktittle="tittle";
  String taskDecription="description";
  String startTime="start_time";
  String  stopTime="stop_time";
  String taskDate="date";
  String SPORTS_API_KEY=dotenv.env['SPORTSAPI-KEY']??"";

}