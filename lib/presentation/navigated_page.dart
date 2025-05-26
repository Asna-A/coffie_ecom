import 'package:flutter/material.dart';

class NavigatedPage extends StatelessWidget {
  static const String routeName = 'navigated_page';

  const NavigatedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Navigated Page')),
    );
  }
}