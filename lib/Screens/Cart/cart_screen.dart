import 'package:flutter/material.dart';

import '../../common/colors.dart';
import '../HomeScreen/UI/home_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var style = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Cart',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: AppColors.primaryColor, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: height* 0.02,),
          SizedBox(
            height: height * 0.55,
            width: width * 0.85,
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: height * 0.14,
                  width: width * 0.5,
                  child: Card(
                    elevation: 0.5,
                    color: AppColors.imageBackgroundColor,
                    child: ListTile(
                      isThreeLine: true,
                      contentPadding: const EdgeInsets.all(8.0),
                      leading: CircleAvatar(
                          backgroundImage: Image.asset(
                        'assets/images/leaf3.jpeg',
                        fit: BoxFit.scaleDown,
                      ).image),
                      title: Text(
                        "Chalathea",
                        style: style.bodyMedium!.copyWith(
                          color: AppColors.primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'It\'s spines grows',
                                style: style.bodySmall!.copyWith(
                                  color: AppColors.textColor2,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Transform.scale(
                                alignment: Alignment.centerLeft,
                                scale: 0.5,
                                child: SizedBox(
                                  height: height* 0.05,
                                  width: width * 0.10,
                                  child: IconButton(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                      side: MaterialStateProperty.all(
                                        const BorderSide(
                                            style: BorderStyle.solid,
                                            color: AppColors.primaryColor),
                                      ),
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                      ),
                                    ),
                                    splashRadius: 2,
                                    icon: const Icon(
                                      Icons.remove,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                '1',
                                style: style.bodySmall!.copyWith(
                                  color: AppColors.textColor2,
                                  fontSize: 12,
                                ),
                              ),
                              Transform.scale(
                                alignment: Alignment.centerLeft,
                                scale: 0.5,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                  child: SizedBox(
                                    height: height* 0.05,
                                    width: width * 0.10,
                                    child: IconButton(
                                      onPressed: () {},
                                      style: ButtonStyle(
                                        side: MaterialStateProperty.all(
                                          const BorderSide(
                                              style: BorderStyle.solid,
                                              color: AppColors.primaryColor),
                                        ),
                                        shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                        ),
                                      ),
                                      splashRadius: 2,
                                      icon: const Icon(
                                        Icons.add,
                                        color: AppColors.primaryColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(
                            Icons.more_vert_sharp,
                            color: AppColors.primaryColor,
                          ),
                          const SizedBox(height: 10,),
                          Text(
                            '16\$',
                            style: style.bodyMedium!
                                .copyWith(color: AppColors.textColor1),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
           Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Subtotal:',style: style.bodyLarge!.copyWith(color: AppColors.primaryColor,fontWeight: FontWeight.bold),),
                    Text('74\$',style: style.bodyLarge!.copyWith(color: AppColors.primaryColor,fontWeight: FontWeight.bold),),
                  ],
                ),
                SizedBox(height: height*0.02,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Shipping Charges:',style: style.bodyLarge!.copyWith(color: AppColors.primaryColor,fontWeight: FontWeight.bold),),
                    Text('10\$',style: style.bodyLarge!.copyWith(color: AppColors.primaryColor,fontWeight: FontWeight.bold),),
                  ],
                ),
                SizedBox(height: height*0.03,),
                const Divider(
                  height: 3,
                  color: AppColors.primaryColor,
                ),
                SizedBox(height: height*0.02,),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total:',style: style.titleLarge!.copyWith(color: AppColors.primaryColor,fontWeight: FontWeight.bold),),
                      Text('84\$',style: style.titleLarge!.copyWith(color: AppColors.primaryColor,fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: width * 0.85,
            height: height * 0.06,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const HomeScreen();
                }));
              },
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(2),
                splashFactory: InkRipple.splashFactory,
                shadowColor: const MaterialStatePropertyAll<Color>(AppColors.primaryColor),
                backgroundColor:
                    MaterialStateProperty.all(AppColors.primaryColor),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              child: Text(
                'Place Your Order',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
