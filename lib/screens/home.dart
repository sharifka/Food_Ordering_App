import 'package:after_layout/after_layout.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_app/providers/providers.dart';
import 'package:food_ordering_app/screens/screens.dart';
import 'package:food_ordering_app/widgets/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomScreen extends StatefulWidget {
  static const String id = 'HomeScreen';
  @override
  _HomScreenState createState() => _HomScreenState();
}

class _HomScreenState extends State<HomScreen>
    with AfterLayoutMixin<HomScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, value, _) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Food Ordering App"),
          backgroundColor: Colors.red,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
            ),
            IconButton(
              onPressed: () => Navigator.pushNamed(context, CartScreen.id),
              icon: Badge(
                badgeContent: Text(
                  value.items.length.toString(),
                  style: TextStyle(color: Colors.white),
                ),
                child: Icon(Icons.shopping_cart),
                badgeColor: Colors.red,
              ),
            ),
          ],
        ),
        body: Consumer<Foodsprovider>(
          builder: (context, value, _) => ListView(
            children: [
              HomeCarousel(
                images: [
                  'https://images2.minutemediacdn.com/image/upload/c_crop,h_1126,w_2000,x_0,y_181/f_auto,q_auto,w_1100/v1554932288/shape/mentalfloss/12531-istock-637790866.jpg',
                  'https://c.ndtvimg.com/2020-04/dih4ifhg_pasta_625x300_22_April_20.jpg',
                  'https://cms.qz.com/wp-content/uploads/2018/09/DSC_2908-e1538281562360.jpg?quality=75&strip=all&w=1600&h=900&crop=1',
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvHT8U4Cfb4To_Iw5lmDT2aEXw9imrK_dnBQ&usqp=CAU',
                ],
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Food Categories',
                            style: GoogleFonts.poppins(),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => CategoryListScreen(),
                                ),
                              );
                            },
                            child: Text(
                              'veiw all',
                              style: GoogleFonts.poppins(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 96,
                      width: double.infinity,
                      child: value.categoryloading
                          ? Center(child: CircularProgressIndicator())
                          : ListView.builder(
                              scrollDirection: Axis.horizontal,
                              padding: EdgeInsets.symmetric(horizontal: 4),
                              itemCount: value.categories.length,
                              itemBuilder: (context, index) => Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: CategoryCard(
                                  category: value.categories[index],
                                ),
                              ),
                            ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Latest Food',
                            style: GoogleFonts.poppins(),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => FoodListScreen(),
                                ),
                              );
                            },
                            child: Text(
                              'Veiw all',
                              style: GoogleFonts.poppins(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 210,
                      width: double.infinity,
                      child: value.foodloading
                          ? Center(child: CircularProgressIndicator())
                          : ListView.builder(
                              scrollDirection: Axis.horizontal,
                              padding: EdgeInsets.symmetric(horizontal: 4),
                              itemCount: value.food.length,
                              itemBuilder: (context, index) => FoodCard(
                                foodsModel: value.food[index],
                              ),
                            ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Broast and chips',
                            style: GoogleFonts.poppins(),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => FoodListScreen(),
                                ),
                              );
                            },
                            child: Text(
                              'Veiw all',
                              style: GoogleFonts.poppins(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 210,
                      width: double.infinity,
                      child: ListView.builder(
                          reverse: true,
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          itemCount: value.food.length,
                          itemBuilder: (context, index) => FoodCard(
                                foodsModel: value.food[index],
                              )),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    Provider.of<Foodsprovider>(context, listen: false).getFoods();
    Provider.of<Foodsprovider>(context, listen: false).getCategories();
  }
}
