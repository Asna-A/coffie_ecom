import 'package:coffie_ecom/core/colors/colors.dart';
import 'package:coffie_ecom/domain/models/navbar_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class WidgetNavbar extends StatelessWidget {
  final String? currentRoute;
  const WidgetNavbar({super.key, required this.currentRoute});

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;

    return BottomAppBar(
      color: Colors.white,
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 12.h),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(navbarIcons.length, (index) {
                return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                          context, navbarIcons[index]['route']!);
                    },
                    child: SvgPicture.asset(navbarIcons[index]['image']!,
                        width: 24.w,
                        height: 24.h,
                        color: currentRoute == navbarIcons[index]['route']
                            ? orangeColor
                            : textColor));
              }))),
    );
  }
}
