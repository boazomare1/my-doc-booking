import 'package:flutter/material.dart';
import 'package:oasis_doctor_appointment/components/login_form.dart';
import 'package:oasis_doctor_appointment/components/social_button.dart';
import 'package:oasis_doctor_appointment/utils/text.dart';

import '../utils/config.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              AppText.enText['welcome_text']!,
              style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            Config.spaceSmall,
            Text(
              AppText.enText['signIn_text']!,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Config.spaceSmall,
            const LoginForm(),
            Config.spaceSmall,
            Center(
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    AppText.enText['forgot-password']!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  )),
            ),
            // add the social media login option
            const Spacer(),
            Center(
              child: Text(
                AppText.enText['social-login']!,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey.shade400,
                ),
              ),
            ),
            Config.spaceSmall,
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SocialButton(social: 'google'),
                SocialButton(social: 'facebook'),
              ],
            ),
            Config.spaceSmall,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(AppText.enText['signUp_text']!,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey.shade400,
                    )
                    ),
                    const Text(
                      'Sign Up',
                      style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                      )

              ],
            )
          ],
        )),
      ),
    );
  }
}
