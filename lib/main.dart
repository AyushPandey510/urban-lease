import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:urban_lease/constants/colors/app_colors.dart';
import 'package:urban_lease/firebase_options.dart';
import 'package:urban_lease/pages/main_page.dart';
import 'package:urban_lease/provider/urban_lease_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UrbanLeaseProvider()),
      ],
      child: MaterialApp(
        title: 'Urban Lease',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: GoogleFonts.poppins.toString(),
          colorScheme: const ColorScheme.dark(primary: AppColors.accentColor),
          useMaterial3: true,
        ),
        home: const MainPage(),
      ),
    );
  }
}
