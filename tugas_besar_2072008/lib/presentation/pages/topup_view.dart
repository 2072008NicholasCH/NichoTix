import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:tugas_besar_2072008/color_palette.dart';
import 'package:tugas_besar_2072008/entity/user_entity.dart' as user2;

class TopupView extends StatefulWidget {
  const TopupView({super.key});

  @override
  State<TopupView> createState() => _TopupViewState();
}

class _TopupViewState extends State<TopupView> {
  late user2.User userEntity;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference usersCol = firestore.collection("user");
  int _jumlah = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.goNamed('home'),
        ),
        centerTitle: true,
        title: const Text("Topup Credit"),
      ),
      backgroundColor: backgroundColor,
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white),
                    ),
                    height: 75,
                    child: Row(
                      children: [
                        const Text(
                          "Your Balance: ",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        StreamBuilder<DocumentSnapshot>(
                          stream: usersCol
                              .doc(FirebaseAuth.instance.currentUser?.uid)
                              .snapshots(),
                          builder: ((context, snapshot) {
                            if (snapshot.hasData) {
                              return Text(
                                // snapshot.data!['balance'].toString(),
                                NumberFormat.currency(
                                        locale: 'id',
                                        symbol: 'Rp ',
                                        decimalDigits: 0)
                                    .format(snapshot.data!['balance'])
                                    .toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              );
                            } else {
                              return const Text(
                                "Balance",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              );
                            }
                          }),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _jumlah = 20000;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.white),
                                  color: _jumlah == 20000
                                      ? secondaryColor
                                      : Colors.transparent),
                              height: 100,
                              width: 125,
                              child: Column(
                                children: [
                                  const Center(
                                      child: Icon(
                                    Icons.attach_money_rounded,
                                    color: Colors.white,
                                    size: 50,
                                  )),
                                  Center(
                                    child: Text(
                                      NumberFormat.currency(
                                              locale: 'id',
                                              symbol: 'Rp ',
                                              decimalDigits: 0)
                                          .format(20000)
                                          .toString(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _jumlah = 50000;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.white),
                                  color: _jumlah == 50000
                                      ? secondaryColor
                                      : Colors.transparent),
                              height: 100,
                              width: 125,
                              child: Column(
                                children: [
                                  const Center(
                                      child: Icon(
                                    Icons.attach_money_rounded,
                                    color: Colors.white,
                                    size: 50,
                                  )),
                                  Center(
                                    child: Text(
                                      NumberFormat.currency(
                                              locale: 'id',
                                              symbol: 'Rp ',
                                              decimalDigits: 0)
                                          .format(50000)
                                          .toString(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _jumlah = 100000;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.white),
                                  color: _jumlah == 100000
                                      ? secondaryColor
                                      : Colors.transparent),
                              height: 100,
                              width: 125,
                              child: Column(
                                children: [
                                  const Center(
                                      child: Icon(
                                    Icons.attach_money_rounded,
                                    color: Colors.white,
                                    size: 50,
                                  )),
                                  Center(
                                    child: Text(
                                      NumberFormat.currency(
                                              locale: 'id',
                                              symbol: 'Rp ',
                                              decimalDigits: 0)
                                          .format(100000)
                                          .toString(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _jumlah = 200000;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.white),
                                  color: _jumlah == 200000
                                      ? secondaryColor
                                      : Colors.transparent),
                              height: 100,
                              width: 125,
                              child: Column(
                                children: [
                                  const Center(
                                      child: Icon(
                                    Icons.attach_money_rounded,
                                    color: Colors.white,
                                    size: 50,
                                  )),
                                  Center(
                                    child: Text(
                                      NumberFormat.currency(
                                              locale: 'id',
                                              symbol: 'Rp ',
                                              decimalDigits: 0)
                                          .format(200000)
                                          .toString(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _jumlah = 300000;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.white),
                                  color: _jumlah == 300000
                                      ? secondaryColor
                                      : Colors.transparent),
                              height: 100,
                              width: 125,
                              child: Column(
                                children: [
                                  const Center(
                                      child: Icon(
                                    Icons.attach_money_rounded,
                                    color: Colors.white,
                                    size: 50,
                                  )),
                                  Center(
                                    child: Text(
                                      NumberFormat.currency(
                                              locale: 'id',
                                              symbol: 'Rp ',
                                              decimalDigits: 0)
                                          .format(300000)
                                          .toString(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _jumlah = 500000;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.white),
                                  color: _jumlah == 500000
                                      ? secondaryColor
                                      : Colors.transparent),
                              height: 100,
                              width: 125,
                              child: Column(
                                children: [
                                  const Center(
                                      child: Icon(
                                    Icons.attach_money_rounded,
                                    color: Colors.white,
                                    size: 50,
                                  )),
                                  Center(
                                    child: Text(
                                      NumberFormat.currency(
                                              locale: 'id',
                                              symbol: 'Rp ',
                                              decimalDigits: 0)
                                          .format(500000)
                                          .toString(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
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
                      log(_jumlah.toString());
                      usersCol
                          .doc(FirebaseAuth.instance.currentUser?.uid)
                          .update({
                        'balance': data['balance'] + _jumlah,
                      });
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          backgroundColor: secondaryColor,
                          content: Text("Your Recharge is Successful!")));
                    });
                    // _jumlah = 0;
                  },
                  child: const Text(
                    "Topup",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
