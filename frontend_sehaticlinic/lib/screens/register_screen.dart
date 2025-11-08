import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirm = TextEditingController();

  bool _obscure1 = true;
  bool _obscure2 = true;
  bool _agree = false;

  InputDecoration _decoration({
    required String hint,
    required IconData icon,
    Widget? suffix,
  }) {
    return InputDecoration(
      hintText: hint,
      prefixIcon: Icon(icon, color: const Color(0xFF7EA6C3)),
      suffixIcon: suffix,
      filled: true,
      fillColor: const Color(0xFFF3F6F9),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFF0D99FF), width: 1.2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final titleStyle = const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w800,
      color: Color(0xFF0E2A3A),
    );
    final subtitleStyle = const TextStyle(
      fontSize: 16,
      color: Color(0xFF445D6E),
      height: 1.4,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: Text('REGISTER', style: titleStyle),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 24),
                  child: Text('Buat Akun untuk mulai menggunakan', style: subtitleStyle),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: const Text('Nama', style: TextStyle(fontWeight: FontWeight.w600)),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: TextField(
                    controller: _name,
                    style: const TextStyle(fontSize: 16),
                    decoration: _decoration(hint: 'Nama', icon: Icons.person_rounded),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: const Text('Email', style: TextStyle(fontWeight: FontWeight.w600)),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: TextField(
                    controller: _email,
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(fontSize: 16),
                    decoration: _decoration(hint: 'Email', icon: Icons.email_rounded),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: const Text('Password', style: TextStyle(fontWeight: FontWeight.w600)),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: TextField(
                    controller: _password,
                    obscureText: _obscure1,
                    style: const TextStyle(fontSize: 16),
                    decoration: _decoration(
                      hint: 'Password',
                      icon: Icons.lock_rounded,
                      suffix: InkWell(
                        onTap: () => setState(() => _obscure1 = !_obscure1),
                        child: Icon(
                          _obscure1 ? Icons.visibility_rounded : Icons.visibility_off_rounded,
                          color: const Color(0xFF7EA6C3),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: const Text('Konfirmasi Password', style: TextStyle(fontWeight: FontWeight.w600)),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: TextField(
                    controller: _confirm,
                    obscureText: _obscure2,
                    style: const TextStyle(fontSize: 16),
                    decoration: _decoration(
                      hint: 'Password',
                      icon: Icons.lock_rounded,
                      suffix: InkWell(
                        onTap: () => setState(() => _obscure2 = !_obscure2),
                        child: Icon(
                          _obscure2 ? Icons.visibility_rounded : Icons.visibility_off_rounded,
                          color: const Color(0xFF7EA6C3),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      Checkbox(
                        value: _agree,
                        onChanged: (v) => setState(() => _agree = v ?? false),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                        activeColor: const Color(0xFF0D99FF),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            style: const TextStyle(color: Color(0xFF6A7A86), fontSize: 12),
                            children: [
                              const TextSpan(text: 'By Signing up I Agree to the '),
                              TextSpan(
                                text: 'term and Condition',
                                style: const TextStyle(color: Color(0xFF0D99FF), decoration: TextDecoration.underline),
                                recognizer: TapGestureRecognizer()..onTap = () {
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Term & Condition')));
                                },
                              ),
                              const TextSpan(text: ' & '),
                              TextSpan(
                                text: 'privacy Police',
                                style: const TextStyle(color: Color(0xFF0D99FF), decoration: TextDecoration.underline),
                                recognizer: TapGestureRecognizer()..onTap = () {
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Privacy Policy')));
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(bottom: 12),
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(color: Color(0xFF6A7A86), fontSize: 14),
                          children: [
                            const TextSpan(text: 'Sudah punya akun? '),
                            TextSpan(
                              text: 'Login',
                              style: const TextStyle(
                                color: Color(0xFF0D99FF),
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: (TapGestureRecognizer()
                                ..onTap = () {
                                  if (Navigator.canPop(context)) {
                                    Navigator.pop(context);
                                  } else {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (_) => const LoginScreen()),
                                    );
                                  }
                                }),
                            ),
                          ],
                        ),
                      ),
                    ),
                Container(
                  width: double.infinity,
                  height: 52,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFF1CA3FF), Color(0xFF0A67CF)],
                    ),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Register tapped')));
                      },
                      child: const Center(
                        child: Text(
                          'REGISTER',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
