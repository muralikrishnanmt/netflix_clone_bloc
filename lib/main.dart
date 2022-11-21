import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone_bloc/application/downloads/downloads_bloc.dart';
import 'package:netflix_clone_bloc/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:netflix_clone_bloc/application/search/search_bloc.dart';
import 'package:netflix_clone_bloc/core/colors.dart';
import 'package:netflix_clone_bloc/domain/core/di/injectable.dart';
import 'package:netflix_clone_bloc/presentation/main_page/screen_main_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (ctx) => getIt<DownloadsBloc>(),
        ),
        BlocProvider(
          create: (ctx) => getIt<SearchBloc>(),
        ),
        BlocProvider(
          create: (ctx) => getIt<FastLaughBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
          ),
          primarySwatch: Colors.blue,
          backgroundColor: Colors.black,
          scaffoldBackgroundColor: backgroundColor,
          fontFamily: GoogleFonts.montserrat().fontFamily,
          textTheme: const TextTheme(
            bodyText1: TextStyle(
              color: Colors.white,
            ),
            bodyText2: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        home: ScreenMainPage(),
      ),
    );
  }
}


//flutter pub run build_runner watch --delete-conflicting-outputs

// API Key (v3 auth)
// edc84c42a8513dba0dd4cddb9e550c3d

// Example API Request
// https://api.themoviedb.org/3/movie/550?api_key=edc84c42a8513dba0dd4cddb9e550c3d

// API Read Access Token (v4 auth)
// eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlZGM4NGM0MmE4NTEzZGJhMGRkNGNkZGI5ZTU1MGMzZCIsInN1YiI6IjYzNzFlZDU3MDI4NDIwMDA3YTFjYmI1YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.WL9-htyOMVk0E2a0SgZS3IegZlDjZySnOdno8TOvw0Q
