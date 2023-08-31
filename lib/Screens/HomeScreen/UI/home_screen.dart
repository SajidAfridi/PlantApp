import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:plant_store_app/Helper/HomeHelper/app_bar.dart';
import 'package:plant_store_app/Screens/Auth/Login/LoginUI/login_screen.dart';
import 'package:plant_store_app/Screens/Cart/cart_screen.dart';
import 'package:plant_store_app/Screens/HomeScreen/UI/search_bar.dart';
import 'package:plant_store_app/Screens/HomeScreen/UI/tabview_items.dart';
import 'package:plant_store_app/common/colors.dart';
import 'package:plant_store_app/models/plant.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Utils/plant_handler.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int currentIndex = 0;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    super.initState();
    currentIndex = 0;
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle style = Theme.of(context)
        .textTheme
        .bodyMedium!
        .copyWith(color: AppColors.primaryColor, fontWeight: FontWeight.bold);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Column(
            children: [
              MyAppBar(
                Heigth: height,
                Width: width,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              SizedBox(
                height: height * 0.14,
                width: width * 0.9,
                child: Text(
                  'Let\'s find your \nplants!',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              searchBar(height: height, width: width),
              const SizedBox(
                height: 10,
              ),
              TabBar(
                tabs: [
                  Tab(
                    child: Text(
                      'Recommended',
                      style: style,
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Top',
                      style: style,
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Indoor',
                      style: style,
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Outdoor',
                      style: style,
                    ),
                  ),
                ],
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  // Creates border
                  color: AppColors.imageBackgroundColor,
                ),
                controller: tabController,
                indicatorPadding: const EdgeInsets.all(5.0),
                indicatorSize: TabBarIndicatorSize.tab,
                isScrollable: true,
              ),
              FutureBuilder<List<Plants>>(
                  future: PlantsHandler.getAllPlants(context),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (snapshot.hasData) {
                      List<Plants> allPlants = snapshot.data!;
                      List<Plants> recommendedPlants =
                          PlantsHandler.getRecommendedPlants(allPlants);
                      List<Plants> topPlants =
                          PlantsHandler.getTopPlants(allPlants);
                      List<Plants> indoorPlants =
                          PlantsHandler.getIndoorPlants(allPlants);
                      List<Plants> outdoorPlants =
                          PlantsHandler.getOutdoorPlants(allPlants);

                      return SizedBox(
                        height: height * 0.35,
                        width: width * 0.9,
                        child: TabBarView(
                          controller: tabController,
                          children: [
                            PlantContainer(
                              plants: recommendedPlants,
                              height: height,
                              width: width,
                            ),
                            PlantContainer(
                              plants: topPlants,
                              height: height,
                              width: width,
                            ),
                            PlantContainer(
                              plants: indoorPlants,
                              height: height,
                              width: width,
                            ),
                            PlantContainer(
                              plants: outdoorPlants,
                              height: height,
                              width: width,
                            ),
                          ],
                        ),
                      );
                    } else {
                      return const Text('No data available.');
                    }
                  }),
              //For the item slider
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Recent Viewed', style: style),
                ),
              ),
              SizedBox(
                height: height * 0.1,
                width: width * 0.85,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.zero,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: height * 0.05,
                      width: width * 0.6,
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: CircleAvatar(
                            backgroundImage: Image.asset(
                          'assets/images/leaf3.jpeg',
                          fit: BoxFit.scaleDown,
                        ).image),
                        title: Text(
                          "Chalathea",
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: AppColors.primaryColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        subtitle: Text(
                          'It\'s spines grows',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: AppColors.textColor2,
                                    fontSize: 12,
                                  ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: buildBottomNavigationBar(context),
      ),
    );
  }

  BottomNavigationBar buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (item) {
        setState(() {
          if (item == 0) {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const HomeScreen();
            }));
          } else if (item == 1) {
            _showLogoutDialog(context); // Show the logout dialog
          } else if (item == 2) {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const CartScreen();
            }));
          }
          currentIndex = item;
        });
      },
      selectedIconTheme: const IconThemeData(
        color: AppColors.primaryColor,
        size: 35,
      ),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Cart',
        ),
      ],
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                var email = prefs.setBool('email', false);
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context){
                  return LoginScreen();
                }), (r){
                  return false;
                });
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }}
