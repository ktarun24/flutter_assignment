import 'package:Movie_tickets/Widget/movie_item.dart';
import 'package:Movie_tickets/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Razorpay razorpay;
  @override
  void initState() {
    super.initState();

    razorpay = new Razorpay();

    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerErrorFailure);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    razorpay.clear();
  }

  void openCheckout(num amount, String name) {
    var options = {
      "key": "rzp_test_skolJje6EBVyZu",
      "amount": amount * 100,
      "name": name,
      "description": "Payment for the some random product",
      "external": {
        "wallets": ["paytm"]
      }
    };

    try {
      razorpay.open(options);
    } catch (e) {
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('Something went wrong')));
    }
  }

  void handlerPaymentSuccess() {
    print("Pament success");
    Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text('Payment Successful')));
  }

  void handlerErrorFailure() {
    print("Pament error");
    Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text('Payment Failed')));
  }

  void handlerExternalWallet() {
    print("External Wallet");
  }

  var sort = false;
  var category = "";

  var dummyData = DummyData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Online Tickets"),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FlatButton(
                  color: Theme.of(context).accentColor,
                  onPressed: () {
                    return showDialog<String>(
                      barrierDismissible: false,
                      context: context,
                      builder: (ctx) {
                        return SimpleDialog(
                          children: <Widget>[
                            FlatButton(
                              onPressed: () {
                                Navigator.of(ctx).pop("");
                              },
                              child: Text('All'),
                            ),
                            FlatButton(
                              onPressed: () {
                                Navigator.of(ctx).pop("action");
                              },
                              child: Text('Action'),
                            ),
                            FlatButton(
                              onPressed: () {
                                Navigator.of(ctx).pop("thriller");
                              },
                              child: Text('Thriller'),
                            ),
                            FlatButton(
                              onPressed: () {
                                Navigator.of(ctx).pop("drama");
                              },
                              child: Text('Drama'),
                            ),
                          ],
                        );
                      },
                    ).then((value) {
                      setState(() {
                        category = value;
                        print(value);
                      });
                    });
                  },
                  child: Text("Categories")),
            ],
          ),
          SizedBox(height: 5,),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return category == ""
                    ? MovieItem(
                        name: dummyData.data[index]["name"],
                        date: dummyData.data[index]["date"],
                        rating: dummyData.data[index]["rating"],
                        category: dummyData.data[index]["category"],
                        url: dummyData.data[index]["url"],
                        description: dummyData.data[index]["description"],
                        price: dummyData.data[index]["price"],
                        payment: () {
                          openCheckout(dummyData.data[index]["price"],
                              dummyData.data[index]["name"]);
                        },
                      )
                    : MovieItem(
                        name: dummyData.category(category)[index]["name"],
                        date: dummyData.category(category)[index]["date"],
                        rating: dummyData.category(category)[index]["rating"],
                        category: dummyData.category(category)[index]
                            ["category"],
                        url: dummyData.category(category)[index]["url"],
                        description: dummyData.category(category)[index]
                            ["description"],
                        price: dummyData.category(category)[index]["price"],
                        payment: () {
                          openCheckout(
                              dummyData.category(category)[index]["price"],
                              dummyData.category(category)[index]["name"]);
                        },
                      );
              },
              itemCount: category == ""
                  ? dummyData.data.length
                  : dummyData.category(category).length,
            ),
          ),
        ],
      ),
    );
  }
}
