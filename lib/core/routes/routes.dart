import 'package:coffie_ecom/application/home_page_bloc/home_page_bloc.dart';
import 'package:coffie_ecom/domain/core/dependency_injection/di_configuration.dart';
import 'package:coffie_ecom/presentation/cart/cart_page.dart';
import 'package:coffie_ecom/presentation/home/home_page.dart';
import 'package:coffie_ecom/presentation/notification/notification_page.dart';
import 'package:coffie_ecom/presentation/wishlist/wishlist_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AppRouter {
  static Route<dynamic> getRoutes(RouteSettings settings) {
    switch (settings.name) {
      case HomePage.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) {
            return BlocProvider(
              create: (context) => getIt<HomePageBloc>(),
              child: HomePage(),
            );
          },
        );
      case CartPage.routeName:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) {
              return CartPage();
            });
      case WishlistPage.routeName:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) {
              return WishlistPage();
            });
      case NotificationPage.routeName:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) {
              return NotificationPage();
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
