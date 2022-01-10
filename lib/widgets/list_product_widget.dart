import 'package:flutter/material.dart';
import 'package:flutter_application_6/models/product.dart';
import 'package:flutter_application_6/widgets/selected_product_widget.dart';

class ListProductWidget extends StatefulWidget {
  final List<Product> productList;
  const ListProductWidget({Key key, this.productList}) : super(key: key);

  @override
  _ListProductWidgetState createState() => _ListProductWidgetState(productList);
}

class _ListProductWidgetState extends State<ListProductWidget> {
  final List<Product> productList;
  Product selectedProduct;

  _ListProductWidgetState(this.productList);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: ListView.builder(
            itemCount: productList.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    selectedProduct = productList[index];
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Colors.red,
                    child: Hero(
                        tag: "photo",
                        child: Image.network(productList[index].image)),
                  ),
                ),
              );
            },
            scrollDirection: Axis.horizontal,
          ),
        ),
        Expanded(
            flex: 4,
            child: Container(
                child: selectedProduct == null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.warning_rounded,
                            color: Colors.blueGrey,
                          ),
                          Text(
                            "Ürün seçilmemiş!",
                            style: TextStyle(color: Colors.blueGrey),
                          )
                        ],
                      )
                    : SelectedProductWidget(
                        selectedProduct: selectedProduct,
                      ))),
      ],
    );
  }
}
