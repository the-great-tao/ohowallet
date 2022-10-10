import 'package:json_annotation/json_annotation.dart';

part 'Topic.g.dart';

@JsonSerializable()
class Topic {
  String? name;
  List<AskAnswer>? listAskAnswer;

  Topic({
    this.name,
    this.listAskAnswer,
  });

  factory Topic.fromJson(Map<String, dynamic> json) => _$TopicFromJson(json);

  Map<String, dynamic> toJson() => _$TopicToJson(this);
}

@JsonSerializable()
class AskAnswer {
  String? ask;
  String? answer;

  AskAnswer({
    this.answer,
    this.ask,
  });

  factory AskAnswer.fromJson(Map<String, dynamic> json) =>
      _$AskAnswerFromJson(json);

  Map<String, dynamic> toJson() => _$AskAnswerToJson(this);
}
