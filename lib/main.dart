import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_store_app/Screens/HomeScreen/UI/home_screen.dart';
import 'package:plant_store_app/common/colors.dart';

import 'Screens/InitialScreens/splash_screen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key,});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        splashFactory: InkRipple.splashFactory,
        splashColor: AppColors.primaryColor,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      ),
      home: const SplashScreen(),
    );
  }
}
