import 'package:flutter/material.dart';
import 'package:netflix_clone_bloc/core/constants.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      width: 130,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: kRadius10,
        color: Colors.red,
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            'https://upload.wikimedia.org/wikipedia/en/1/19/The_Warrior%27s_Way_Poster.jpg',
          ),
        ),
      ),
    );
  }
}
