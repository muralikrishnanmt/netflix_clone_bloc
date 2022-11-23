import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone_bloc/application/home/home_bloc.dart';
import 'package:netflix_clone_bloc/core/constants.dart';
import 'package:netflix_clone_bloc/presentation/home/widgets/background_card.dart';
import 'package:netflix_clone_bloc/presentation/home/widgets/number_title_card.dart';
import 'package:netflix_clone_bloc/presentation/widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        BlocProvider.of<HomeBloc>(context).add(const GetHomeScreenData());
      },
    );
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: scrollNotifier,
        builder: (context, index, _) {
          return NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              final ScrollDirection direction = notification.direction;
              print(direction);
              if (direction == ScrollDirection.reverse) {
                scrollNotifier.value = false;
              } else if (direction == ScrollDirection.forward) {
                scrollNotifier.value = true;
              }
              return true;
            },
            child: Stack(
              children: [
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      );
                    }
                    if (state.hasError) {
                      return const Center(
                        child: Text(
                          'Error while getting data',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      );
                    }

                    //released past year
                    final _releasedPastYear = state.pastYearMovieList.map(
                      (m) {
                        return '$imageAppendUrl${m.posterPath}';
                      },
                    ).toList();
                    _releasedPastYear.shuffle();

                    //trending
                    final _trending = state.trendingMovieList.map(
                      (m) {
                        return '$imageAppendUrl${m.posterPath}';
                      },
                    ).toList();
                    _trending.shuffle();

                    //tense dramas
                    final _tenseDramas = state.tenseDramasMovieList.map(
                      (m) {
                        return '$imageAppendUrl${m.posterPath}';
                      },
                    ).toList();
                    _tenseDramas.shuffle();

                    //south indian movies
                    final _southIndianMovies = state.southIndianMovieList.map(
                      (m) {
                        return '$imageAppendUrl${m.posterPath}';
                      },
                    ).toList();
                    _southIndianMovies.shuffle();

                    //top 10 tv shows
                    final _top10TvShow = state.trendingTvList.map(
                      (t) {
                        return '$imageAppendUrl${t.posterPath}';
                      },
                    ).toList();
                    _top10TvShow.shuffle();

                    print(state.trendingMovieList.length);

                    //ListView
                    return ListView(
                      children: [
                        const BackgroundCard(),
                        MainTitleCard(
                          title: 'Released in the past year',
                          posterList: _releasedPastYear,
                        ),
                        kHeight,
                        MainTitleCard(
                          title: 'Trending Now',
                          posterList: _trending,
                        ),
                        kHeight,
                        NumberTitleCard(
                          postersList: _top10TvShow,
                        ),
                        kHeight,
                        MainTitleCard(
                          title: 'Tense Dramas',
                          posterList: _tenseDramas,
                        ),
                        kHeight,
                        MainTitleCard(
                          title: 'South Indian Cinema',
                          posterList: _southIndianMovies,
                        ),
                      ],
                    );
                  },
                ),
                scrollNotifier.value == true
                    ? AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        width: double.infinity,
                        height: 90,
                        color: Colors.black.withOpacity(0.3),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.network(
                                  'https://cdn.vox-cdn.com/thumbor/SEEvZdiXcs0CS-YbPj2gm6AJ8qc=/0x0:3151x2048/1400x1400/filters:focal(1575x1024:1576x1025)/cdn.vox-cdn.com/uploads/chorus_asset/file/15844974/netflixlogo.0.0.1466448626.png',
                                  width: 60,
                                  height: 60,
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
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'TV Shows',
                                  style: kHomeTitleText,
                                ),
                                Text(
                                  'Movies',
                                  style: kHomeTitleText,
                                ),
                                Text(
                                  'Categories',
                                  style: kHomeTitleText,
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    : kHeight
              ],
            ),
          );
        },
      ),
    );
  }
}
