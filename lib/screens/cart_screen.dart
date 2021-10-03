import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_app/providers/providers.dart';
import 'package:food_ordering_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  static const String id = 'CartScreen';
  late final int data;
  //   final FoodsModel food;
  // CartScreen({required this.food});
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, value, _) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('Cart'),
          actions: [
            IconButton(
              onPressed: () => showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  actions: [
                    TextButton(
                      onPressed: () {
                        value.removeTocart(value.items[0]);
                        Navigator.pop(context,'Yes');
                      },
                      child: Text('Yes'),
                    ),
                    TextButton(
                      onPressed: () =>Navigator.pop(context,'No'),
                      child: Text('No'),
                    ),
                  ],
                  title: Text('Confirm'),
                  content: Text(
                    'Are you sure to remove all items from the cart?',
                  ),
                ),
              ),
              icon: Icon(Icons.delete),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                itemCount: value.items.length,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: CartItem(
                    food: value.items[index],
                  ),
                ),
              ),
            ),
            Visibility(
              visible: true,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
                  children: [
                    Consumer<Foodsprovider>(
                      builder: (context, xog, _) => Column(
                        children: [
                          Text(
                            'Total',
                            style: TextStyle(
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.6),
                              fontSize: 14,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              text: '\$',
                              style: TextStyle(
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.70),
                                fontWeight: FontWeight.w400,
                                fontSize: 22,
                              ),
                              children: [
                                TextSpan(
                                  text: value.getTotal().toString(),
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 23,
                                    letterSpacing: 2.2,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: OrderNowButton(
                        onTap: () {
                          value.addorder(value.items[0],context);
                        },
                      ),
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
