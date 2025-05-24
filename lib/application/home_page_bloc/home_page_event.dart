part of 'home_page_bloc.dart';

@generateEvents
abstract class HomePageEvent extends Equatable {
  const HomePageEvent();
  const factory HomePageEvent.selectCategory({required int selectedCategoryIndex}) =
      SelectCategory;
  const factory HomePageEvent.selectIcon({required int selectedIconIndex}) =
      SelectIcon;
}
