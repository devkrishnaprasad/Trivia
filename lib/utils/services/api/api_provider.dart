import 'package:dio/dio.dart';
import 'package:trivia/utils/services/constand.dart';

class ApiProvider {
  final AppConstansConfiguration _appConstansConfiguration =
      AppConstansConfiguration();
  final dio = Dio();

  Future<dynamic> apiManager(String url, dynamic body) async {
    print(
        'apiManager function called URL : ${_appConstansConfiguration.API_URL}$url');
    try {
      final response = await dio
          .post('${_appConstansConfiguration.API_URL}$url', data: body);
      print('API Response Status Code: ${response.statusCode}');
      return response.data;
    } catch (error) {
      print('Error in apiManager: $error');
      throw error;
    }
  }
}
