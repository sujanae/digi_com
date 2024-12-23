import 'package:digi_com/services/cart_services.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatefulWidget {
  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final CartService _cartService = CartService();
  final _formKey = GlobalKey<FormState>();

  String _email = '';
  // ignore: unused_field
  String _name = '';

  void _processPayment() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Simulate payment processing
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text(
            'Purchase Successful',
            style: const TextStyle(color: Colors.green),
          ),
          content: Text('Your digital products will be emailed to $_email',
              style: const TextStyle(color: Colors.white)),
          backgroundColor: Colors.grey[900],
          actions: [
            TextButton(
              onPressed: () {
                _cartService.clearCart();
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              child: const Text('OK', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Order Summary',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _cartService.cartItems.length,
                  itemBuilder: (ctx, i) {
                    final product = _cartService.cartItems[i];
                    return Card(
                      color: Colors.grey[850],
                      child: ListTile(
                        title: Text(
                          product.name,
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: Text(
                          '\₹${product.price.toStringAsFixed(2)}',
                          style: TextStyle(color: Colors.greenAccent),
                        ),
                      ),
                    );
                  },
                ),
                Divider(color: Colors.grey),
                Text(
                  'Total: \₹${_cartService.totalPrice.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.greenAccent,
                  ),
                ),
                SizedBox(height: 20),
                _buildTextInputField(
                  labelText: 'Full Name',
                  onSaved: (value) => _name = value!,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your full name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                _buildTextInputField(
                  labelText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (value) => _email = value!,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _processPayment,
                  child: Text(
                    'Complete Purchase',
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.green,
                    minimumSize: Size(double.infinity, 50),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }

  Widget _buildTextInputField({
    required String labelText,
    TextInputType keyboardType = TextInputType.text,
    required Function(String?) onSaved,
    required String? Function(String?) validator,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.grey[400]),
        filled: true,
        fillColor: Colors.grey[850],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.greenAccent),
        ),
      ),
      style: TextStyle(color: Colors.white),
      keyboardType: keyboardType,
      validator: validator,
      onSaved: onSaved,
    );
  }
}
