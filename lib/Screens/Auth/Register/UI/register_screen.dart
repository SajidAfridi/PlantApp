import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_store_app/Helper/auth_helper/common_text.dart';
import 'package:plant_store_app/Helper/input_decoration.dart';
import 'package:plant_store_app/Screens/Auth/Login/LoginUI/login_screen.dart';
import 'package:plant_store_app/Screens/Auth/Register/register_bloc.dart';
import 'package:plant_store_app/common/colors.dart';
import 'package:plant_store_app/models/sqflite_helper.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _key = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  PlantHelper plantHelper = PlantHelper();
  RegisterBloc registerBloc = RegisterBloc();

  @override
  void initState() {
    super.initState();
    plantHelper.initializeDatabase();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocConsumer<RegisterBloc, RegisterState>(
      bloc: registerBloc,
      listenWhen: (previous, current) => current is RegisterActionState,
      buildWhen: (previous, current) => current is! RegisterActionState,
      listener: (context, state) {
        if (state is NavigateToLoginScreenActionState) {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const LoginScreen();
          }));
        } else if (state is SuccessRegisterActionState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Successfully Registered'),
            ),
          );
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const LoginScreen();
              },
            ),
          );
        } else if (state is FailedToRegisterState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Registration Failed'),
            ),
          );
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  IconButton(
                    style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll(
                          AppColors.imageBackgroundColor),
                      elevation: MaterialStateProperty.all(1),
                      shape: MaterialStateProperty.all(
                        const CircleBorder(),
                      ),
                    ),
                    onPressed: () {},
                    icon: const Icon(
                      Icons.navigate_before_outlined,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.1,
                  ),
                  const AuthScreenText(
                    titleText: 'Register',
                    subtitleText: 'Create your new account',
                  ),
                  RegisterForm(
                    name: nameController,
                    password: passwordController,
                    formkey: _key,
                    height: height,
                    width: width,
                    email: emailController,
                    confirmPassword: confirmPasswordController,
                  ),
                  SizedBox(
                    height: height * 0.06,
                  ),
                  Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'By signing you agree to our',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: ' Team of use',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          TextSpan(
                            text: ' and ',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: 'privacy notice',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.8,
                    height: height * 0.07,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_key.currentState!.validate()) {
                          registerBloc.add(
                            SubmitFormEvent(
                                email: emailController.text,
                                password: passwordController.text),
                          );
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(AppColors.primaryColor),
                      ),
                      child: Text(
                        'Sign Up',
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
                          text: 'Already have an account?',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        TextSpan(
                          text: '  signIn',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Colors.blue,
                                  ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return const LoginScreen();
                                }),
                              );
                            },
                        ),
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

class RegisterForm extends StatelessWidget {
  final double height;
  final double width;
  final TextEditingController name;
  final TextEditingController email;
  final TextEditingController password;
  final TextEditingController confirmPassword;

  final GlobalKey formkey;

  const RegisterForm(
      {super.key,
      required this.height,
      required this.width,
      required this.name,
      required this.password,
      required this.formkey,
      required this.email,
      required this.confirmPassword});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: SingleChildScrollView(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          SizedBox(
            width: 290,
            height: 70,
            child: TextFormField(
              controller: name,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Colors.black,
              ),
              decoration: inputDecoration(
                "Full Name",
                const Icon(
                  Icons.person,
                  color: AppColors.primaryColor,
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an full name';
                } else {
                  return null;
                }
              },
            ),
          ),
          SizedBox(
            width: 290,
            height: 70,
            child: TextFormField(
              controller: email,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Colors.black,
              ),
              decoration: inputDecoration(
                "Email",
                const Icon(
                  Icons.email,
                  color: AppColors.primaryColor,
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an email address';
                } else {
                  return null;
                }
              },
            ),
          ),
          SizedBox(
            width: 290,
            height: 70,
            child: TextFormField(
              obscureText: true,
              controller: password,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Colors.black,
              ),
              decoration: inputDecoration(
                  "Password",
                  const Icon(
                    Icons.lock,
                    color: AppColors.primaryColor,
                  )),
              validator: (value) {
                final RegExp passwordRegExp =
                    RegExp(r'^(?=.*[A-Za-z\d])[A-Za-z\d]{6,}$');
                if (value == null || value.isEmpty) {
                  return 'Please enter a password';
                } else if (!passwordRegExp.hasMatch(value)) {
                  return 'Password must be at least 6 characters long';
                }
                return null;
              },
            ),
          ),
          SizedBox(
            width: 290,
            height: 70,
            child: TextFormField(
              obscureText: true,
              controller: confirmPassword,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Colors.black,
              ),
              decoration: inputDecoration(
                  "Confirm Password",
                  const Icon(
                    Icons.lock,
                    color: AppColors.primaryColor,
                  )),
              validator: (value) {
                final RegExp passwordRegExp =
                    RegExp(r'^(?=.*[A-Za-z\d])[A-Za-z\d]{6,}$');
                if (value == null || value.isEmpty) {
                  return 'Please enter a password';
                } else if (!passwordRegExp.hasMatch(value)) {
                  return 'Password must be at least 6 characters long';
                }
                return null;
              },
            ),
          ),
        ]),
      ),
    );
  }
}
