import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:urban_lease/constants/colors/app_colors.dart';
import 'package:urban_lease/constants/widgets/custom_text_field.dart';
import 'package:urban_lease/pages/sign_in_page.dart';
import 'package:urban_lease/pages/sign_up_page.dart';
import 'package:urban_lease/provider/urban_lease_provider.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  late TextEditingController _email;
  late TextEditingController _passwaord;

  @override
  void initState() {
    _email = TextEditingController();
    _passwaord = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _passwaord.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UrbanLeaseProvider>(
      builder: (context, value, child) {
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
                  FontAwesomeIcons.userSecret,
                  size: 80,
                  color: AppColors.accentColor,
                ),

                const SizedBox(
                  height: 30,
                ),
                // Title
                const Text(
                  'Reset Password',
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

                // Sign In Button
                SizedBox(
                  width: double.infinity,
                  child: CupertinoButton(
                    color: AppColors.accentColor,
                    child: const Text(
                      'Reset Password',
                      style: TextStyle(
                        letterSpacing: 1.1,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    onPressed: () => value.forgotPassword(
                      context,
                      _email.text.trim(),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                // Navigation to sign up page.
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Back to Sign In Page ? ',
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
                          fontWeight: FontWeight.bold,
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
