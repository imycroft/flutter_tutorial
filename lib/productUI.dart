import 'package:flutter/material.dart';
import 'product.dart';

class ProductUI extends StatefulWidget {
  @override
  _ProductUIState createState() => _ProductUIState();
}

class _ProductUIState extends State<ProductUI> {
  final productNameController = TextEditingController();
  final productPriceController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    productNameController.dispose();
    productPriceController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Add a product',
                style: TextStyle(
                    color: Colors.black
                )),
            backgroundColor: Colors.amber


        ),
        body: Column(
          children: [
            TextField(
              controller: productNameController,
              decoration: InputDecoration(
                  hintText: 'Enter Product name',
                  icon: Icon(
                      Icons.add_shopping_cart
                  )
              ),
            ),
            TextField(
              controller: productPriceController,
              decoration: InputDecoration(
                  hintText: 'Enter Product price',
                  icon: Icon(
                      Icons.monetization_on_outlined
                  )
              ),
            ),
            RaisedButton(
              onPressed: () {
                Product p = new Product(name: productNameController.text, price: double.tryParse(productPriceController.text), quantity: 10, barCode: "1233");
                ProductViewModel.writeProduct(p);
                print('name:${p.name}, price: ${p.price}');
              },
              child: Text('Confirm'),
              color: Colors.green[600],
            )
          ],
        )
    );
  }
}



