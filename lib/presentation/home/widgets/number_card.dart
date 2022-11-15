import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone_bloc/core/colors/constants.dart';

class NumberCard extends StatelessWidget {
  final int index;
  const NumberCard({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 40,
              height: 150,
            ),
            Container(
              width: 130,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: kRadius10,
                color: Colors.red,
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    'https://www.themoviedb.org/t/p/w220_and_h330_face/1xeiUxShzNn8TNdMqy3Hvo9o2R.jpg',
                  ),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          left: 13,
          bottom: 0,
          child: BorderedText(
            strokeWidth: 10.0,
            child: Text(
              '${index + 1}',
              style: const TextStyle(
                fontSize: 120,
                decoration: TextDecoration.none,
                decorationColor: Colors.red,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
