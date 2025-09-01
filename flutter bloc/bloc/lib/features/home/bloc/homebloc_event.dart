part of 'homebloc_bloc.dart';

@immutable
sealed class HomeblocEvent {}

class HomeInitialEvent extends HomeblocEvent{}

class HomeProductWishlistButtonClickedEvent extends HomeblocEvent{
  final ProductDataModal clickedProduct;

  HomeProductWishlistButtonClickedEvent({
    required this.clickedProduct,
    });

}
class HomeProductCartButtonClickedEvent extends HomeblocEvent{
  final ProductDataModal clickedProduct;

  HomeProductCartButtonClickedEvent({required this.clickedProduct});

}
class HomeProductWishlistButtonNavigateEvent extends HomeblocEvent{

}
class HomeProductCartButtonNavigateEvent extends HomeblocEvent{

}