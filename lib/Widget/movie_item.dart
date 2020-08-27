import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class MovieItem extends StatelessWidget {
  final String name;
  final String date;
  final int rating;
  final String category;
  final String url;
  final String description;
  final int price;
  final Function payment;

  const MovieItem(
      {@required this.name,
      @required this.date,
      @required this.rating,
      @required this.category,
      @required this.url,
      @required this.description,
      @required this.price,
      @required this.payment});
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      margin: EdgeInsets.all(15),
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                child: Image.network(
                  url,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
              Positioned(
                bottom: 10,
                right: 20,
                child: RaisedButton(
                  color: Theme.of(context).primaryColor,
                  onPressed: payment,
                  child: Text(
                    "Rs$price Book Now",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Positioned(
                  bottom: 15,
                  left: 20,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      color: Colors.black38,
                      child: SmoothStarRating(
                          allowHalfRating: false,
                          onRated: (v) {},
                          starCount: 5,
                          rating: rating + 0.0,
                          size: 25.0,
                          isReadOnly: true,
                          color: Theme.of(context).accentColor,
                          borderColor: Theme.of(context).accentColor,
                          spacing: 0.0),
                    ),
                  )),
            ],
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(12),
            color: Colors.grey[200],
            alignment: Alignment.topLeft,
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    name,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Text(
                    description,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Text("Category: $category",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),),
                    ),
                    Container(
                      child: Text("Released: $date",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
              
            ),
          ),
        ],
      ),
    );
  }
}
