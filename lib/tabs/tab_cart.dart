import 'package:flutter/material.dart';
import 'package:simple_shopping/models/model_auth.dart';
import 'package:simple_shopping/models/model_cart.dart';
import 'package:provider/provider.dart';

class CartTab extends StatelessWidget {
  const CartTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final authClient = Provider.of<FirebaseAuthProvider>(context);
    return FutureBuilder(
      future: cart.fetchCartItemsOrAddCart(authClient.user),
      builder: (context, snapshot) {
        if (cart.cartItems.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
            itemCount: cart.cartItems.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  Navigator.pushNamed(context, '/detail',
                      arguments: cart.cartItems[index]);
                },
                title: Text(cart.cartItems[index].title),
                subtitle: Text(cart.cartItems[index].price.toString()),
                leading: Image.network(cart.cartItems[index].imageUrl),
                trailing: InkWell(
                    onTap: () {
                      cart.removeItemFromCart(
                          authClient.user, cart.cartItems[index]);
                    },
                    child: const Icon(Icons.delete)),
              );
            },
          );
        }
      },
    );
  }
}
