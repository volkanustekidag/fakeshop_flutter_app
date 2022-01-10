import 'package:flutter/material.dart';
import 'package:flutter_application_6/models/product.dart';

class SelectedProductWidget extends StatelessWidget {
  final Product selectedProduct;
  const SelectedProductWidget({Key key, this.selectedProduct})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 7,
            child:
                Hero(tag: "photo", child: Image.network(selectedProduct.image)),
          ),
          Expanded(
              flex: 1,
              child: Text(
                selectedProduct.title,
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          Expanded(
              flex: 1,
              child: Text(
                selectedProduct.price.toString() + "₺",
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              )),
          Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.star,
                    color: Colors.amber[600],
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.amber[600],
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.amber[600],
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.amber[600],
                  ),
                  Icon(Icons.star),
                ],
              ))
        ],
      ),
    );
  }
}
