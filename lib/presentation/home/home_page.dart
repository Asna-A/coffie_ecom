import 'package:coffie_ecom/application/home_page_bloc/home_page_bloc.dart';
import 'package:coffie_ecom/core/colors/colors.dart';
import 'package:coffie_ecom/core/text/text_style.dart';
import 'package:coffie_ecom/domain/models/coffee_categories.dart';
import 'package:coffie_ecom/presentation/widgets/widget_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  static const String routeName = 'home_page';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomePageBloc homePageBloc = BlocProvider.of<HomePageBloc>(context);
    return Scaffold(
        body: Column(
          children: [
            Container(
              color: frameColor,
              child: Column(
                children: [
                  Stack(children: [
                    _buildBackgroundGradient(),
                    _buildTopContent()
                  ]),
                ],
              ),
            ),
            _buildCategoryList(),
            _buildCoffeeInfo(homePageBloc)
          ],
        ),
        bottomNavigationBar:
            WidgetNavbar(currentRoute: ModalRoute.of(context)?.settings.name));
  }
}

Widget _buildTopContent() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 24.h),
        Text('Location', style: kTextStyleRegular12.copyWith(color: textColor)),
        SizedBox(height: 8.h),
        Row(
          children: [
            Text('Bilzen, Tanjungbalai',
                style: kTextStyleRegular14.copyWith(color: lightWhiteColor)),
            SizedBox(width: 4.w),
            SvgPicture.asset('assets/icons/arrow_drop_down.svg',
                width: 14.w, height: 14.h, color: Colors.white)
          ],
        ),
        SizedBox(height: 24.h),
        Row(
          children: [_buildSearchBar(), SizedBox(width: 16.w), _buildFilter()],
        ),
        SizedBox(height: 24.h),
        _buildBanner()
      ],
    ),
  );
}

Widget _buildBackgroundGradient() {
  return Container(
    height: 261.h,
    width: double.infinity,
    decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [darkBlackColor, lightBlackColor],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft)),
  );
}

Widget _buildFilter() {
  return Container(
      decoration: BoxDecoration(
          color: orangeColor, borderRadius: BorderRadius.circular(12.r)),
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: SvgPicture.asset('assets/icons/filter.svg',
              color: Colors.white)));
}

Widget _buildSearchBar() {
  return Stack(
    children: [
      Container(
          height: 52.h,
          width: 259.w,
          decoration: BoxDecoration(
              color: Color(0XFF2A2A2A),
              borderRadius: BorderRadius.circular(12.r))),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Row(
          children: [
            SvgPicture.asset('assets/icons/search.svg',
                width: 14.w, height: 14.h, color: Colors.white),
            SizedBox(width: 8.w),
            Text('Search Coffee',
                style: kTextStyleRegular14.copyWith(color: textColor))
          ],
        ),
      )
    ],
  );
}

Widget _buildBanner() {
  return SizedBox(
      width: 327.w,
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    offset: Offset(0.w, 4.h),
                    blurRadius: 4.r,
                    spreadRadius: 0)
              ]),
          child: Image.asset('assets/images/banner.png', fit: BoxFit.cover)));
}

Widget _buildCategoryList() {
  return BlocSelector<HomePageBloc, HomePageState, int>(
    selector: (state) => state.selectedCategoryIndex,
    builder: (context, selectedCategoryIndex) {
      return Container(
        color: frameColor,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SizedBox(
            height: 29.h,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: coffeeCategories.length,
              itemBuilder: (context, index) {
                final isSelected = index == selectedCategoryIndex;
                return GestureDetector(
                    onTap: () {
                      context.setHomePageBlocState(
                          selectedCategoryIndex: index);
                    },
                    child: Padding(
                        padding: EdgeInsets.only(
                            right: index == coffeeCategories.length - 1
                                ? 0
                                : 12.w),
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.w, vertical: 4.h),
                            decoration: BoxDecoration(
                                color: isSelected ? orangeColor : chipBgColor,
                                borderRadius: BorderRadius.circular(6.r)),
                            child: Text(coffeeCategories[index],
                                style: isSelected
                                    ? kTextStyleSemiBold14.copyWith(
                                        color: Colors.white)
                                    : kTextStyleRegular14.copyWith(
                                        color: lightBlackColor)))));
              },
            ),
          ),
        ),
      );
    },
  );
}

Widget _buildCoffeeInfo(HomePageBloc homePageBloc) {
  homePageBloc.add(FetchCoffeeList());
  return BlocBuilder<HomePageBloc, HomePageState>(
    buildWhen: (previous, current) =>
        previous.selectedCategoryIndex != current.selectedCategoryIndex ||
        previous.coffeeList != current.coffeeList,
    builder: (context, state) {
      final selectedCategory = coffeeCategories[state.selectedCategoryIndex];
      final filteredCoffeeInfo = state.selectedCategoryIndex == 0
          ? state.coffeeList
          : state.coffeeList
              .where((e) => e.category == selectedCategory)
              .toList();
      if (state.isLoading == true) {
        return CircularProgressIndicator();
      }
      return Expanded(
        child: Container(
          color: frameColor,
          child: GridView.builder(
              padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
              physics: BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15.w,
                  mainAxisSpacing: 24.h,
                  childAspectRatio: 156.h / 238.w),
              itemCount: filteredCoffeeInfo.length,
              itemBuilder: (context, index) {
                final item = filteredCoffeeInfo[index];
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r)),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(12.r),
                                child: Image.asset(item.image,
                                    height: 128.h,
                                    width: 140.w,
                                    fit: BoxFit.cover)),
                            Align(
                                alignment: Alignment.topRight,
                                child: Opacity(
                                    opacity: 0.3,
                                    child: Container(
                                        height: 28.h,
                                        width: 51.w,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(12.r),
                                                bottomLeft:
                                                    Radius.circular(24.r)),
                                            gradient: LinearGradient(
                                                colors: [
                                                  darkBlackColor,
                                                  lightBlackColor
                                                ],
                                                begin: Alignment.topRight,
                                                end: Alignment.bottomLeft))))),
                            Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: EdgeInsets.only(top: 8.h, left: 97.w),
                                child: Row(
                                  children: [
                                    SvgPicture.asset('assets/icons/Star.svg'),
                                    SizedBox(width: 4.w),
                                    Text(item.rating,
                                        style: kTextStyleRegular8.copyWith(
                                            color: Colors.white))
                                  ],
                                ),
                              ),
                            ),
                          ]),
                          SizedBox(height: 8.h),
                          Text(item.name, style: kTextStyleSemiBold16),
                          SizedBox(height: 4.h),
                          Text(item.category,
                              style: kTextStyleRegular12.copyWith(
                                  color: textColor)),
                          SizedBox(height: 8.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('\$${item.price}',
                                  style: kTextStyleSemiBold18.copyWith(
                                      color: priceColor)),
                              GestureDetector(
                                  onTap: () => ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                '${item.name} added to cart'),
                                            duration: Duration(seconds: 2),
                                            backgroundColor: orangeColor),
                                      ),
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: orangeColor,
                                          borderRadius:
                                              BorderRadius.circular(8.r)),
                                      child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8.w, vertical: 8.h),
                                          child: SvgPicture.asset(
                                              'assets/icons/plus.svg',
                                              color: Colors.white))))
                            ],
                          ),
                        ]),
                  ),
                );
              }),
        ),
      );
    },
  );
}
