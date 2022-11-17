import 'package:flutter/material.dart';
import 'package:netflix_clone_bloc/core/colors/constants.dart';
import 'package:netflix_clone_bloc/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix_clone_bloc/presentation/widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    Key? key,
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
            children: const [
              Text(
                'FEB',
                style: TextStyle(
                  fontSize: 16,
                  color: kGreyColor,
                ),
              ),
              Text(
                '11',
                style: TextStyle(
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
              const VideoWidget(),
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'TALL GIRL 2',
                    style: TextStyle(
                      fontSize: 35,
                      letterSpacing: -5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
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
              const Text(
                'Coming on Friday',
              ),
              const Text(
                'Tall Girl 2',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Landing the lead in the school musical is a dream come true for Jodi, until the pressure sends her confidence - and her relationship - into a tailspin',
                style: TextStyle(
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
