import 'package:flutter/material.dart';
import 'package:netflix_clone_bloc/presentation/downloads/screen_downloads.dart';
import 'package:netflix_clone_bloc/presentation/fast_laugh/screen_fast_laugh.dart';
import 'package:netflix_clone_bloc/presentation/home/screen_home.dart';
import 'package:netflix_clone_bloc/presentation/main_page/widgets/bottom_nav.dart';
import 'package:netflix_clone_bloc/presentation/new_and_hot/screen_new_and_hot.dart';
import 'package:netflix_clone_bloc/presentation/search/screen_search.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({super.key});

  final _pages = [
    const ScreenHome(),
    const ScreenNewAndHot(),
    const ScreenFastLaugh(),
    const ScreenSearch(),
    ScreenDownloads(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: indexChangeNotifier,
          builder: (context, int index, child) {
            return _pages[index];
          },
        ),
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
