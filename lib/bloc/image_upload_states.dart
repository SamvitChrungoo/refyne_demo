import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

abstract class ImageUploadState extends Equatable {}

class InitialImageUploadState extends ImageUploadState {
  @override
  List<Object?> get props => [];
}

class ImageUploadLoadingState extends ImageUploadState {
  @override
  List<Object?> get props => [];
}

class ImageUploadSuccessState extends ImageUploadState {
  final XFile? image;
  ImageUploadSuccessState(this.image);
  @override
  List<Object?> get props => [image];
}

class ImageUploadErrorState extends ImageUploadState {
  final String errorMessage;
  ImageUploadErrorState(this.errorMessage);
  @override
  List<Object?> get props => [errorMessage];
}
