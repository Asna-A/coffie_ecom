// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_bloc.dart';

// **************************************************************************
// EventGenerator
// **************************************************************************

class SelectCategory extends HomePageEvent {
  final int selectedCategoryIndex;

  const SelectCategory({required this.selectedCategoryIndex});

  @override
  List<Object?> get props => [selectedCategoryIndex];
}

// **************************************************************************
// StateGenerator
// **************************************************************************

// Events Generated for corresponding states in State Class
class UpdateIsLoadingEvent extends HomePageEvent {
  final bool isLoading;
  const UpdateIsLoadingEvent({required this.isLoading});

  @override
  List<Object?> get props => [isLoading];
}

class UpdateSelectedCategoryIndexEvent extends HomePageEvent {
  final int selectedCategoryIndex;
  const UpdateSelectedCategoryIndexEvent({required this.selectedCategoryIndex});

  @override
  List<Object?> get props => [selectedCategoryIndex];
}

/// A state class that represents the complete state of the 'HomePageBloc'.
/// This class is immutable and extends Equatable for value comparison.
class HomePageState extends Equatable {
  final bool isLoading;
  final int selectedCategoryIndex;

  /// Creates a new instance of HomePageState with the given parameters.
  const HomePageState(
      {required this.isLoading, required this.selectedCategoryIndex});

  /// Creates the initial state of the 'HomePageBloc'.
  /// This method sets up default values for all state properties.
  static HomePageState initial() {
    return HomePageState(isLoading: false, selectedCategoryIndex: 0);
  }

  /// Creates a copy of this state with the given parameters replaced.
  /// If a parameter is not provided, the value from the current state is used.
  HomePageState copyWith({bool? isLoading, int? selectedCategoryIndex}) {
    return HomePageState(
        isLoading: isLoading ?? this.isLoading,
        selectedCategoryIndex:
            selectedCategoryIndex ?? this.selectedCategoryIndex);
  }

  /// Creates a copy of this state with the ability to set specific fields to null.
  /// The boolean parameters control whether the corresponding field should be set to null.
  HomePageState copyWithNull({bool? isLoading, int? selectedCategoryIndex}) {
    return HomePageState(
        isLoading: isLoading ?? this.isLoading,
        selectedCategoryIndex:
            selectedCategoryIndex ?? this.selectedCategoryIndex);
  }

  /// Registers all event handlers for the 'HomePageBloc'.
  /// This method sets up the event-to-state mapping for all possible state updates.
  static void registerEvents(HomePageBloc bloc) {
    bloc.on<UpdateIsLoadingEvent>((event, emit) {
      emit(bloc.state.copyWith(isLoading: event.isLoading));
    });

    bloc.on<UpdateSelectedCategoryIndexEvent>((event, emit) {
      emit(bloc.state
          .copyWith(selectedCategoryIndex: event.selectedCategoryIndex));
    });
  }

  /// Returns a list of all properties used for equality comparison.
  @override
  List<Object?> get props => [isLoading, selectedCategoryIndex];
}

/// Extension on BuildContext that provides convenient methods for updating the 'HomePageBloc' state.
/// This extension simplifies state updates by providing a single method to update multiple state properties.
extension HomePageBlocContextExtension on BuildContext {
  /// Updates the 'HomePageBloc' state with the provided values.
  /// Only the specified parameters will be updated; others will remain unchanged.
  /// Uses UnspecifiedDataType.instance as a sentinel value to determine which parameters to update.
  void setHomePageBlocState({
    dynamic isLoading = UnspecifiedDataType.instance,
    dynamic selectedCategoryIndex = UnspecifiedDataType.instance,
  }) {
    final myBloc = read<HomePageBloc>(); // Read the MyBloc instance
    if (isLoading != UnspecifiedDataType.instance) {
      myBloc.add(UpdateIsLoadingEvent(isLoading: isLoading as bool));
    }

    if (selectedCategoryIndex != UnspecifiedDataType.instance) {
      myBloc.add(UpdateSelectedCategoryIndexEvent(
          selectedCategoryIndex: selectedCategoryIndex as int));
    }
  }
}
