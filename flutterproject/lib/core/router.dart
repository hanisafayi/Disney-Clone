import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../presentation/screen/AddCarPage.dart';
import '../presentation/screen/admin_page.dart';
import '../presentation/screen/available_cars.dart';
import '../presentation/screen/book_car.dart';
import '../presentation/screen/loginScreen.dart';
import '../presentation/screen/payment.dart';
import '../presentation/screen/regScreen.dart';
import '../presentation/screen/showroom.dart';
import '../presentation/screen/UpdateCarPage.dart';
import '../presentation/screen/WelcomeScreen.dart';

GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      pageBuilder: (context, state) => const MaterialPage(
        child: WelcomeScreen(),
      ),
    ),
    GoRoute(
      path: "/register",
      pageBuilder: (context, state) => MaterialPage(
        child: RegScreen(),
      ),
    ),
    GoRoute(
      path: "/login",
      pageBuilder: (context, state) => MaterialPage(
        child: LoginScreen(),
      ),
    ),
    GoRoute(
      path: "/home",
      pageBuilder: (context, state) => MaterialPage(
        child: Showroom(),
      ),
    ),
    GoRoute(
      path: "/browse",
      pageBuilder: (context, state) => MaterialPage(
        child: AvailableCars(),
      ),
    ),
    // GoRoute(
    //   path: "/book",
    //   pageBuilder: (context, state) => MaterialPage(
    //     child: BookCar(car: null,),
    //   ),
    // ),
    GoRoute(
      path: "/payment",
      pageBuilder: (context, state) => MaterialPage(
        child: PaymentPage(),
      ),
    ),
    GoRoute(
      path: "/about",
      pageBuilder: (context, state) => MaterialPage(
        child: AddCarPage(),
      ),
    ),
    GoRoute(
      path: "/rolemgt",
      pageBuilder: (context, state) => MaterialPage(
        child: AdminPage(),
      ),
    ),
  ],
);
