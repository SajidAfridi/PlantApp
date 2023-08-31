import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_store_app/Screens/Auth/Login/LoginUI/login_screen.dart';
import 'package:plant_store_app/Screens/Auth/Register/UI/register_screen.dart';
import 'package:plant_store_app/Screens/HomeScreen/UI/home_screen.dart';
import 'package:plant_store_app/Screens/InitialScreens/auth_class_bloc.dart';
import 'package:plant_store_app/common/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AuthClassBloc authClassBloc = AuthClassBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authClassBloc.add(AuthCheckingInitial());
  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocConsumer<AuthClassBloc , AuthClassState>(
      listener: (context, state){
        if (state is AuthNavigateHomeScreenState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomeScreen()));
        } else if (state is AuthNavigateLoginScreenState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LoginScreen()));
        } else if (state is AuthNavigateRegisterationScreenState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const RegisterScreen()));
        }
      },
      bloc:authClassBloc,
  builder: (context, state) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            color: Colors.transparent,
            height: height * 1,
            width: width * 1,
            child: const Image(
              image: AssetImage('assets/images/leaf3.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 100,
              bottom: 50,
              left: 10,
              right: 10,
              child: Text('The best app for your plants',style: Theme.of(context).textTheme.displayMedium!.copyWith(color: Colors.white,fontWeight: FontWeight.bold),),),
          Positioned(
            top: 500,
            bottom: 50,
            left: 20,
            right: 20,
            child: Column(
              children: [
                SizedBox(
                  width: width * 1,
                  height: height * 0.07,
                  child: ElevatedButton(
                    onPressed: () {
                      authClassBloc.add(SignUpClickedEvent());
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    child: Text(
                      'Sign Up',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: AppColors.primaryColor),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                SizedBox(
                  width: width * 0.9,
                  height: height * 0.07,
                  child: ElevatedButton(
                    onPressed: () {
                      authClassBloc.add(SignInClickedEvent());
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(AppColors.primaryColor),
                    ),
                    child: Text(
                      'Sign In',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  },
);
  }
}
