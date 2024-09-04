import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urban_lease/pages/home_page.dart';
import 'package:urban_lease/pages/sign_in_page.dart';
import 'package:urban_lease/provider/urban_lease_provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UrbanLeaseProvider>(context);
    return StreamBuilder(
      stream: provider.auth.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const HomePage();
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return const SignInPage();
        }
      },
    );
  }
}
