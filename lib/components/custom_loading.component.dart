import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCustomLoading extends StatelessWidget {
  final Color? color;

  const MyCustomLoading({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return (Platform.isIOS)
        ? CupertinoActivityIndicator(
            color: color,
          )
        : const CircularProgressIndicator();
  }
}
