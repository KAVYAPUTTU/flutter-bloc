import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/features/home/bloc/homebloc_bloc.dart';
import 'package:grocery_app/features/cart/ui/cart.dart';
import 'package:grocery_app/features/home/ui/product_title_widget.dart';
import 'package:grocery_app/features/wishlist/ui/wishlist.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }
  final HomeblocBloc homeBloc = HomeblocBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeblocBloc, HomeblocState>(
      bloc: homeBloc,
      listenWhen: (previous, current)=>current is HomeActionState,
      buildWhen: (previous, current)=>current is! HomeActionState ,
      listener: (context, state) {
        if(state is HomeNavigateToCartPageActionState){
           Navigator.push(context, MaterialPageRoute(builder: (context)=>Cart()));
        }
        else if(state is HomeNavigateToWishlistPageActionState){
           Navigator.push(context, MaterialPageRoute(builder: (context)=>Wishlist()));
        }
        else if(state is HomeProductItemWishlistedActionState){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Item wishlisted")));
        }
         else if(state is HomeProductItemCartedActionState){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Item added to Cart")));
        }
      },
      builder: (context, state) {
        switch(state.runtimeType){
          case HomeLoadingState:
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
          case HomeLoadedSuccessState:
          final successstate = state as HomeLoadedSuccessState;
          return Scaffold(
          appBar: AppBar(
            title: Text('kavya Grocery App'),
            backgroundColor: Colors.teal.shade300,
            foregroundColor: Colors.white,
            elevation: 5,
            actions: [
              IconButton(onPressed: (){
                homeBloc.add(HomeProductWishlistButtonNavigateEvent());
              }, icon:Icon(Icons.favorite_border)),
              IconButton(onPressed: (){
                homeBloc.add(HomeProductCartButtonNavigateEvent());
              }, icon:Icon(Icons.shopping_cart_outlined))
            ],
          ),
          body: ListView.builder(
            itemCount: successstate.products.length,
            itemBuilder:(context, index) {
            return ProductTitleWidget(productDataModal: successstate.products[index], homeBloc: homeBloc,); 
          },),
        );
          case HomeErrorState:
          return Scaffold(
            body: Center(
              child: Text('error'),
            ),
          );
          
          default:
          return SizedBox();
        }
      },
    );
  }
}

