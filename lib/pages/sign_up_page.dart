import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:urban_lease/constants/colors/app_colors.dart';
import 'package:urban_lease/constants/widgets/custom_text_field.dart';
import 'package:urban_lease/pages/home_page.dart';
import 'package:urban_lease/pages/sign_in_page.dart';
import 'package:urban_lease/provider/urban_lease_provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late TextEditingController _email;
  late TextEditingController _password;
  late TextEditingController _confirmPassword;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    _confirmPassword = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UrbanLeaseProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          extendBody: true,
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Head Icon / Image
                const Icon(
                  FontAwesomeIcons.houseUser,
                  size: 80,
                  color: AppColors.accentColor,
                ),

                const SizedBox(
                  height: 30,
                ),

                // Title
                const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: Colors.white38,
                  ),
                ),

                const SizedBox(
                  height: 30,
                ),

                // Email Text Field
                CustomTextField(
                  email: _email,
                  hintText: 'Enter your email here',
                  icon: Icons.email_rounded,
                  obscureText: false,
                ),

                const SizedBox(
                  height: 20,
                ),

                // Password Text Field
                CustomTextField(
                  email: _password,
                  hintText: 'Enter your password here',
                  icon: Icons.lock_rounded,
                  obscureText: true,
                ),

                const SizedBox(
                  height: 20,
                ),

                // Confrim Password Text Field
                CustomTextField(
                  email: _confirmPassword,
                  hintText: 'Re-enter your password here',
                  icon: Icons.lock_rounded,
                  obscureText: true,
                ),

                const SizedBox(
                  height: 20,
                ),

                // Sign Up Button
                SizedBox(
                  width: double.infinity,
                  child: CupertinoButton(
                    color: AppColors.accentColor,
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        letterSpacing: 1.1,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    onPressed: () async {
                      await provider.signUp(
                        _email.text.trim(),
                        _password.text.trim(),
                        _confirmPassword.text.trim(),
                        context,
                      );
                    },
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                // Navigation to sign in page.
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already a member ? ',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SignInPage(),
                        ),
                      ),
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColors.accentColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
