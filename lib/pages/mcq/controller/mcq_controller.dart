import 'package:get/get.dart';
import 'package:trivia/pages/mcq/controller/api/macq_api.dart';
import 'package:trivia/pages/mcq/model/question_models.dart';

class MCQController extends GetxController {
  RxBool isloading = false.obs;
  var questionsList = List<QuestionRecord>.empty().obs;
  RxInt currentQuestionIndex = 0.obs;
  // ignore: prefer_final_fields
  MCQApiService _mcqApiService = MCQApiService();

  getQuestionBank(category) async {
    print("getAllRestaurantDetails() called ......");
    try {
      isloading.value = true;
      var restaurantDetails = await _mcqApiService.getQuestionBank(category);
      questionsList.assignAll(restaurantDetails);
    } catch (error) {
      print('Error during API call: $error');
    } finally {
      isloading.value = false;
    }
  }
}
