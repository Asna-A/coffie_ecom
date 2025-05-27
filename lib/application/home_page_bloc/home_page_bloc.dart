import 'package:coffie_ecom/domain/IHomeRepo/IHomeRepo.dart';
import 'package:coffie_ecom/domain/models/coffee_info.dart';
import 'package:equatable/equatable.dart';
import 'package:fbloc_event_gen/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'home_page_bloc.g.dart';
part 'home_page_event.dart';
part 'home_page_state.dart';

@injectable
class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final IHomeRepo homeRepo;
  HomePageBloc(this.homeRepo) : super(HomePageState.initial()) {
    HomePageState.registerEvents(this);

    on<FetchCoffeeList>(_onFetchCoffeeList);
  }

  Future<void> _onFetchCoffeeList(
      FetchCoffeeList event, Emitter<HomePageState> emit) async {
    emit(state.copyWith(isLoading: true));
    await Future.delayed(Duration(seconds: 2));
    final result = await homeRepo.getCoffeesInfo();
    result.fold(
      (failure) {
        emit(state.copyWith(isLoading: false));
      },
      (coffeeModel) {
        emit(state.copyWith(isLoading: false, coffeeList: coffeeModel));
      },
    );
  }
}
