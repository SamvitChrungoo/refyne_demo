// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:refyne_demo/bloc/image_upload_states.dart';
import 'package:refyne_demo/view/components/error_view.dart';

import '../bloc/image_upload_bloc.dart';
import '../bloc/image_upload_events.dart';
import 'components/initial_view.dart';
import 'components/loading_view.dart';
import 'components/success_view.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ImagePicker _imagePicker;
  late ImageUploadBloc _imageUploadBolc;

  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
    _imageUploadBolc = BlocProvider.of<ImageUploadBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1B1C21),
      body: Center(
        child: BlocBuilder(
          bloc: _imageUploadBolc,
          builder: (context, state) {
            if (state is InitialImageUploadState) {
              return InitialView(onTap: _openCamera);
            } else if (state is ImageUploadLoadingState) {
              return LoadingView();
            } else if (state is ImageUploadSuccessState) {
              return SuccessView(
                  image: File(state.image!.path),
                  onReset: () => _imageUploadBolc.add(ResteImageEvent()));
            } else if (state is ImageUploadErrorState) {
              return ErrorView(
                  errorMessage: state.errorMessage,
                  onTap: () => _imageUploadBolc.add(ResteImageEvent()));
            } else {
              return SizedBox();
            }
          },
        ),
      ),
    );
  }

  _openCamera() async {
    final XFile? photo =
        await _imagePicker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      _imageUploadBolc.add(UploadNewImageEvent(photo));
    }
  }
}
