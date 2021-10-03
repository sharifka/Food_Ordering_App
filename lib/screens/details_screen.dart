import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_app/models/foods.dart';
import 'package:food_ordering_app/providers/cartprovider.dart';
import 'package:food_ordering_app/screens/cart_screen.dart';
import 'package:food_ordering_app/widgets/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatefulWidget {
  static const String id = 'DetailsScreen';
  final FoodsModel food;
  DetailsScreen({required this.food});
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, value, _) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          automaticallyImplyLeading: false,
          title: Text('Details'),
          actions: [
            IconButton(
              onPressed: () => Navigator.pushNamed(context, CartScreen.id),
              icon: Badge(
                  badgeContent: Text(
                    value.items.length.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                  badgeColor: Colors.red,
                  child: Icon(Icons.shopping_cart)),
            ),
          ],
        ),
        body: ListView(
          children: [
            Container(
              width: double.infinity,
              height: 250,
              child: CachedNetworkImage(
                imageUrl: widget.food.image,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Text(
                          widget.food.name,
                          style: GoogleFonts.poppins(fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: Text.rich(
                          TextSpan(
                            text: '\$',
                            style: GoogleFonts.poppins(
                              fontSize: 30,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w300,
                            ),
                            children: [
                              TextSpan(
                                text: widget.food.price.toString(),
                                style: GoogleFonts.poppins(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w200,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ],
                          ),
                          // overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    widget.food.description,
                    style: GoogleFonts.poppins(fontSize: 13),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: Row(
          children: [
            Expanded(
              child: Material(
                child: LikeButton(
                  isLiked: true,
                  size: 40,
                  circleColor: CircleColor(
                    start: Color(0xff00ddff),
                    end: Color(0xff0099cc),
                  ),
                  bubblesColor: BubblesColor(
                    dotPrimaryColor: Colors.red,
                    dotSecondaryColor:
                        Theme.of(context).primaryColor.withOpacity(0.15),
                  ),
                  likeBuilder: (_) => Icon(
                    Icons.favorite,
                    color: Theme.of(context).primaryColor,
                    size: 40,
                  ),
                  likeCount: 0,
                  countBuilder: (count, isLiked, text) => Text(''),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 4,
              child: CustomFlatButton(
                label:
                    value.isInCart(widget.food) ? 'Remove it' : 'Add to Cart',
                onTap: () {
                  if (value.isInCart(widget.food))
                    value.removeTocart(widget.food);
                  else
                    value.addTocart(widget.food);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
