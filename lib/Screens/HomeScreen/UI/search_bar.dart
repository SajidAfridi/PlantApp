import 'package:flutter/material.dart';

import '../../../common/colors.dart';
class searchBar extends StatelessWidget {
  const searchBar({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: height * 0.07,
        width: width * 0.9,
        child: SearchBar(
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(
                vertical: 8.0, horizontal: 15.0),
          ),
          shape: const MaterialStatePropertyAll(
            RoundedRectangleBorder(),
          ),
          trailing: <IconButton>[
            IconButton(
              icon: const Icon(
                Icons.mic,
                color: AppColors.primaryColor,
              ),
              onPressed: () {},
            ),
          ],
          backgroundColor: const MaterialStatePropertyAll(
              AppColors.imageBackgroundColor),
          leading: const Icon(
            Icons.search,
            color: AppColors.primaryColor,
          ),
          hintText: 'Search Plant',
          hintStyle: MaterialStatePropertyAll(
            Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: AppColors.primaryColor),
          ),
        ),
      ),
    );
  }
}
