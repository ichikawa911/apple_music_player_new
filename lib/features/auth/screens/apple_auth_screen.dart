import 'package:bmp_music/features/auth/services/apple_auth_services.dart';
import 'package:bmp_music/shared/ui/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AppleAuthScreen extends ConsumerStatefulWidget {
  const AppleAuthScreen({super.key});

  @override
  ConsumerState<AppleAuthScreen> createState() => _AppleAuthScreenState();
}

class _AppleAuthScreenState extends ConsumerState<AppleAuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            const Spacer(),
            Text(
              "音楽ペースメーカー",
              style: GoogleFonts.gothicA1(
                fontWeight: FontWeight.bold,
                fontSize: Theme.of(context).textTheme.displaySmall?.fontSize,
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: SignInWithAppleButton(
                onPressed: () async => await AppleAuthServices.signIn().then(
                  (_) async {
                    User? user = FirebaseAuth.instance.currentUser;

                    if (user != null) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const HomeScreen();
                          },
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
