part of 'home_page_bloc.dart';

@generateEvents
abstract class HomePageEvent extends Equatable {
  const HomePageEvent();
  const factory HomePageEvent.fetchCoffeeList() = FetchCoffeeList;
}
