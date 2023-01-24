import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:movieapp/logic/movie_cubit/movie_cubit.dart';
import 'package:movieapp/pages/home_page.dart';
import 'package:movieapp/pages/login_page.dart';
import 'package:movieapp/pages/main_page.dart';
import 'package:movieapp/pages/details_page.dart';
import 'package:movieapp/pages/splash_page.dart';
import 'package:movieapp/themes/themes.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieCubit(),
      child: GetMaterialApp(
        title: 'MoviePedia',
        themeMode: ThemeMode.system,
        theme: MyThemes.lightTheme(context),
        darkTheme: MyThemes.darkTheme(context),
        debugShowCheckedModeBanner: false,
        initialRoute: '/splash',
        getPages: [
          GetPage(name: '/splash', page: () => const SplashPage()),
          GetPage(name: '/login', page: () => const LoginPage()),
          GetPage(name: '/main', page: () => const MainPage()),
          GetPage(name: '/home', page: () => const HomePage()),
          GetPage(name: '/deatils', page: () => const DetailsPage()),
        ],
      ),
    );
  }
}
