import 'package:injectable/injectable.dart';
import 'package:refyne_demo/helpers/api_provider.dart';

@lazySingleton
class ImageUploadRepository {
  ImageUploadRepository(this._apiProvider);
  final ApiProvider _apiProvider;

  Future<dynamic> uploadImageSomewhere(String imageAsBase64) async {
    final response = await _apiProvider.uploadImage(imageAsBase64);
    return response;
  }
}
