import 'package:equatable/equatable.dart';
import 'package:fbloc_event_gen/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_page_bloc.g.dart';
part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageState.initial()) {
    HomePageState.registerEvents(this);

    on<SelectCategory>((event, emit) {
      emit(state.copyWith(selectedCategoryIndex: event.selectedCategoryIndex));
    });
    on<SelectIcon>((event, emit) {
      emit(state.copyWith(selectedIconIndex: event.selectedIconIndex));
    });
  }
}
