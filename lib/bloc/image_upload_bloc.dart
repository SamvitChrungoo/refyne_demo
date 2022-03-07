import 'dart:convert';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:refyne_demo/bloc/image_upload_events.dart';
import 'package:refyne_demo/bloc/image_upload_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refyne_demo/constants.dart';

import '../repository/image_upload_repository.dart';

class ImageUploadBloc extends Bloc<ImageUploadEvent, ImageUploadState> {
  final ImageUploadRepository _imageUploadRepository;

  ImageUploadBloc(this._imageUploadRepository)
      : super(InitialImageUploadState());

  @override
  Stream<ImageUploadState> mapEventToState(ImageUploadEvent event) async* {
    if (event is ResteImageEvent) {
      yield InitialImageUploadState();
    } else if (event is UploadNewImageEvent) {
      yield* _uploadNewImageEvent(event);
    }
  }

  Stream<ImageUploadState> _uploadNewImageEvent(
      UploadNewImageEvent event) async* {
    try {
      if (event.image == null) {
        yield ImageUploadErrorState(kErrorMessageUndefined);
        return;
      }
      yield ImageUploadLoadingState();
      final imageEncoded = await _getProcessedAndEncodedImage(event.image!);
      if (imageEncoded.isEmpty) {
        yield ImageUploadErrorState(kErrorMessageFileTooBig);
        return;
      }
      final uploadImgResponse =
          await _imageUploadRepository.uploadImageSomewhere(imageEncoded);
      if (uploadImgResponse == null) {
        yield ImageUploadErrorState(kErrorMessageUndefined);
        return;
      }
      yield ImageUploadSuccessState(event.image);
    } catch (e) {
      yield ImageUploadErrorState(kErrorMessageUndefined);
    }
  }

  Future<String> _getProcessedAndEncodedImage(XFile file) async {
    var bytes = await file.readAsBytes();
    var sizeinMB = (bytes.lengthInBytes) / (1024 * 1024);
    if (sizeinMB <= 4.0) {
      final imageEncoded = base64.encode(bytes);
      return imageEncoded;
    } else {
      final compressedImage =
          await FlutterImageCompress.compressWithFile(file.path);
      sizeinMB = (compressedImage!.lengthInBytes) / (1024 * 1024);
      if (sizeinMB <= 4.0) {
        final imageEncoded = base64.encode(compressedImage);
        return imageEncoded;
      } else {
        return '';
      }
    }
  }
}
