import 'package:coffie_ecom/presentation/widgets/widget_navbar.dart';
import 'package:flutter/material.dart';

class WishlistPage extends StatelessWidget {
  static const String routeName = 'wishlist_page';

  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;

    return Scaffold(
        body: Center(child: Text(currentRoute!)),
        bottomNavigationBar:
            WidgetNavbar(currentRoute: ModalRoute.of(context)?.settings.name));
  }
}
