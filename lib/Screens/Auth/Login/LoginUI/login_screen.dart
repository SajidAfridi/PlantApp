import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_store_app/Helper/auth_helper/common_text.dart';
import 'package:plant_store_app/Screens/Auth/ForgetPassword/forget_password.dart';
import 'package:plant_store_app/Screens/Auth/Login/login_bloc.dart';
import 'package:plant_store_app/Screens/Auth/Register/UI/register_screen.dart';
import 'package:plant_store_app/Screens/HomeScreen/UI/home_screen.dart';
import 'package:plant_store_app/common/colors.dart';

import '../../../../models/remember_me_cubit.dart';
import 'image_clipper.dart';
import 'login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final LoginBloc loginBloc = LoginBloc();
  final RememberMeCubit rememberMeCubit = RememberMeCubit();

  @override
  void initState() {
    super.initState();
    loginBloc.add(InitialLogin());
    passwordController = TextEditingController();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    rememberMeCubit.close();
    loginBloc.isClosed;
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocConsumer<LoginBloc, LoginState>(
      bloc: loginBloc,
      listenWhen: (previous, current) => current is LoginActionState,
      buildWhen: (previous, current) => current is! LoginActionState,
      listener: (context, state) {
        if (state is LoginSubmissionState) {
          const CircularProgressIndicator();
        } else if (state is LoginFailedState) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Login Failed, Please try again')));
        } else if (state is NavigateToForgotPasswordActionState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const ForgetPassword();
              },
            ),
          );
        } else if (state is LoginSuccessState) {
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context){
            return const HomeScreen();
          }), (r){
            return false;
          });
        } else if (state is LoginInitialStateSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Database Initialized Successfully'),
            ),
          );
        } else if (state is NavigateToRegisterationScreenActionState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const RegisterScreen()));
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipPath(
                    clipper: ImageClipper(),
                    child: Container(
                      height: height * 0.33,
                      width: width * 1,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40),
                        ),
                      ),
                      child: Image(
                          image: Image.asset('assets/images/leaf3.jpeg').image,
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  const AuthScreenText(
                      titleText: 'Welcome back',
                      subtitleText: 'Login to your account'),
                  LoginForm(
                    height: height,
                    width: width,
                    email: emailController,
                    password: passwordController,
                    formkey: formKey,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          child: BlocBuilder<RememberMeCubit, bool>(
                            bloc: rememberMeCubit,
                            builder: (context, isChecked) {
                              return Row(
                                  //mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      height: height * 0.01,
                                      width: width * 0.1,
                                      child: Checkbox(
                                        checkColor: Colors.white,
                                        value: isChecked,
                                        splashRadius: 3,
                                        fillColor: MaterialStateProperty.all(
                                            AppColors.primaryColor),
                                        onChanged: (value) => rememberMeCubit
                                            .toggleRememberMe(value!),
                                        shape: const CircleBorder(),
                                      ),
                                    ),
                                    const Text(
                                      'Remember me',
                                      style: TextStyle(
                                        color: AppColors.primaryColor,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w200,
                                      ),
                                    ),
                                  ]);
                            },
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            loginBloc.add(ForgetPasswordClicked());
                          },
                          child: Text(
                            'Forget Password',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.12,
                  ),
                  SizedBox(
                    width: width * 0.8,
                    height: height * 0.07,
                    child: ElevatedButton(
                      onPressed: () {
                        print('outside validation statement');
                        if (formKey.currentState!.validate()) {
                          print('inside validation statement');
                          loginBloc.add(
                            SubmitForm(
                              email: emailController.text,
                              password: passwordController.text,
                            ),
                          );
                        } else {
                          return;
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(AppColors.primaryColor),
                      ),
                      child: Text(
                        'Login',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Don\'t have an account',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        TextSpan(
                            text: '  signUp',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Colors.blue,
                                ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                loginBloc.add(SignUpClicked());
                              }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}