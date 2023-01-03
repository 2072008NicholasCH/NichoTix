import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:tugas_besar_2072008/bloc/ticket_bloc.dart';
import 'package:tugas_besar_2072008/color_palette.dart';

class PickDate extends StatefulWidget {
  const PickDate({super.key});

  @override
  State<PickDate> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<PickDate> {
  late List<DateTime> tanggal = List.generate(
    7,
    (index) => (index == 0)
        ? DateTime.now()
        : DateTime.now().add(
            Duration(days: index),
          ),
  );

  final formatter = DateFormat('E');
  final formatTime = DateFormat('Hm');
  final formatDate = DateFormat('dMy');

  late DateTime now = DateTime.now();

  late List<DateTime> timeSlots = List.generate(
      7,
      (index) => (index == 0)
          ? DateTime(now.day, now.month, now.year, 10, 0, 0)
          : DateTime(now.day, now.month, now.year, 10 + (index * 2), 0, 0));

  String _pickedDate = "";
  String _pickedTime = "";
  String _pickedPlace = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.goNamed("movie_detail"),
        ),
        centerTitle: true,
        title: const Text("Select time"),
      ),
      backgroundColor: backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white),
                ),
                margin: const EdgeInsets.symmetric(vertical: 10),
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: tanggal.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        var hari = tanggal[index].day < 10
                            ? "0${tanggal[index].day}"
                            : "${tanggal[index].day}";
                        var bulan = tanggal[index].month < 10
                            ? "0${tanggal[index].month}"
                            : "${tanggal[index].month}";
                        _pickedDate = "${tanggal[index].year}-$bulan-$hari";
                      });
                    },
                    child: Container(
                      margin:
                          EdgeInsets.fromLTRB(index == 0 ? 20 : 0, 0, 20, 0),
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                          color: _pickedDate ==
                                      "${tanggal[index].year}-${tanggal[index].month}-${tanggal[index].day}" ||
                                  _pickedDate ==
                                      "${tanggal[index].year}-0${tanggal[index].month}-0${tanggal[index].day}"
                              ? secondaryColor
                              : Colors.black,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Text(tanggal[index].day.toString(),
                              style: const TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          Text(
                            formatter.format(tanggal[index]),
                            style: const TextStyle(
                                fontSize: 15, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "CGV 23 Paskal Hyper Square",
                      // style: kHeadline2,
                      style: TextStyle(color: Colors.white),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      height: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: timeSlots.length,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              _pickedPlace = "CGV 23 Paskal Hyper Square";
                              _pickedTime = formatTime.format(timeSlots[index]);
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.fromLTRB(
                                index == 0 ? 0 : 20, 0, 0, 0),
                            width: 80,
                            decoration: BoxDecoration(
                                color: _pickedPlace ==
                                            "CGV 23 Paskal Hyper Square" &&
                                        _pickedTime ==
                                            formatTime.format(timeSlots[index])
                                    ? secondaryColor
                                    : Colors.black,
                                borderRadius: BorderRadius.circular(20)),
                            child: Text(
                              formatTime.format(timeSlots[index]),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "CGV Paris Van Java",
                      // style: kHeadline2,
                      style: TextStyle(color: Colors.white),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      height: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: timeSlots.length,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              _pickedPlace = "CGV Paris Van Java";
                              _pickedTime = formatTime.format(timeSlots[index]);
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.fromLTRB(
                                index == 0 ? 0 : 20, 0, 0, 0),
                            width: 80,
                            decoration: BoxDecoration(
                                color: _pickedPlace == "CGV Paris Van Java" &&
                                        _pickedTime ==
                                            formatTime.format(timeSlots[index])
                                    ? secondaryColor
                                    : Colors.black,
                                borderRadius: BorderRadius.circular(20)),
                            child: Text(
                              formatTime.format(timeSlots[index]),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "CGV Mikko Mall",
                      // style: kHeadline2,
                      style: TextStyle(color: Colors.white),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      height: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: timeSlots.length,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              _pickedPlace = "CGV Mikko Mall";
                              _pickedTime = formatTime.format(timeSlots[index]);
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.fromLTRB(
                                index == 0 ? 0 : 20, 0, 0, 0),
                            width: 80,
                            decoration: BoxDecoration(
                                color: _pickedPlace == "CGV Mikko Mall" &&
                                        _pickedTime ==
                                            formatTime.format(timeSlots[index])
                                    ? secondaryColor
                                    : Colors.black,
                                borderRadius: BorderRadius.circular(20)),
                            child: Text(
                              formatTime.format(timeSlots[index]),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("CGV BEC Mall",
                        // style: kHeadline2,
                        style: TextStyle(color: Colors.white)),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      height: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: timeSlots.length,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              _pickedPlace = "CGV BEC Mall";
                              _pickedTime = formatTime.format(timeSlots[index]);
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.fromLTRB(
                                index == 0 ? 0 : 20, 0, 0, 0),
                            width: 80,
                            decoration: BoxDecoration(
                                color: _pickedPlace == "CGV BEC Mall" &&
                                        _pickedTime ==
                                            formatTime.format(timeSlots[index])
                                    ? secondaryColor
                                    : Colors.black,
                                borderRadius: BorderRadius.circular(20)),
                            child: Text(
                              formatTime.format(timeSlots[index]),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      alignment: Alignment.center,
                      // child: ElevatedButton(
                      //   onPressed: () {
                      //     context.goNamed("pick_seat");
                      //   },
                      //   child: const Text("Pick a Seat"),
                      // ),
                    )
                  ],
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
              onPressed: _pickedDate == "" || _pickedTime == ""
                  ? null
                  : () {
                      // log(DateTime.parse("$_pickedDate $_pickedTime")
                      // .toString());
                      context.read<TicketBloc>().add(TicketEvent.started(
                          DateTime.parse("$_pickedDate $_pickedTime"),
                          _pickedPlace, []));
                      context.goNamed('pick_seat');
                    },
              child: const Text("Select your Seat"),
            ),
          ),
        ],
      ),
    );
  }
}
