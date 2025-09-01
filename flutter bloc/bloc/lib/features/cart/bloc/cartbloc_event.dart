part of 'cartbloc_bloc.dart';

@immutable
sealed class CartblocEvent {}

class CartInitialEvent extends CartblocEvent{

}
class CartRemoveFromCartEvent extends CartblocEvent{
final ProductDataModal productDataModal;

  CartRemoveFromCartEvent({required this.productDataModal});
}
