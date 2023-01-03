import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:tugas_besar_2072008/bloc/ticket_bloc.dart';
import 'package:tugas_besar_2072008/color_palette.dart';

class PickSeat extends StatefulWidget {
  const PickSeat({super.key});

  @override
  State<PickSeat> createState() => _PickSeatState();
}

class _PickSeatState extends State<PickSeat> {
  final List<String> _pickedSeat = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => context.goNamed("buy_ticket"),
          ),
          centerTitle: true,
          title: const Text("Select your seat"),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 120,
              child: Stack(
                children: [
                  SizedBox(
                    height: 80,
                    child: CustomPaint(
                      painter: CurvePainter(),
                      child: Container(),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 40.0),
                    child: Center(
                      child: Text(
                        "Cinema Screen",
                        // style: kBodyText,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.1),
              child: Column(
                  children: List.generate(
                      7,
                      ((col) => Row(children: [
                            SizedBox(
                              width: 15,
                              child: Text(
                                String.fromCharCode(col + 65),
                                // style: kHeadline2,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Wrap(
                                children: List.generate(
                                    6,
                                    (row) => row != 3
                                        ? GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                if (_pickedSeat.contains(
                                                    "${String.fromCharCode(col + 65)}${row + 1}")) {
                                                  _pickedSeat.removeWhere(
                                                      (element) =>
                                                          element ==
                                                          "${String.fromCharCode(col + 65)}${row + 1}");
                                                } else {
                                                  _pickedSeat.add(
                                                      "${String.fromCharCode(col + 65)}${row + 1}");
                                                }
                                              });
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 7,
                                                      vertical: 5),
                                              height: 30,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                  color: _pickedSeat.contains(
                                                          "${String.fromCharCode(col + 65)}${row + 1}")
                                                      ? Colors.blueAccent
                                                      : Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Text(
                                                  "${String.fromCharCode(col + 65)}${row + 1}"),
                                            ),
                                          )
                                        : Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 7),
                                            height: 30,
                                            width: 30,
                                          ))),
                          ])))),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.2),
              child: Row(children: [
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  "Available",
                  // style: kBodyText,
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  width: 30,
                ),
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade600,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  "Reserved",
                  // style: kBodyText,
                  style: TextStyle(color: Colors.white),
                )
              ]),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 10,
                child: Row(
                  children: const [
                    Expanded(child: Divider(color: Colors.white)),
                  ],
                )),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "Your seat",
                      // style: kTitleText,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "(${_pickedSeat.map((e) => e).join(", ")}) x Rp 35.000",
                      // style: kBodyText,
                      style: const TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              alignment: Alignment.bottomLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: const Text(
                          "Total",
                          // style: kTitleText,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          NumberFormat.currency(
                                  locale: 'id', symbol: 'Rp ', decimalDigits: 0)
                              .format(
                            _pickedSeat.length * 35000,
                          ),
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  BlocBuilder<TicketBloc, TicketState>(
                    builder: (context, state) {
                      return SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width / 2,
                        child: ElevatedButton(
                            style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll<Color>(
                                        secondaryColor)),
                            onPressed: _pickedSeat.isEmpty
                                ? null
                                : () {
                                    context.read<TicketBloc>().add(
                                        TicketEvent.started(
                                            state.when(
                                                initial: () => DateTime.now(),
                                                running:
                                                    (dateTime, place, seats) =>
                                                        dateTime),
                                            state.when(
                                                initial: () => "",
                                                running:
                                                    (dateTime, place, seats) =>
                                                        place),
                                            _pickedSeat));
                                    context.goNamed('checkout');
                                  },
                            child: const Text("Check out")),
                      );
                    },
                  ),
                ],
              ),
            ))
          ],
        ));
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();

    paint.color = Colors.white;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 3;

    var startPoint = Offset(size.width * 0.15, size.height - 20);
    var controlPoint = Offset(size.width * 0.5, size.height - 60);
    var endPoint = Offset(size.width * 0.85, size.height - 20);

    var path = Path();
    path.moveTo(startPoint.dx, startPoint.dy);
    path.quadraticBezierTo(
        controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
