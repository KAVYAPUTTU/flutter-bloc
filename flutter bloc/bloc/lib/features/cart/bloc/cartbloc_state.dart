part of 'cartbloc_bloc.dart';

@immutable
sealed class CartblocState {}

abstract class CartActionState extends CartblocState{}

final class CartblocInitial extends CartblocState {}

class CartSucessState extends CartblocState{
     final List<ProductDataModal> cartItems;

  CartSucessState({required this.cartItems});
}

