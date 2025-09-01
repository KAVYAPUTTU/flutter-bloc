import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:grocery_app/data/cart_items.dart';
import 'package:grocery_app/features/home/modals/home_product_data.dart';
import 'package:meta/meta.dart';

part 'cartbloc_event.dart';
part 'cartbloc_state.dart';

class CartblocBloc extends Bloc<CartblocEvent, CartblocState> {
  CartblocBloc() : super(CartblocInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveFromCartEvent>(cartRemoveFromCartEvent);
  }
  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartblocState> emit) {
        emit(CartSucessState(cartItems: cartItems));
      }
  FutureOr<void> cartRemoveFromCartEvent(
      CartRemoveFromCartEvent event, Emitter<CartblocState> emit) {
       cartItems.remove(event.productDataModal);
       emit(CartSucessState(cartItems: cartItems)); 
      }
}
