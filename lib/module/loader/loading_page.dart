import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sentimen/resources/resources.dart';
import 'package:sizer/sizer.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: Image(
            image: Resources.images.oceanSpark,
            height: 250,
          ),
        ),
      ),
    );
  }
}
