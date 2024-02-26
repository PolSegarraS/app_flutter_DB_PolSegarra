import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/splash.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_application_2/screens/login.dart';
import 'package:flutter_application_2/screens/account.dart';

void main() async {
  await Supabase.initialize(
    url: 'https://jllmqwdtcctozjknntvh.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpsbG1xd2R0Y2N0b3pqa25udHZoIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDg3MDMxMjgsImV4cCI6MjAyNDI3OTEyOH0.sAs98A4wfIk6wkA4nSw46WLuoi0fulXosoZlT9lFba0',
  );
  runApp(const MainApp());
}

final supabase = Supabase.instance.client;

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', initialRoute: '/', routes: {
      '/': (context) => const SplashScreen(),
      '/login': (context) => const Login(),
      '/account': (context) => const AccountPage(),
    });
  }
}
