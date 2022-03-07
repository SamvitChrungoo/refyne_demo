import 'package:dio/dio.dart';

class ImageUploadInterceptor extends InterceptorsWrapper {
  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async =>
      handler.next(err);

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers = {
      'Authorization':
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IlNhbXZpdCBDaHJ1bmdvbyIsImlhdCI6MTUxNjIzOTAyMn0.tY-G7KhS9UJxbyNEaClrDxfsrXyHtk5dPWlQ73OilEY'
    };
    return handler.next(options);
  }

  @override
  Future onResponse(
          Response response, ResponseInterceptorHandler handler) async =>
      handler.next(response);
}
