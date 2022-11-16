import 'package:flutter/material.dart';
import 'package:netflix_clone_bloc/core/colors/colors.dart';

class CustomButtonWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const CustomButtonWidget({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kWhiteColor,
          size: 30,
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
