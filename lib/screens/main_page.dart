import 'package:flutter/material.dart';
import 'package:flutter_application_6/data/api/product_api.dart';
import 'package:flutter_application_6/models/product.dart';
import 'package:flutter_application_6/widgets/list_product_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Product> productList = [];
  bool loadingControl = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ProductApi.getProducts().then((value) {
      setState(() {
        productList = value;
        loadingControl = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBuild(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            loadingControl
                ? CircularProgressIndicator()
                : Flexible(
                    child: ListProductWidget(
                      productList: productList,
                    ),
                  ),
            buyNowButtonBuild(context)
          ],
        ),
      ),
    );
  }

  Widget buyNowButtonBuild(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          primary: Colors.blueGrey,
          fixedSize: Size(MediaQuery.of(context).size.width - 30, 5)),
      child: Text("Buy Now!"),
    );
  }

  AppBar appBarBuild() {
    return AppBar(
      backgroundColor: Colors.blueGrey,
      actions: [
        Icon(Icons.shopping_bag_outlined),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            maxRadius: 20,
            backgroundColor: Colors.white,
            child: Text(
              "VÜ",
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
        )
      ],
      title: Text(
        "fakeshop",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
