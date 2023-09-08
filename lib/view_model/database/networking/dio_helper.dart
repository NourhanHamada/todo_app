import 'package:dio/dio.dart';
import 'end_points.dart';


//Dio Helper That's Connect and Talk to API.
class DioHelper {
  static late Dio dio;

  //Here The Initialize of Dio and Start Connect to API Using baseUrl.
  static init() {
    dio = Dio(
      BaseOptions(
        //Here the URL of API.
        baseUrl: baseUrl,

        //   receiveDataWhenStatusError: true,
        //Here we Put The Headers Needed in The API.
        headers: {
          'Accept': 'application/json',
          //'lang':'en'
        },
      ),
    );
  }

  //This Function to call API and get Some Data based on url(End Points) and Headers needed in API to get the Specific Data.
  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? queryParameters,
    ProgressCallback? onReceiveProgress,
    String? token,
  }) async {
    try {
      dio.options.headers = {
        'Authorization': 'Bearer ${token ?? ''}',
      };
      final Response response = await dio.get(
        url,
        queryParameters: queryParameters,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}