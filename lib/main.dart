import 'package:flutter/material.dart';
import 'package:netflix_clone_bloc/core/colors/colors.dart';
import 'package:netflix_clone_bloc/presentation/main_page/screen_main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.black,
        scaffoldBackgroundColor: backgroundColor,
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
    );
  }
}




// API Key (v3 auth)
// edc84c42a8513dba0dd4cddb9e550c3d

// Example API Request
// https://api.themoviedb.org/3/movie/550?api_key=edc84c42a8513dba0dd4cddb9e550c3d

// API Read Access Token (v4 auth)
// eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlZGM4NGM0MmE4NTEzZGJhMGRkNGNkZGI5ZTU1MGMzZCIsInN1YiI6IjYzNzFlZDU3MDI4NDIwMDA3YTFjYmI1YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.WL9-htyOMVk0E2a0SgZS3IegZlDjZySnOdno8TOvw0Q
