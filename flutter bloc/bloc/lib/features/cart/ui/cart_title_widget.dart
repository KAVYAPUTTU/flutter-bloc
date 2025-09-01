import 'package:flutter/material.dart';
import 'package:grocery_app/features/home/bloc/homebloc_bloc.dart';
import 'package:grocery_app/features/home/modals/home_product_data.dart';

import '../bloc/cartbloc_bloc.dart';

class CartTitleWidget extends StatelessWidget {
  final ProductDataModal productDataModal;
  final CartblocBloc cartBloc;
  const CartTitleWidget(
      {super.key, required this.productDataModal, required this.cartBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(productDataModal.imageUrl))),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            productDataModal.name,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(productDataModal.description),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                '\$${productDataModal.price}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      // cartBloc.add(HomeProductWishlistButtonClickedEvent(
                      //     clickedProduct: productDataModal));
                    },
                    icon: Icon(Icons.favorite_border),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  IconButton(
                      onPressed: () {
                       cartBloc.add(CartRemoveFromCartEvent(productDataModal: productDataModal
                        
                       ));
                      },
                      icon: Icon(Icons.shopping_cart_rounded))
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
