// import 'package:flutter/material.dart';
// import 'package:plant_store_app/common/colors.dart';
// class AppDrawer extends StatelessWidget {
//   const AppDrawer({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     var style = Theme.of(context).textTheme;
//     return SafeArea(
//       child: Drawer(
//         backgroundColor: AppColors.primaryColor,
//         elevation: 1,
//         shadowColor: AppColors.imageBackgroundColor,
//         child: Column(
//           children: [
//             CircleAvatar(
//                 backgroundImage: Image.asset(
//                   'assets/images/leaf3.jpeg',
//                   fit: BoxFit.scaleDown,
//                 ).image),
//             Text('Name of Person',style: style.bodyLarge!.copyWith(color: Colors.white,fontWeight: FontWeight.bold),),
//             Text('emailoftheperson@gmail.com',style: style.bodySmall!.copyWith(color: Colors.white,),)
//           ],
//         ),
//       ),
//     );
//   }
// }
