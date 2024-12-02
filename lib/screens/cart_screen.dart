import 'package:digi_com/screens/checkout_screen.dart';
import 'package:digi_com/services/cart_services.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartService _cartService = CartService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Expanded(
            child: _cartService.cartItems.isEmpty
                ? Center(
                    child: Text(
                      'Your cart is empty!',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: _cartService.cartItems.length,
                    itemBuilder: (ctx, i) {
                      final product = _cartService.cartItems[i];
                      return Card(
                        color: Colors.grey[850],
                        margin:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        child: ListTile(
                          title: Text(
                            product.name,
                            style: TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            '\₹${product.price.toStringAsFixed(2)}',
                            style: TextStyle(color: Colors.greenAccent),
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              setState(() {
                                _cartService.removeFromCart(product);
                              });
                            },
                          ),
                        ),
                      );
                    },
                  ),
          ),
          if (_cartService.cartItems.isNotEmpty)
            Container(
              color: Colors.black,
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total: \₹${_cartService.totalPrice.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.greenAccent,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CheckoutScreen(),
                        ),
                      );
                    },
                    child: Text('Checkout'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.green,
                      minimumSize: Size(120, 45),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}
