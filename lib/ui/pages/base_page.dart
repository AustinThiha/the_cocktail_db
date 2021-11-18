import 'package:flutter/material.dart';

class BasePage extends StatelessWidget {
  final Widget body;

  const BasePage({Key? key, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: body));
  }
}
