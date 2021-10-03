import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_ordering_app/models/foods.dart';
import 'package:food_ordering_app/providers/cartprovider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartItem extends StatefulWidget {
  final FoodsModel food;
  CartItem({required this.food});

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, value, _) => Container(
        height: 120,
        decoration: BoxDecoration(
          color: Theme.of(context).bottomAppBarColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Theme.of(context).colorScheme.secondary.withOpacity(0.08),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 120,
              height: double.infinity,
              child: CachedNetworkImage(
                imageUrl: widget.food.image,
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  widget.food.name,
                                  style: GoogleFonts.roboto(fontSize: 18),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  text: '\$',
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w900,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: widget.food.price.toString(),
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w900,
                                        letterSpacing: 1.2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        CustomButton(
                          icon: Icon(FontAwesomeIcons.trashAlt),
                          onPressed: () => showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context, 'Yes');
                                    value.removeTocart(value.items[0]);
                                  },
                                  child: Text('Yes'),
                                ),
                                TextButton(
                                  onPressed: () =>Navigator.pop(context,'No'),
                                  child: Text('No'),
                                ),
                              ],
                              title: Text('Confirm'),
                              content:
                                  Text('are you sure to remove this item?'),
                            ),
                            //barrierDismissible: false,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        CustomButton(
                          icon: Icon(Icons.remove),
                          onPressed: () => value.reupdatecounter(widget.food),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            widget.food.quantity.toString(),
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              letterSpacing: 1.2,
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        CustomButton(
                          icon: Icon(Icons.add),
                          onPressed: () => value.updatecounter(widget.food),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final Icon icon;
  final void Function()? onPressed;
  CustomButton({required this.icon, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: onPressed,
        child: Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.05),
              borderRadius: BorderRadius.circular(50)),
          child: icon,
        ),
      ),
    );
  }
}
