import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:refyne_demo/helpers/dio_interceptor.dart';

@lazySingleton
class ApiProvider {
  ApiProvider() {
    _dioClient = Dio();
    _dioClient.interceptors.add(ImageUploadInterceptor());
  }
  late Dio _dioClient;

  Future<dynamic> uploadImage(String imageAsBase64) async {
    dynamic response = {};

    // To simulate API delay
    await Future.delayed(const Duration(seconds: 2));
    try {
      // Uncomment the API call below to simulate error scenario

      // response = await _dioClient.fetch(RequestOptions(
      //     path: 'https://some_dummy_path.com/v1',
      //     method: 'POST',
      //     data: {'base64': imageAsBase64}));

      return response;
    } catch (e) {
      return null;
    }
  }
}
