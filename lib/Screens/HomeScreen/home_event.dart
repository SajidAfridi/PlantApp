part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class InitialLoadingHomePageItems extends HomeEvent {}

class SearchBarEvent extends HomeEvent {}

class BottomTabBarItemClickedEvent extends HomeEvent {}

class BottomNavBarItemClickedEvent extends HomeEvent {}

class NavigateToCartPageEvent extends HomeEvent {}

class ProductClickedEvent extends HomeEvent {
  final int id;

  ProductClickedEvent({required this.id});
}

class ProfileScreenClickedEvent extends HomeEvent {}
