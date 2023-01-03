import 'dart:ffi';

class Ticket {
  String? idUser;
  DateTime? tiket;
  DateTime? pesanTiket;
  List<String>? kursi;
  String? tempat;
  String? kodeTiket;
  String? idFilm;
  String? poster;
  String? judul;
  String? idTiket;
  int? harga;
  int? admin;
  int? total;

  Ticket({
    this.idUser,
    this.idFilm,
    this.kodeTiket,
    this.kursi,
    this.pesanTiket,
    this.tempat,
    this.tiket,
    this.judul,
    this.poster,
    this.idTiket,
    this.admin,
    this.harga,
    this.total,
  });

  factory Ticket.fromJson(Map<String, dynamic> json) => Ticket(
        idUser: json['id_user'],
        idFilm: json['id_film'],
        kodeTiket: json['kode_tiket'],
        kursi: [...json['kursi']],
        pesanTiket: (json['pesan_tiket']).toDate(),
        tiket: (json['tiket']).toDate(),
        tempat: json['tempat'],
        judul: json['judul'],
        poster: json['poster'],
        idTiket: json['id'],
        admin: json['admin'],
        harga: json['harga'],
        total: json['total'],
      );
}
