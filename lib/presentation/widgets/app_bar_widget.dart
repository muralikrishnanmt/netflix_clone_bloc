import 'package:flutter/material.dart';
import 'package:netflix_clone_bloc/core/colors/constants.dart';

class AppBarWidget extends StatelessWidget {
  final String title;
  const AppBarWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kWidth,
        Text(
          title,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w900,
          ),
        ),
        const Spacer(),
        const Icon(
          Icons.cast,
          color: Colors.white,
          size: 30,
        ),
        kWidth,
        Container(
          width: 30,
          height: 30,
          color: Colors.blue,
        ),
        kWidth,
      ],
    );
  }
}
