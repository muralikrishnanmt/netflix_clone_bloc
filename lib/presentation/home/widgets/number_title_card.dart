import 'package:flutter/material.dart';
import 'package:netflix_clone_bloc/core/constants.dart';
import 'package:netflix_clone_bloc/presentation/home/widgets/number_card.dart';
import 'package:netflix_clone_bloc/presentation/widgets/main_title.dart';

class NumberTitleCard extends StatelessWidget {
  final List<String> postersList;
  const NumberTitleCard({
    Key? key,
    required this.postersList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainTitle(
          title: 'Top 10 TV Shows In India Today',
        ),
        kHeight,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              postersList.length,
              (index) => NumberCard(
                index: index,
                imageUrl: postersList[index],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
