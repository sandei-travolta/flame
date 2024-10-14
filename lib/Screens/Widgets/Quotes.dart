import 'package:flame/Services/NinjaApi.dart';
import 'package:flame/utils/Colors.dart';
import 'package:flutter/material.dart';

import '../../Model/JokesModel.dart';
class QuotesWidget extends StatefulWidget {
  const QuotesWidget({
    super.key,
  });

  @override
  State<QuotesWidget> createState() => _QuotesWidgetState();
}

class _QuotesWidgetState extends State<QuotesWidget> {
  late Future<Jokes?> _callJokes;
  late NinjaApi ninjaApi;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ninjaApi=NinjaApi();
    _callJokes=ninjaApi.fetchJokes();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        height: 130,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: calenderColor
        ),
        child: FutureBuilder<Jokes?>(
            future:_callJokes,
            builder: (context,snapshot){
              if(snapshot.connectionState==ConnectionState.waiting){
                return Center(child: Text("Fetching Joke👻👻"));
              }
              else if(snapshot.hasData){
                return Center(child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(snapshot.data!.joke,maxLines: 4,style: TextStyle(fontSize: 18),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("😂😂😂",style: TextStyle(fontSize: 20),)
                        ],
                      )
                    ],
                  ),
                ));
              }
              else{
                return Text("Some Errors");

              }
            }),
      ),
    );
  }
}

