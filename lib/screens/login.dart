import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  late final StreamSubscription<AuthState> _authSubscription;
  void initState() {
    super.initState();
    _authSubscription = supabase.auth.onAuthStateChange.listen((event) {
      final session = event.session;
      if (session != null) {
        Navigator.of(context).pushReplacementNamed('/account');
      }
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _authSubscription.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: ListView(padding: const EdgeInsets.all(12), children: [
        TextFormField(
          controller: _emailController,
          decoration: const InputDecoration(
            labelText: 'Email',
          ),
        ),
        ElevatedButton(
          onPressed: () async {
            try {
              final email = _emailController.text.trim();
              await supabase.auth.signInWithOtp(
                email: email,
                emailRedirectTo:
                    'io.supabase.flutterquickstart://login-callback/',
              );
              if (mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Check your email for the login link!'),
                  ),
                );
              }
            } on AuthException catch (error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Login Error: $error'),
                  backgroundColor: Theme.of(context).colorScheme.error,
                ),
              );
            } catch (error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Error'),
                  backgroundColor: Theme.of(context).colorScheme.error,
                ),
              );
            }
          },
          child: const Text('Login'),
        ),
      ]),
    );
  }
}
