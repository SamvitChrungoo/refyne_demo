import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refyne_demo/bloc/image_upload_bloc.dart';
import 'package:refyne_demo/helpers/api_provider.dart';
import 'package:refyne_demo/repository/image_upload_repository.dart';
import 'package:refyne_demo/view/home_page.dart';

import 'helpers/injection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjetions();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
          create: (_) => ImageUploadBloc(ImageUploadRepository(ApiProvider())),
          child: HomePage()),
    );
  }
}
