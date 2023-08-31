import 'package:flutter/material.dart';

import '../../../../Helper/input_decoration.dart';
import '../../../../common/colors.dart';

class LoginForm extends StatelessWidget {
  final double height;
  final double width;
  final TextEditingController email;
  final TextEditingController password;

  final GlobalKey formkey;

  const LoginForm(
      {super.key,
      required this.height,
      required this.width,
      required this.email,
      required this.password,
      required this.formkey});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
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
              "Full Name",
              const Icon(
                Icons.person,
                color: AppColors.primaryColor,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '';
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
                return '';
              } else if (!passwordRegExp.hasMatch(value)) {
                return '';
              }
              return null;
            },
          ),
        ),
      ]),
    );
  }
}
