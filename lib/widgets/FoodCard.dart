import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_app/models/foods.dart';
import 'package:food_ordering_app/screens/details_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodCard extends StatelessWidget {
  final FoodsModel foodsModel;
  FoodCard({required this.foodsModel});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Material(
        color: Color(0xfff5f9ff),
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsScreen(food: foodsModel,),
            ),
          ),
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: 150,
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue, width: 0.5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      // borderRadius: BorderRadius.only(
                      //   topLeft: Radius.circular(10),
                      //   topRight: Radius.circular(10),
                      // ),
                    ),
                    child: ClipRRect(
                      // borderRadius: BorderRadius.only(
                      //   topLeft: Radius.circular(10),
                      //   topRight: Radius.circular(10),
                      // ),
                      child: CachedNetworkImage(
                        imageUrl:
                            foodsModel.image,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                 foodsModel.name,
                  style: GoogleFonts.poppins(),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 6),
                Text(
                  '\$${foodsModel.price}',
                  style: GoogleFonts.poppins(),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
