// To parse this JSON data, do
//
//     final questionBank = questionBankFromJson(jsonString);

import 'dart:convert';

QuestionBank questionBankFromJson(String str) =>
    QuestionBank.fromJson(json.decode(str));

String questionBankToJson(QuestionBank data) => json.encode(data.toJson());

class QuestionBank {
  Response response;

  QuestionBank({
    required this.response,
  });

  factory QuestionBank.fromJson(Map<String, dynamic> json) => QuestionBank(
        response: Response.fromJson(json["response"]),
      );

  Map<String, dynamic> toJson() => {
        "response": response.toJson(),
      };
}

class Response {
  String msg;
  List<QuestionRecord> records;
  bool status;

  Response({
    required this.msg,
    required this.records,
    required this.status,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        msg: json["msg"],
        records: List<QuestionRecord>.from(
            json["records"].map((x) => QuestionRecord.fromJson(x))),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "records": List<dynamic>.from(records.map((x) => x.toJson())),
        "status": status,
      };
}

class QuestionRecord {
  Category category;
  String correctAnswer;
  LastModifiedDateTime lastModifiedDateTime;
  List<String> options;
  String points;
  String questionId;
  String questions;

  QuestionRecord({
    required this.category,
    required this.correctAnswer,
    required this.lastModifiedDateTime,
    required this.options,
    required this.points,
    required this.questionId,
    required this.questions,
  });

  factory QuestionRecord.fromJson(Map<String, dynamic> json) => QuestionRecord(
        category: categoryValues.map[json["category"]]!,
        correctAnswer: json["correct_answer"],
        lastModifiedDateTime:
            lastModifiedDateTimeValues.map[json["last_modified_date_time"]]!,
        options: List<String>.from(json["options"].map((x) => x)),
        points: json["points"],
        questionId: json["question_id"],
        questions: json["questions"],
      );

  Map<String, dynamic> toJson() => {
        "category": categoryValues.reverse[category],
        "correct_answer": correctAnswer,
        "last_modified_date_time":
            lastModifiedDateTimeValues.reverse[lastModifiedDateTime],
        "options": List<dynamic>.from(options.map((x) => x)),
        "points": points,
        "question_id": questionId,
        "questions": questions,
      };
}

enum Category { SPORTS }

final categoryValues = EnumValues({"sports": Category.SPORTS});

enum LastModifiedDateTime { THE_20240120105632_IST }

final lastModifiedDateTimeValues = EnumValues(
    {"2024-01-20 10:56:32 IST": LastModifiedDateTime.THE_20240120105632_IST});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
