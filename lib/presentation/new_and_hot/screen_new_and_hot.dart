import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:netflix_clone_bloc/application/hot_and_new/hot_and_new_bloc.dart';
import 'package:netflix_clone_bloc/core/colors.dart';
import 'package:netflix_clone_bloc/core/constants.dart';
import 'package:netflix_clone_bloc/presentation/new_and_hot/widgets/coming_soon_widget.dart';

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
            const ComingsoonList(
              key: Key('coming_soon'),
            ),
            _buildEveryonesWatching(),
          ],
        ),
      ),
    );
  }
}

class ComingsoonList extends StatelessWidget {
  const ComingsoonList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        BlocProvider.of<HotAndNewBloc>(context)
            .add(const LoadDataInComingSoon());
      },
    );
    return BlocBuilder<HotAndNewBloc, HotAndNewState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          );
        } else if (state.hasError) {
          return const Center(
            child: Text(
              'Error While Loading Coming Soon List',
            ),
          );
        } else if (state.comingSoonList.isEmpty) {
          return const Center(
            child: Text(
              'Coming Soon List is Empty',
            ),
          );
        } else {
          return ListView.builder(
            itemCount: state.comingSoonList.length,
            itemBuilder: (context, index) {
              final movie = state.comingSoonList[index];
              if (movie.id == null) {
                return const SizedBox();
              }
              //print(movie.releaseDate);
              String month = '';
              String date = '';
              try {
                final _date = DateTime.tryParse(movie.releaseDate!);
                final formattedDate = DateFormat.yMMMMd('en_US').format(_date!);
                month = formattedDate
                    .split(' ')
                    .first
                    .substring(0, 3)
                    .toUpperCase();
                date = movie.releaseDate!.split('-')[1];
              } catch (_) {
                month = '';
                date = '';
              }
              return ComingSoonWidget(
                id: movie.id.toString(),
                month: month,
                day: date,
                posterPath: '$imageAppendUrl${movie.posterPath}',
                movieName: movie.originalTitle ?? 'No Title',
                description: movie.overview ?? 'No Description',
              );
            },
          );
        }
      },
    );
  }
}

// Widget _buildComingSoon() {
//   return ListView.builder(
//     itemCount: 10,
//     itemBuilder: (context, index) {
//       return ComingSoonWidget();
//     },
//   );
// }

Widget _buildEveryonesWatching() {
  return ListView.builder(
    itemCount: 10,
    itemBuilder: (context, index) {
      //return EveryonesWatchingWidget();
      return const SizedBox();
    },
  );
}
