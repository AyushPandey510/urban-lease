import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urban_lease/provider/urban_lease_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UrbanLeaseProvider>(builder: (key, provider, child) {
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CupertinoButton(
              child: const Text('Sign Out'),
              onPressed: () => provider.signOut(context),
            ),
          ],
        ),
      );
    });
  }
}
