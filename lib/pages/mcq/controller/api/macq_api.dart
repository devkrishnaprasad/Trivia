import 'package:trivia/pages/mcq/model/question_models.dart';
import 'package:trivia/utils/services/api/api_provider.dart';

class MCQApiService {
  // ignore: prefer_final_fields
  ApiProvider _apiProvider = ApiProvider();

  Future<List<QuestionRecord>> getQuestionBank(category) async {
    List<QuestionRecord> questionBank;

    var body = {"category": category};
    try {
      var response =
          await _apiProvider.apiManager("/get_questions/filtered", body);

      var restaurantList = response['response']['records'];
      questionBank = restaurantList
          .map<QuestionRecord>((p) => QuestionRecord.fromJson(p))
          .toList();
      if (restaurantList.isNotEmpty) {
        return questionBank;
      }
    } catch (error) {
      print('Error in getAllResturant: $error');
      return [];
    }
    return [];
  }
}
