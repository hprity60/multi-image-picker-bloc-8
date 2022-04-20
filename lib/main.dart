import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'bloc/bloc/product_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => ProductBloc(),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final productBloc = BlocProvider.of<ProductBloc>(context);
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () async {
            final ImagePicker _picker = ImagePicker();
            final List<XFile>? images = await _picker.pickMultiImage();
            if (images != null) {
              productBloc.add(onSelectMultipleImageEvent(images));
            }
          },
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 20),
            height: 150,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) => state.images != null
                    ? ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.symmetric(vertical: 5),
                        itemCount: state.images!.length,
                        itemBuilder: (_, i) => Container(
                              height: 100,
                              width: 120,
                              margin: EdgeInsets.only(left: 3.0, right: 3.0),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: FileImage(File(state.images![i].path)),
                                fit: BoxFit.cover,
                              )),
                            ))
                    : Icon(
                        Icons.photo_camera,
                        size: 80,
                        color: Colors.grey,
                      )),
          ),
        ),
      ),
    );
  }
}
