import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:tugas_besar_2072008/color_palette.dart';
import 'package:tugas_besar_2072008/services/auth_services.dart';
import 'package:tugas_besar_2072008/entity/user_entity.dart' as user2;

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late user2.User userEntity;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference usersCol = firestore.collection("user");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text("Profile"),
      ),
      backgroundColor: backgroundColor,
      body: ListView(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Image.asset(
                'assets/images/default_profile.png',
                fit: BoxFit.fill,
                width: 105,
                height: 105,
              ),
              const SizedBox(
                height: 50,
              ),
              FutureBuilder(
                future:
                    usersCol.doc(FirebaseAuth.instance.currentUser?.uid).get(),
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
              const SizedBox(
                height: 10,
              ),
              FutureBuilder(
                future:
                    usersCol.doc(FirebaseAuth.instance.currentUser?.uid).get(),
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    userEntity = user2.User.fromJson(
                        snapshot.data!.data() as Map<String, dynamic>);
                    return Text(
                      userEntity.phone.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    );
                  } else {
                    return const Text(
                      "Phone",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    );
                  }
                }),
              ),
              const SizedBox(
                height: 10,
              ),
              FutureBuilder(
                future:
                    usersCol.doc(FirebaseAuth.instance.currentUser?.uid).get(),
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    userEntity = user2.User.fromJson(
                        snapshot.data!.data() as Map<String, dynamic>);
                    return Text(
                      NumberFormat.currency(
                              locale: 'id', symbol: 'Rp ', decimalDigits: 0)
                          .format(userEntity.balance!)
                          .toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    );
                  } else {
                    return const Text(
                      "Tix Credit",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    );
                  }
                }),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(secondaryColor)),
                onPressed: () {
                  context.goNamed("topup");
                },
                child: const Text("Topup Credit"),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 165,
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          const MaterialStatePropertyAll<Color>(secondaryColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ))),
                  onPressed: () async {
                    await AuthServices.signOut()
                        .then((value) => context.goNamed('login'));
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const <Widget>[Text('Logout')],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
