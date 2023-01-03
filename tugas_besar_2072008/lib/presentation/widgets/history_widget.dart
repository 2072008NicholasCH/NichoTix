import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class HistoryWidget extends StatelessWidget {
  final String idFilm;
  final String judulFilm;
  final String posterFilm;
  final DateTime tanggalFilm;
  final String bioskopFilm;
  final List<String> kursiFilm;
  final String id;
  const HistoryWidget(
      {super.key,
      required this.idFilm,
      required this.judulFilm,
      required this.posterFilm,
      required this.tanggalFilm,
      required this.bioskopFilm,
      required this.kursiFilm,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.goNamed('ticket_detail', params: {'id': id});
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.white)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                            "http://image.tmdb.org/t/p/w500$posterFilm",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(judulFilm,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  maxLines: 3,
                                  overflow: TextOverflow.clip),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "${DateFormat("E, dd-MMM-yyyy HH:mm").format(tanggalFilm)} $bioskopFilm",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
