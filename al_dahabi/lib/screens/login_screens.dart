import 'package:flutter/material.dart';
import 'welcome_screen.dart'; // Redirection vers l'écran de bienvenue

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF030712),
      body: Center(
        child: Container(
          width: 420,
          height: 850,
          decoration: BoxDecoration(
            color: const Color(0xFF0B0F19),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Colors.grey[850]!, width: 1.5),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.7),
                blurRadius: 25,
                spreadRadius: 5,
              ),
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1. Titre AL-DAHABI en haut à gauche comme sur Figma
                  const Text(
                    'AL-DAHABI',
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                  const Spacer(),

                  // 2. Champ Adresse e-mail
                  TextField(
                    controller: _emailController,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                    decoration: InputDecoration(
                      hintText: 'Adresse e-mail',
                      hintStyle: const TextStyle(color: Colors.grey, fontSize: 12),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey[850]!, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.amber, width: 1),
                      ),
                      filled: true,
                      fillColor: const Color(0xFF161B22),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // 3. Champ Mot de passe avec icône œil
                  TextField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                    decoration: InputDecoration(
                      hintText: 'Mot de passe',
                      hintStyle: const TextStyle(color: Colors.grey, fontSize: 12),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword ? Icons.visibility_off : Icons.visibility,
                          color: Colors.grey,
                          size: 18,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey[850]!, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.amber, width: 1),
                      ),
                      filled: true,
                      fillColor: const Color(0xFF161B22),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    ),
                  ),
                  const SizedBox(height: 6),

                  // 4. Mot de passe oublié ?
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(padding: EdgeInsets.zero, minimumSize: const Size(0, 0)),
                      child: const Text(
                        'Mot de passe oublié ?',
                        style: TextStyle(color: Colors.grey, fontSize: 11),
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),

                  // 5. Bouton "Se connecter" (mène vers l'écran Welcome)
                  SizedBox(
                    width: double.infinity,
                    height: 42,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => const WelcomeScreen()),
                              (route) => false,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Se connecter',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13.5,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),

                  // 6. Vous n'avez pas de compte ? Créer un compte
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Vous n\'avez pas de compte ? ',
                          style: TextStyle(color: Colors.grey, fontSize: 11),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: const Text(
                            'Créer un compte',
                            style: TextStyle(
                              color: Colors.pinkAccent,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // 7. Ou continuer avec
                  const Center(
                    child: Text(
                      'Ou continuer avec',
                      style: TextStyle(color: Colors.grey, fontSize: 11),
                    ),
                  ),
                  const SizedBox(height: 14),

                  // 8. Icônes sociales (Google, Facebook, Apple)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSocialIcon(Icons.g_mobiledata, Colors.red),
                      const SizedBox(width: 16),
                      _buildSocialIcon(Icons.facebook, Colors.blue),
                      const SizedBox(width: 16),
                      _buildSocialIcon(Icons.apple, Colors.white),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon, Color color) {
    return Container(
      width: 38,
      height: 38,
      decoration: BoxDecoration(
        color: const Color(0xFF161B22),
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey[850]!, width: 1),
      ),
      child: Icon(icon, color: color, size: 20),
    );
  }
}