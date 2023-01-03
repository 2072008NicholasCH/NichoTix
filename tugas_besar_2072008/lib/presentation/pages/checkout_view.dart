import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:tugas_besar_2072008/bloc/movie_bloc.dart';
import 'package:tugas_besar_2072008/bloc/ticket_bloc.dart';
import 'package:tugas_besar_2072008/color_palette.dart';
import 'package:tugas_besar_2072008/entity/movie_entity.dart';
import 'package:tugas_besar_2072008/services/movie_services.dart';
import 'package:tugas_besar_2072008/entity/user_entity.dart' as user2;

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  int _jumlah = 0;
  final int _fee = 2500;
  late user2.User userEntity;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference usersCol = firestore.collection("user");
  String idUser = "";
  DateTime tiketBeli = DateTime.now();
  DateTime pesanTiket = DateTime.now();
  List<String> kursiNonton = [];
  String tempatNonton = "";
  String kodeTiket = "";
  String idFilm = "";
  String poster = "";
  String judul = "";

  late CollectionReference tickets = firestore.collection("ticket");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text("Checkout"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white),
                  ),
                  height: 200,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: SizedBox(
                          child: BlocBuilder<MovieBloc, MovieState>(
                            builder: (context, state) {
                              return FutureBuilder(
                                future: MovieServices().getDetailMovie(
                                    state.when(
                                        initial: () => '0',
                                        running: (id) => '$id')),
                                builder: (BuildContext context,
                                    AsyncSnapshot<Movie?> snapshot) {
                                  if (snapshot.hasData) {
                                    idFilm = (snapshot.data?.id).toString();
                                    usersCol
                                        .doc(FirebaseAuth
                                            .instance.currentUser?.uid)
                                        .get();
                                    idUser =
                                        (FirebaseAuth.instance.currentUser?.uid)
                                            .toString();
                                    kodeTiket = ("1234");
                                    poster =
                                        (snapshot.data?.poster_path).toString();
                                    judul = (snapshot.data?.title).toString();
                                    // pesanTiket = DateTime.now();

                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            child: Image.network(
                                              "http://image.tmdb.org/t/p/w500/${snapshot.data?.poster_path}",
                                              fit: BoxFit.cover,
                                              height: 180,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        Column(
                                          children: [
                                            const Padding(
                                                padding: EdgeInsets.all(10)),
                                            Container(
                                              alignment: Alignment.topLeft,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2,
                                              child: Text(
                                                "${snapshot.data?.title}",
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 23,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            BlocBuilder<TicketBloc,
                                                TicketState>(
                                              builder: ((context, state) {
                                                return Container(
                                                  alignment: Alignment.topLeft,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2,
                                                  child: Text(
                                                    state.when(
                                                        initial: () => '',
                                                        running: (DateTime
                                                                    waktu,
                                                                String tempat,
                                                                List<String>
                                                                    kursi) =>
                                                            tempatNonton =
                                                                tempat),
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                );
                                              }),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            BlocBuilder<TicketBloc,
                                                TicketState>(
                                              builder: ((context, state) {
                                                return Container(
                                                  alignment: Alignment.topLeft,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2,
                                                  child: Text(
                                                    state.when(
                                                        initial: () => '',
                                                        running: (DateTime
                                                                    waktu,
                                                                String tempat,
                                                                List<String>
                                                                    kursi) =>
                                                            DateFormat(
                                                                    "EEE, dd-MMM-yyyy HH:mm")
                                                                .format(
                                                                    tiketBeli =
                                                                        waktu)),
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                );
                                              }),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            BlocBuilder<TicketBloc,
                                                TicketState>(
                                              builder: ((context, state) {
                                                return Container(
                                                  alignment: Alignment.topLeft,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2,
                                                  child: Text(
                                                    state.when(
                                                        initial: () => '',
                                                        running:
                                                            (DateTime waktu,
                                                                String tempat,
                                                                List<String>
                                                                    kursi) {
                                                          kursiNonton = kursi;
                                                          return kursi
                                                              .toString();
                                                        }),
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                );
                                              }),
                                            ),
                                          ],
                                        )
                                      ],
                                    );
                                  } else {
                                    return const SizedBox();
                                  }
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: [
                      const Text(
                        "Ticket Price Rp 35.000 X ",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      BlocBuilder<TicketBloc, TicketState>(
                        builder: ((context, state) {
                          return Text(
                            state.when(
                                initial: () => '',
                                running: (DateTime waktu, String tempat,
                                        List<String> kursi) =>
                                    kursi.length.toString()),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          );
                        }),
                      ),
                      BlocBuilder<TicketBloc, TicketState>(
                        builder: ((context, state) {
                          return Text(
                            " = ${state.when(initial: () => '', running: (DateTime waktu, String tempat, List<String> kursi) => NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0).format(kursi.length * 35000))}",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "Platform Fee ${NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0).format(_fee).toString()}",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.all(10),
                  child: BlocBuilder<TicketBloc, TicketState>(
                    builder: ((context, state) {
                      return Text(
                        " Total ${state.when(initial: () => '', running: (DateTime waktu, String tempat, List<String> kursi) => NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0).format(_jumlah = (kursi.length * 35000) + _fee))}",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      );
                    }),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(secondaryColor)),
                onPressed: () {
                  usersCol
                      .doc(FirebaseAuth.instance.currentUser?.uid)
                      .get()
                      .then((value) {
                    final data = value.data() as Map<String, dynamic>;

                    if (data['balance'] < _jumlah) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        backgroundColor: secondaryColor,
                        content: Text(
                            "Saldo Tix Credit Anda Tidak Mencukupi, Silahkan Lakukan TopUp Terlebih Dahulu!"),
                      ));
                    } else {
                      tickets.add({
                        "id_user": idUser,
                        "tiket": tiketBeli,
                        "pesan_tiket": pesanTiket,
                        "kursi": kursiNonton,
                        "tempat": tempatNonton,
                        "kode_tiket": kodeTiket,
                        "id_film": idFilm,
                        "poster": poster,
                        "judul": judul,
                        "admin": _fee,
                        "total": _jumlah,
                        "harga": (_jumlah - _fee),
                      });
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        backgroundColor: secondaryColor,
                        content: Text("Successfull Ticket Purchase!"),
                      ));

                      usersCol
                          .doc(FirebaseAuth.instance.currentUser?.uid)
                          .update({
                        'balance': data['balance'] - _jumlah,
                      });
                    }
                  }).then((value) => context.goNamed('home'));
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
