import 'package:coffie_ecom/presentation/cart/cart_page.dart';
import 'package:coffie_ecom/presentation/home/home_page.dart';
import 'package:coffie_ecom/presentation/notification/notification_page.dart';
import 'package:coffie_ecom/presentation/wishlist/wishlist_page.dart';

final List<Map<String, String>> navbarIcons = const [
  {'image': 'assets/icons/home.svg', 'route': HomePage.routeName},
  {
    'image': 'assets/icons/notification.svg',
    'route': NotificationPage.routeName
  },
  {'image': 'assets/icons/heart.svg', 'route': WishlistPage.routeName},
  {'image': 'assets/icons/bag.svg', 'route': CartPage.routeName}
];
