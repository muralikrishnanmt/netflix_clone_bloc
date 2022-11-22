import 'package:flutter/material.dart';
import 'package:netflix_clone_bloc/core/constants.dart';
import 'package:netflix_clone_bloc/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix_clone_bloc/presentation/widgets/video_widget.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  final String posterPath;
  final String movieName;
  final String description;
  const EveryonesWatchingWidget({
    Key? key,
    required this.posterPath,
    required this.movieName,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight,
        const Text(
          'Friends',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        kHeight,
        const Text(
          'This hit sitcom follows the merry misadventures of six 20-something pals as they navigate the pitfalls of work, life and love in 1990s Manhattan',
          style: TextStyle(
            color: kGreyColor,
          ),
        ),
        kHeight50,
        const VideoWidget(
          url: newAndHotTempImage,
        ),
        kHeight,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            CustomButtonWidget(
              icon: Icons.send,
              title: 'Share',
              iconSize: 25,
              textSize: 16,
            ),
            kWidth,
            CustomButtonWidget(
              icon: Icons.add,
              title: 'My List',
              iconSize: 25,
              textSize: 16,
            ),
            kWidth,
            CustomButtonWidget(
              icon: Icons.play_arrow,
              title: 'Play',
              iconSize: 25,
              textSize: 16,
            ),
            kWidth,
          ],
        ),
      ],
    );
  }
}
