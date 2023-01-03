import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tugas_besar_2072008/bloc/movie_bloc.dart';
import 'package:tugas_besar_2072008/color_palette.dart';
import 'package:tugas_besar_2072008/entity/movie_entity.dart';
import 'package:tugas_besar_2072008/services/movie_services.dart';

class MovieDetail extends StatelessWidget {
  const MovieDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.goNamed("home"),
        ),
        centerTitle: true,
        title: const Text("Movie Detail"),
      ),
      backgroundColor: backgroundColor,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height - 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BlocBuilder<MovieBloc, MovieState>(
                    builder: (context, state) {
                      return FutureBuilder(
                        future: MovieServices().getDetailMovie(state.when(
                            initial: () => '0', running: (id) => '$id')),
                        builder: (BuildContext context,
                            AsyncSnapshot<Movie?> snapshot) {
                          if (snapshot.hasData) {
                            return Column(
                              children: [
                                Image.network(
                                    "http://image.tmdb.org/t/p/w500${snapshot.data?.backdrop_path}"),
                                Container(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${snapshot.data?.title}",
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(
                                          fontSize: 30,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          const IconTheme(
                                              data: IconThemeData(
                                                  color: Colors.yellow),
                                              child: Icon(Icons.star_rounded)),
                                          Text(
                                            "${snapshot.data?.vote_average.toStringAsFixed(1)}",
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        snapshot.data?.genres
                                                .map((e) => e.name)
                                                .toList()
                                                .join(', ') ??
                                            '',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      const Text(
                                        "Overview\n",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "${snapshot.data?.overview}",
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return const SizedBox();
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(secondaryColor)),
                onPressed: () {
                  context.goNamed('buy_ticket');
                },
                child: const Text(
                  "Buy Ticket",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
