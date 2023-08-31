import 'package:flutter/material.dart';
import 'package:plant_store_app/Screens/Cart/cart_screen.dart';
import 'package:plant_store_app/common/colors.dart';
import 'package:plant_store_app/common/drawer.dart';

class MyAppBar extends StatelessWidget {
  final double Heigth;
  final double Width;

  const MyAppBar({super.key, required this.Heigth, required this.Width});

  @override
  Widget build(BuildContext context) {
    var height = Heigth;
    var width = Width;
    return SizedBox(
      height: height * 0.1,
      width: width * 0.85,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        CircleAvatar(
            backgroundImage: Image.asset(
          'assets/images/leaf3.jpeg',
          fit: BoxFit.scaleDown,
        ).image),
        IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return const CartScreen();
            }));
          },
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(
              AppColors.primaryColor,
            ),
          ),
          splashRadius: 8,
          icon: const Icon(
            Icons.shopping_cart,
            color: Colors.white,
          ),
        ),
      ]),
    );
  }
}
