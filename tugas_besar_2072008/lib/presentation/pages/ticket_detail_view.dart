import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:simple_rich_text/simple_rich_text.dart';
import 'package:tugas_besar_2072008/color_palette.dart';
import 'package:tugas_besar_2072008/entity/ticket_entity.dart';

class TicketDetailView extends StatelessWidget {
  final String? id;
  final CollectionReference ticketsCol =
      FirebaseFirestore.instance.collection("ticket");

  TicketDetailView({super.key, this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.goNamed("home"),
        ),
        centerTitle: true,
        title: const Text("Ticket Detail"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white),
                  ),
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: 120,
                          height: 120,
                          child: Image.asset(
                            'assets/images/qr.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: const Text(
                              "Detail Transaction: ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          FutureBuilder(
                            future: ticketsCol.doc(id).get(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                Ticket tickets = Ticket.fromJson(snapshot.data!
                                    .data() as Map<String, dynamic>);
                                return Text(
                                  DateFormat("E, dd-MMM-yyyy HH:mm")
                                      .format(tickets.pesanTiket!),
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 195, 195, 195),
                                      fontSize: 12),
                                );
                              } else {
                                return const SizedBox();
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            FutureBuilder(
              future: ticketsCol.doc(id).get(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  Ticket tickets = Ticket.fromJson(
                      snapshot.data!.data() as Map<String, dynamic>);
                  return Column(
                    children: [
                      SizedBox(
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              height: 150,
                              width: MediaQuery.of(context).size.width / 4,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.network(
                                  "http://image.tmdb.org/t/p/w500${tickets.poster}",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: Text(
                                      "${tickets.judul}",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      overflow: TextOverflow.clip,
                                      maxLines: 2,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: Text(
                                      "${tickets.tempat}",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                      overflow: TextOverflow.clip,
                                      maxLines: 2,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: SimpleRichText(
                                      "*Date* ${DateFormat("dd-MMM-yyyy").format(tickets.tiket!)} *Time* ${DateFormat("HH:mm").format(tickets.tiket!)}",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                      maxLines: 2,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              child: SimpleRichText(
                                "Transaction Ref. *$id*",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                                maxLines: 2,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              child: SimpleRichText(
                                "Seats *${tickets.kursi}*",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                                maxLines: 2,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              child: SimpleRichText(
                                "Price *${NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0).format(tickets.harga).toString()}*",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                                maxLines: 2,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              child: SimpleRichText(
                                "Admin Fee *${NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0).format(tickets.admin).toString()}*",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                                maxLines: 2,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              child: SimpleRichText(
                                "Total Price *${NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0).format(tickets.total).toString()}*",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                                maxLines: 2,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              child: SimpleRichText(
                                "Payment Method *Tix Credit*",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                                maxLines: 2,
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
            ),
          ],
        ),
      ),
    );
  }
}
