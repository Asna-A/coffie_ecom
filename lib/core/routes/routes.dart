import 'package:coffie_ecom/application/home_page_bloc/home_page_bloc.dart';
import 'package:coffie_ecom/presentation/home_page/home_page.dart';
import 'package:coffie_ecom/presentation/navigated_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AppRouter {
  static Route<dynamic> getRoutes(RouteSettings settings) {
    switch (settings.name) {
      case HomePage.routeName:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
              create: (context) => HomePageBloc(),
              child: HomePage(),
            );
          },
        );
      case NavigatedPage.routeName:
        return MaterialPageRoute(builder: (context) {
          return NavigatedPage();
        });
    }
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        body: Center(
          child: const Text(
            'page not found',
          ),
        ),
      ),
    );
  }
}
