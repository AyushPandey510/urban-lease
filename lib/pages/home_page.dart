import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:urban_lease/constants/colors/app_colors.dart';
import 'package:urban_lease/provider/urban_lease_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final PageController _pageController;
  late final Timer _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {});
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UrbanLeaseProvider>(builder: (context, provider, child) {
      return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          centerTitle: true,
          title: const Text(
            'U R B A N   L E A S E',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          backgroundColor: AppColors.accentColor,
        ),
        drawer: Drawer(
          surfaceTintColor: AppColors.accentColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const DrawerHeader(
                child: Icon(
                  FontAwesomeIcons.buildingUser,
                  size: 40,
                  color: AppColors.accentColor,
                ),
              ),
              ListTile(
                dense: false,
                leading: const Icon(
                  Icons.logout,
                  size: 30,
                  color: AppColors.accentColor,
                ),
                title: const Text(
                  'L O G   O U T',
                  style: TextStyle(fontSize: 22),
                ),
                onTap: () => provider.signOut(context),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: Container(),
        ),
      );
    });
  }
}
