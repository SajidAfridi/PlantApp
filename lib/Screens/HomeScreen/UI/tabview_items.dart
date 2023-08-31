import 'package:flutter/material.dart';
import 'package:plant_store_app/Screens/ProductDetails/product_screen.dart';
import 'package:plant_store_app/Utils/plant_handler.dart';
import 'package:plant_store_app/models/plant.dart';

import '../../../common/colors.dart';

class PlantContainer extends StatelessWidget {
  final double height;
  final double width;
  final List<Plants> plants;

  const PlantContainer(
      {super.key,
      required this.height,
      required this.width,
      required this.plants});

  @override
  Widget build(BuildContext context) {
    TextStyle style = Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: AppColors.primaryColor,
          fontWeight: FontWeight.bold,
        );
    return SizedBox(
      height: height * 0.41,
      width: width * 0.6,
      child: ListView.builder(
          itemCount: plants.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            Plants plant = plants[index];
            return GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return ProductDetailsScreen(plants: plant,);
                }));
              },
              child: SizedBox(
                height: height * 0.4,
                width: width * 0.5,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: height * 0.23,
                        width: width * 0.45,
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              AppColors.textColor1,
                              AppColors.imageBackgroundColor,
                            ],
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                plant.name,
                                style: style.copyWith(
                                    fontWeight: FontWeight.normal),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    plant.type,
                                    style: style.copyWith(
                                        color: AppColors.primaryColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    height: height * 0.03,
                                    width: width * 0.13,
                                    decoration: const BoxDecoration(
                                      color: AppColors.imageBackgroundColor,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                    ),
                                    child: Center(
                                        child: Text(
                                      plant.price,
                                      style: style.copyWith(
                                          color: AppColors.textColor1),
                                    )),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: -20,
                      right: 20,
                      height: 260,
                      child: SizedBox(
                        height: height * 0.3,
                        width: width* 0.4,
                        child: Hero(
                          tag: 'homeToDetail',
                          child: Image(
                              image: Image.asset(
                            'assets/images/${plant.assetImage}',
                            fit: BoxFit.cover,
                          ).image),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
