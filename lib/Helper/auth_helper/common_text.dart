import 'package:flutter/material.dart';

class AuthScreenText extends StatelessWidget {
  final String titleText;
  final String subtitleText;
  const AuthScreenText(
      {super.key, required this.titleText, required this.subtitleText});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height * 0.12,
      child: Padding(
        padding: const EdgeInsets.only(left: 70),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  titleText,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  subtitleText,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: width * 0.15,
                  height: height * 0.1,
                  child: Image(
                      image: Image.asset(
                    'assets/images/leaf.png',
                    fit: BoxFit.cover,
                  ).image),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
