import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tugas_besar_2072008/bloc/movie_bloc.dart';
import 'package:tugas_besar_2072008/bloc/ticket_bloc.dart';
import 'package:tugas_besar_2072008/presentation/pages/checkout_view.dart';
import 'package:tugas_besar_2072008/presentation/pages/login_view.dart';
import 'package:tugas_besar_2072008/presentation/pages/movie_detail_view.dart';
import 'package:tugas_besar_2072008/presentation/pages/nav_bar.dart';
import 'package:tugas_besar_2072008/presentation/pages/pick_date_view.dart';
import 'package:tugas_besar_2072008/presentation/pages/pick_seat_view.dart';
import 'package:tugas_besar_2072008/presentation/pages/profile_view.dart';
import 'package:tugas_besar_2072008/presentation/pages/signup_view.dart';
import 'package:tugas_besar_2072008/presentation/pages/ticket_detail_view.dart';
import 'package:tugas_besar_2072008/presentation/pages/topup_view.dart';
import 'package:tugas_besar_2072008/presentation/pages/upcoming_detail_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) {
          return const LoginPage();
        },
        routes: [
          GoRoute(
            path: 'signup',
            name: 'signup',
            builder: (context, state) {
              return const SignUpPage();
            },
          ),
        ],
      ),
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) {
          return const NavBar();
        },
        routes: [
          GoRoute(
            path: 'movie_detail',
            name: 'movie_detail',
            builder: (context, state) {
              return const MovieDetail();
            },
            routes: [
              GoRoute(
                path: 'buy_ticket',
                name: 'buy_ticket',
                builder: (context, state) {
                  return const PickDate();
                },
              ),
              GoRoute(
                path: "pick_seat",
                name: "pick_seat",
                builder: (context, state) {
                  return const PickSeat();
                },
              ),
              GoRoute(
                path: "checkout",
                name: "checkout",
                builder: (context, state) {
                  return const CheckoutView();
                },
                routes: [
                  GoRoute(
                    path: "ticket_detail/:id",
                    name: "ticket_detail",
                    builder: (context, state) {
                      return TicketDetailView(
                        id: state.params['id']!,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
            path: 'upcoming_detail',
            name: 'upcoming_detail',
            builder: (context, state) {
              return const UpcomingDetail();
            },
          ),
        ],
      ),
      GoRoute(
        path: "/profile",
        name: "profile",
        builder: (context, state) {
          return const ProfileView();
        },
        routes: [
          GoRoute(
            path: "topup",
            name: "topup",
            builder: (context, state) {
              return const TopupView();
            },
          ),
        ],
      ),
    ],
    initialLocation: '/login',
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext context) => MovieBloc()
              ..add(
                const MovieEvent.started(0),
              )),
        BlocProvider(
          create: ((BuildContext context) => TicketBloc()
            ..add(
              TicketEvent.started(DateTime.now(), "", []),
            )),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
        routerDelegate: router.routerDelegate,
      ),
    );
  }
}
