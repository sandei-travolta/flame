import 'dart:convert';

class Jokes {
  String joke;

  Jokes({
    required this.joke,
  });

  factory Jokes.fromRawJson(String str) => Jokes.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Jokes.fromJson(Map<String, dynamic> json) => Jokes(
    joke: json["joke"],
  );

  Map<String, dynamic> toJson() => {
    "joke": joke,
  };
}