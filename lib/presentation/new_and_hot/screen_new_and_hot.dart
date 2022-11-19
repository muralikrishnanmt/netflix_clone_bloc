import 'package:flutter/material.dart';
import 'package:netflix_clone_bloc/core/colors.dart';
import 'package:netflix_clone_bloc/core/constants.dart';
import 'package:netflix_clone_bloc/presentation/new_and_hot/widgets/coming_soon_widget.dart';
import 'package:netflix_clone_bloc/presentation/new_and_hot/widgets/everyones_watching_widgets.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: AppBar(
            title: const Text(
              'New & Hot',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
            actions: [
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
            bottom: TabBar(
              isScrollable: true,
              labelColor: kBlackColor,
              unselectedLabelColor: kWhiteColor,
              labelStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              indicator: BoxDecoration(
                color: kWhiteColor,
                borderRadius: kRadius30,
              ),
              tabs: const [
                Tab(
                  text: '🍿 Coming Soon',
                ),
                Tab(
                  text: '👀 Everyone\'s Watching',
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            _buildComingSoon(),
            _buildEveryonesWatching(),
          ],
        ),
      ),
    );
  }
}

Widget _buildComingSoon() {
  return ListView.builder(
    itemCount: 10,
    itemBuilder: (context, index) {
      return const ComingSoonWidget();
    },
  );
}

Widget _buildEveryonesWatching() {
  return ListView.builder(
    itemCount: 10,
    itemBuilder: (context, index) {
      return const EveryonesWatchingWidget();
    },
  );
}
