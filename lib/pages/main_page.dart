import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urban_lease/pages/home_page.dart';
import 'package:urban_lease/pages/sign_in_page.dart';
import 'package:urban_lease/provider/urban_lease_provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UrbanLeaseProvider>(
      builder: (context, provider, child) {
        return StreamBuilder<User?>(
          stream: provider.auth.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              return const HomePage();
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              return const SignInPage();
            }
          },
        );
      },
    );
  }
}
