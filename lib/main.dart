import 'package:flutter/material.dart';
import 'package:oasis_doctor_appointment/screens/auth_page.dart';
import 'package:oasis_doctor_appointment/screens/booking_page.dart';
import 'package:oasis_doctor_appointment/screens/doctor_details.dart';
import 'package:oasis_doctor_appointment/screens/success_booked.dart';
import 'package:oasis_doctor_appointment/utils/config.dart';
import 'package:oasis_doctor_appointment/utils/main_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  //for the push navigator
  static final navigatorKey = GlobalKey<NavigatorState>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //define Theme data
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Oasis Doctor App',
      theme: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
          focusColor: Config.primaryColor,
          border: Config.outlinedBorder,
          focusedBorder: Config.focusBorder,
          errorBorder: Config.errorBorder,
          enabledBorder: Config.outlinedBorder,
          floatingLabelStyle: TextStyle(color: Config.primaryColor),
          prefixIconColor: Colors.black38,
        ),
        scaffoldBackgroundColor: Colors.white,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Config.primaryColor,
          selectedItemColor: Colors.white,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          unselectedItemColor: Colors.grey.shade700,
          elevation: 10,
          type: BottomNavigationBarType.fixed,
        ),
      ),
      initialRoute: '/',
      routes: {
        // This is initial route of the app
        // which is the auth page(login and sign up)
        '/': (context) => const AuthPage(),
        'main': (context) => const MainLayout(),
        'doc_details':(context) => const DoctorDetails(),
        'booking_page':(context) => const BookingPage(),
        'success_booking':(context) => const AppointmentBooked(),



      },
    );
  }
  // This trailing comma makes auto-formatting nicer for build methods.
}
