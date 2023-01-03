import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tugas_besar_2072008/color_palette.dart';
import 'package:tugas_besar_2072008/presentation/widgets/upcoming_widget.dart';
import 'package:tugas_besar_2072008/services/movie_services.dart';
import '../widgets/movie_widget.dart';
import 'package:tugas_besar_2072008/entity/user_entity.dart' as user2;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late user2.User userEntity;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference usersCol = firestore.collection("user");

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.white),
            ),
            height: 75,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text("Hi, ",
                        style: TextStyle(color: Colors.white, fontSize: 30)),
                    FutureBuilder(
                      future: usersCol
                          .doc(FirebaseAuth.instance.currentUser?.uid)
                          .get(),
                      builder: ((context, snapshot) {
                        if (snapshot.hasData) {
                          userEntity = user2.User.fromJson(
                              snapshot.data!.data() as Map<String, dynamic>);
                          return Text(
                            userEntity.name.toString(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          );
                        } else {
                          return const Text(
                            "Name",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          );
                        }
                      }),
                    ),
                    // Text(
                    //   "Name",
                    //   style: TextStyle(
                    //       color: Colors.white,
                    //       fontSize: 30,
                    //       fontWeight: FontWeight.bold),
                    // ),
                  ],
                ),
                const Center(
                  child: Icon(
                    Icons.account_circle,
                    color: Colors.white,
                    size: 50,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          const Text(
            "Now Playing",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 300,
            child: FutureBuilder(
              future: MovieServices().getAllMovieData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView(
                    scrollDirection: Axis.horizontal,
                    children: (snapshot.data ?? [])
                        .map((e) => MovieWidget(movie: e))
                        .toList(),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Upcoming",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 300,
            child: FutureBuilder(
              future: MovieServices().getUpcomingMovieData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView(
                    scrollDirection: Axis.horizontal,
                    children: (snapshot.data ?? [])
                        .map((e) => UpcomingWidget(movie: e))
                        .toList(),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
