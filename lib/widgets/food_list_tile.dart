import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_app/models/foods.dart';
import 'package:food_ordering_app/screens/details_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';

class FoodListTile extends StatefulWidget {
  final FoodsModel foodsModel;
  FoodListTile({required this.foodsModel});
  @override
  _FoodListTileState createState() => _FoodListTileState();
}

class _FoodListTileState extends State<FoodListTile> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xfff5f9ff),
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailsScreen(
              food: widget.foodsModel,
            ),
          ),
        ),
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 150,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.blue,
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                  child: ClipRRect(
                    child: CachedNetworkImage(
                      imageUrl: widget.foodsModel.image,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      widget.foodsModel.name,
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: Text(
                        widget.foodsModel.description,
                        style: GoogleFonts.poppins(fontSize: 12),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$${widget.foodsModel.price}',
                            style: GoogleFonts.poppins(fontSize: 20),
                            textAlign: TextAlign.end,
                          ),
                          LikeButton(
                            isLiked: true,
                            likeBuilder: (_) => Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 4),
                  ],
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
