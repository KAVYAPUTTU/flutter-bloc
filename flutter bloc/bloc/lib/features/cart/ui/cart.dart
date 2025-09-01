import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/features/cart/bloc/cartbloc_bloc.dart';

import 'cart_title_widget.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartblocBloc cartBloc = CartblocBloc();
  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Items'),
      ),
      body: BlocConsumer<CartblocBloc, CartblocState>(
        bloc: cartBloc,
        listener: (context, state) {},
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartSucessState:
              final successState = state as CartSucessState;
              return ListView.builder(
                itemCount: successState.cartItems.length,
                itemBuilder: (context, index) {
                  return CartTitleWidget(
                    productDataModal: successState.cartItems[index],
                    cartBloc: cartBloc,
                  );
                },
              );
            default:
          }

          return Container();
        },
      ),
    );
  }
}
