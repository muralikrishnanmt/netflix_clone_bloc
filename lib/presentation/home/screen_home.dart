import 'package:flutter/material.dart';
import 'package:netflix_clone_bloc/presentation/home/widgets/number_title_card.dart';
import 'package:netflix_clone_bloc/presentation/widgets/main_title_card.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: const [
              MainTitleCard(
                title: 'Released in the past year',
              ),
              MainTitleCard(
                title: 'Trending Now',
              ),
              NumberTitleCard(),
              MainTitleCard(
                title: 'Tense Dramas',
              ),
              MainTitleCard(
                title: 'South Indian Cinema',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
