import 'package:flutter/material.dart';
import 'package:netflix_clone_bloc/core/constants.dart';
import 'package:netflix_clone_bloc/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix_clone_bloc/presentation/widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String posterPath;
  final String movieName;
  final String description;
  const ComingSoonWidget({
    Key? key,
    required this.id,
    required this.month,
    required this.day,
    required this.posterPath,
    required this.movieName,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 450,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                month,
                style: const TextStyle(
                  fontSize: 16,
                  color: kGreyColor,
                ),
              ),
              Text(
                day,
                style: const TextStyle(
                  fontSize: 30,
                  letterSpacing: 4,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 450,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(
                url: posterPath,
              ),
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      movieName,
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      style: const TextStyle(
                        fontSize: 18,
                        //letterSpacing: -5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    children: const [
                      CustomButtonWidget(
                        icon: Icons.notifications,
                        title: 'Remind me',
                        iconSize: 20,
                        textSize: 12,
                      ),
                      kWidth,
                      CustomButtonWidget(
                        icon: Icons.info_outline,
                        title: 'Info',
                        iconSize: 20,
                        textSize: 12,
                      ),
                      kWidth,
                    ],
                  ),
                ],
              ),
              kHeight,
              Text(
                'Coming on $day $month',
              ),
              Text(
                movieName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                description,
                maxLines: 4,
                style: const TextStyle(
                  color: kGreyColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
