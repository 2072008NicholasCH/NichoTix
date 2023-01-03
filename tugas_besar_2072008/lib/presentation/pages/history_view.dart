import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tugas_besar_2072008/color_palette.dart';
import 'package:tugas_besar_2072008/entity/user_entity.dart' as user2;
import 'package:tugas_besar_2072008/entity/ticket_entity.dart' as ticket2;
import 'package:tugas_besar_2072008/presentation/widgets/history_widget.dart';

import '../../entity/ticket_entity.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({super.key});

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  late user2.User userEntity;
  late ticket2.Ticket ticketEntity;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference usersCol = firestore.collection("user");
  late CollectionReference ticketsCol = firestore.collection("ticket");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text("History"),
      ),
      backgroundColor: backgroundColor,
      body: ListView(
        children: [
          FutureBuilder<QuerySnapshot>(
            future: ticketsCol
                .where("id_user",
                    isEqualTo: FirebaseAuth.instance.currentUser?.uid)
                .orderBy("pesan_tiket", descending: true)
                .get(),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.docs.isNotEmpty) {
                  return Column(
                      children: snapshot.data!.docs.map((e) {
                    ticketEntity =
                        Ticket.fromJson(e.data() as Map<String, dynamic>);
                    ticketEntity.idTiket = e.id;
                    return HistoryWidget(
                      idFilm: ticketEntity.idFilm!,
                      judulFilm: ticketEntity.judul!,
                      posterFilm: ticketEntity.poster!,
                      tanggalFilm: ticketEntity.tiket!,
                      bioskopFilm: ticketEntity.tempat!,
                      kursiFilm: ticketEntity.kursi!,
                      id: ticketEntity.idTiket!,
                    );
                  }).toList());
                } else {
                  return const Padding(
                    padding: EdgeInsets.all(20),
                    child: SizedBox(
                      child: Text(
                        "You don't Have any History!",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                }
              } else {
                return const SizedBox();
              }
            }),
          ),
        ],
      ),
    );
  }
}
