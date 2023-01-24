import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:movieapp/controller/controller.dart';
import 'package:movieapp/api/api_constants.dart';
import 'package:movieapp/logic/movie_cubit/movie_cubit.dart';
import 'package:movieapp/logic/movie_cubit/movie_state.dart';
import 'package:movieapp/widgets/circular_indicator.dart';
import 'package:movieapp/widgets/header_tile.dart';
import 'package:movieapp/widgets/horizontal_movie_card.dart';
import 'package:movieapp/widgets/search_widget.dart';
import 'package:movieapp/widgets/vertical_movie_card.dart';
import 'package:movieapp/widgets/text1.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MovieController movieController = Get.put(MovieController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MovieController>(builder: (controller) {
        return ListView(
          children: [
            const HeaderTile(),
            const SearchWidget(),
            const Padding(
              padding: EdgeInsets.only(left: 12.0, bottom: 8),
              child: Text1(text: 'Now Showing'),
            ),
            movieController.upcomingMovies.isNotEmpty
                ? CarouselSlider.builder(
                    itemCount: 10,
                    options: CarouselOptions(
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      height: 200,
                      viewportFraction: 0.8,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      enlargeCenterPage: true,
                    ),
                    itemBuilder: (context, index, realIdx) {
                      return BlocBuilder<MovieCubit, MovieState>(
                          builder: (context, state) {
                        if (state is MovieLoadingState) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (state is MovieLoadedState) {
                          return HorizontalMovieCard(
                            imgUrl: ApiConstants.baseImgUrl +
                                state.movies[index].backdropPath.toString(),
                            movieTitle:
                                state.movies[index].originalTitle.toString(),
                            onTap: () {},
                          );
                        }
                        return const Center(
                          child: Text("An error Occured"),
                        );
                      });

                      //  HorizontalMovieCard(
                      //   onTap: () {
                      //     setState(() {
                      //       movieController.getCastList(movieController
                      //           .upcomingMovies[index].id
                      //           .toString());
                      //       movieController.getDetail(movieController
                      //           .upcomingMovies[index].id
                      //           .toString());
                      //       movieController.getSimilar(movieController
                      //           .upcomingMovies[index].id
                      //           .toString());
                      //       Get.toNamed('/deatils');
                      //     });
                      //   },
                      //   imgUrl: ApiConstants.baseImgUrl +
                      //       movieController.upcomingMovies[index].backdropPath
                      //           .toString(),
                      //   movieTitle: movieController
                      //       .upcomingMovies[index].originalTitle
                      //       .toString(),
                      // );
                    },
                  )
                : const CircleIndicator(height: 201, width: double.maxFinite),
            const Padding(
              padding: EdgeInsets.only(left: 12.0, bottom: 8, top: 20),
              child: Text1(text: 'Trending Now'),
            ),
            SizedBox(
              height: 270,
              child: movieController.trendingMovies.isNotEmpty
                  ? ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: movieController.trendingMovies.length,
                      itemBuilder: (context, index) {
                        return VerticalMovieCard(
                          onTap: () {
                            setState(() {
                              movieController.getCastList(movieController
                                  .trendingMovies[index].id
                                  .toString());
                              movieController.getDetail(movieController
                                  .trendingMovies[index].id
                                  .toString());
                              movieController.getSimilar(movieController
                                  .trendingMovies[index].id
                                  .toString());
                              Get.toNamed('/deatils');
                            });
                          },
                          imgUrl: ApiConstants.baseImgUrl +
                              movieController.trendingMovies[index].posterPath
                                  .toString(),
                        );
                      })
                  : const CircleIndicator(),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 12.0, bottom: 8, top: 20),
              child: Text1(text: 'Top Rated Movies'),
            ),
            SizedBox(
              height: 270,
              child: movieController.topratedMovies.isNotEmpty
                  ? ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: movieController.topratedMovies.length,
                      itemBuilder: (context, index) {
                        return VerticalMovieCard(
                          onTap: () {
                            setState(() {
                              movieController.getCastList(movieController
                                  .topratedMovies[index].id
                                  .toString());
                              movieController.getDetail(movieController
                                  .topratedMovies[index].id
                                  .toString());
                              movieController.getSimilar(movieController
                                  .topratedMovies[index].id
                                  .toString());
                              Get.toNamed('/deatils');
                            });
                          },
                          imgUrl: ApiConstants.baseImgUrl +
                              movieController.topratedMovies[index].posterPath
                                  .toString(),
                        );
                      })
                  : const CircleIndicator(),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 12.0, bottom: 8, top: 20),
              child: Text1(text: 'Popular Movies'),
            ),
            SizedBox(
              height: 270,
              child: movieController.popularMovies.isNotEmpty
                  ? ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: movieController.popularMovies.length,
                      itemBuilder: (context, index) {
                        return VerticalMovieCard(
                          onTap: () {
                            setState(() {
                              movieController.getCastList(movieController
                                  .popularMovies[index].id
                                  .toString());
                              movieController.getDetail(movieController
                                  .popularMovies[index].id
                                  .toString());
                              movieController.getSimilar(movieController
                                  .popularMovies[index].id
                                  .toString());
                              Get.toNamed('/deatils');
                            });
                          },
                          imgUrl: ApiConstants.baseImgUrl +
                              movieController.popularMovies[index].posterPath
                                  .toString(),
                        );
                      })
                  : const CircleIndicator(),
            ),
          ],
        );
      }),
    );
  }
}
