import 'package:image_picker/image_picker.dart';

abstract class ImageUploadEvent {}

class UploadNewImageEvent extends ImageUploadEvent {
  XFile? image;
  UploadNewImageEvent(this.image);
}

class ResteImageEvent extends ImageUploadEvent {}
