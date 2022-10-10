// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Topic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Topic _$TopicFromJson(Map<String, dynamic> json) => Topic(
      name: json['name'] as String?,
      listAskAnswer: (json['listAskAnswer'] as List<dynamic>?)
          ?.map((e) => AskAnswer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TopicToJson(Topic instance) => <String, dynamic>{
      'name': instance.name,
      'listAskAnswer': instance.listAskAnswer,
    };

AskAnswer _$AskAnswerFromJson(Map<String, dynamic> json) => AskAnswer(
      answer: json['answer'] as String?,
      ask: json['ask'] as String?,
    );

Map<String, dynamic> _$AskAnswerToJson(AskAnswer instance) => <String, dynamic>{
      'ask': instance.ask,
      'answer': instance.answer,
    };
