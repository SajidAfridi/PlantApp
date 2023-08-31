import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:plant_store_app/Screens/Cart/cart_screen.dart';
import 'package:plant_store_app/common/colors.dart';
import 'package:plant_store_app/models/plant.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Plants plants;

  const ProductDetailsScreen({super.key, required this.plants});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var style = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: AppColors.textColor1,
      appBar: AppBar(
        leading: IconButton(
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(
              Colors.white,
            ),
          ),
          splashRadius: 8,
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.primaryColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_border,
              color: Colors.white,
            ),
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                AppColors.primaryColor,
              ),
            ),
            splashRadius: 8,
          ),
        ],
      ),
      body: SizedBox(
        height: height * 1,
        width: width * 1,
        child: Stack(
          fit: StackFit.loose,
          children: [
            SizedBox(
              height: height * 0.5,
              width: width * 1,
              child: Transform.scale(
                scale: 1.3,
                child: Hero(
                  tag: 'homeToDetail',
                  child: Image(
                      image: Image.asset(
                    'assets/images/${plants.assetImage}',
                  ).image),
                ),
              ),
            ),
            Positioned(
              top: height * .39,
              height: 600,
              child: Container(
                height: height * 0.6,
                width: width * 1,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  plants.name,
                                  style: style.titleLarge!.copyWith(
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      plants.price,
                                      style: style.bodyMedium!.copyWith(
                                          color: AppColors.textColor1,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Center(
                                      child: SizedBox(
                                        height: height * 0.02,
                                        width: width * 0.3,
                                        child: RatingBar.builder(
                                          initialRating: 4,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: false,
                                          itemCount: 5,
                                          itemSize: 15,
                                          itemPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 2.0, vertical: 0),
                                          itemBuilder: (context, _) =>
                                              const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 10,
                                          ),
                                          onRatingUpdate: (rating) {
                                            // print(rating);
                                          },
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            Container(
                              width: width * 0.30,
                              height: height * 0.05,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: AppColors.primaryColor),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const Text(
                                    '1',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.18,
                        width: width * 0.9,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'About',
                                  style: style.bodyMedium!.copyWith(
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.bold),
                                )),
                            Expanded(
                              child: Text(
                                plants.description,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(color: AppColors.textColor1),
                                textAlign: TextAlign.justify,
                                softWrap: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SpecificationListView(
                          height: height, width: width, plants: plants),
                      // for cart and Elevated Button
                      Padding(
                        padding: EdgeInsets.zero,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        dismissDirection:
                                            DismissDirection.horizontal,
                                        backgroundColor: Colors.white,
                                        content: Text(
                                          'Item added to Cart',
                                          style: style.bodyLarge!.copyWith(
                                              color: AppColors.primaryColor),
                                        )));
                              },
                              style: const ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                  AppColors.imageBackgroundColor,
                                ),
                              ),
                              splashRadius: 5,
                              icon: const Icon(
                                Icons.shopping_cart_outlined,
                                color: AppColors.primaryColor,
                                size: 30,
                              ),
                            ),
                            SizedBox(
                              width: width * 0.04,
                            ),
                            SizedBox(
                              width: width * 0.7,
                              height: height * 0.06,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return const CartScreen();
                                  }));
                                },
                                style: ButtonStyle(
                                  elevation: MaterialStateProperty.all(2),
                                  splashFactory: InkRipple.splashFactory,
                                  shadowColor:
                                      const MaterialStatePropertyAll<Color>(
                                          AppColors.primaryColor),
                                  backgroundColor: MaterialStateProperty.all(
                                      AppColors.primaryColor),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.shopping_bag_outlined,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Buy Now',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SpecificationListView extends StatelessWidget {
  const SpecificationListView({
    super.key,
    required this.height,
    required this.width,
    required this.plants,
  });

  final double height;
  final double width;
  final Plants plants;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 0.1,
      width: width * 1,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(
            width: width * 0.4,
            child: ListTile(
              title: const Text('Height'),
              subtitle: Text("${plants.height}\""),
              leading: const CircleAvatar(
                backgroundColor: AppColors.primaryColor,
                child: Icon(
                  Icons.height_outlined,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            width: width * 0.45,
            child: ListTile(
              title: const Text('Humidity'),
              subtitle: Text('${plants.humidity}%'),
              leading: const CircleAvatar(
                backgroundColor: AppColors.primaryColor,
                child: Icon(
                  Icons.water_drop_outlined,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            width: width * 0.4,
            child: ListTile(
              title: const Text('Width'),
              subtitle: Text("${plants.width}"),
              leading: const CircleAvatar(
                backgroundColor: AppColors.primaryColor,
                child: Icon(
                  Icons.width_full_outlined,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
