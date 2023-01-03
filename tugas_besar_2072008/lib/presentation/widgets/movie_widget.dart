import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tugas_besar_2072008/bloc/movie_bloc.dart';
import '../../entity/movie_entity.dart';

class MovieWidget extends StatelessWidget {
  final Movie movie;

  const MovieWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<MovieBloc>().add(MovieEvent.started(movie.id));
        context.goNamed('movie_detail');
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            height: 200,
            width: MediaQuery.of(context).size.width / 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                "http://image.tmdb.org/t/p/w500/${movie.poster_path}",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width / 3,
            child: Text(
              movie.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 16,
                  // fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
