import 'package:flutter/material.dart';

void main() => runApp(const XApp());

class XApp extends StatelessWidget {
  const XApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark, scaffoldBackgroundColor: Colors.black),
      home: const XLoginPage(),
    );
  }
}

class XLoginPage extends StatelessWidget {
  const XLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              // Logo X
              Center(
                child: SizedBox(
                  width: 44, height: 44,
                  child: CustomPaint(painter: XLogoPainter()),
                ),
              ),

              const SizedBox(height: 40),

              // Titre
              const Text(
                'Connectez-vous à X',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w800),
              ),

              const SizedBox(height: 36),

              // Bouton Google
              _SocialButton(icon: Icons.g_mobiledata, label: 'Continuer avec Google'),
              const SizedBox(height: 12),

              // Bouton Apple
              _SocialButton(icon: Icons.apple, label: 'Continuer avec Apple'),
              const SizedBox(height: 20),

              // Séparateur
              Row(children: [
                Expanded(child: Divider(color: Colors.grey[800])),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text('ou', style: TextStyle(color: Colors.grey[600])),
                ),
                Expanded(child: Divider(color: Colors.grey[800])),
              ]),

              const SizedBox(height: 20),

              // Champ email
              _XTextField(hint: 'Téléphone, e-mail ou nom d\'utilisateur'),
              const SizedBox(height: 16),

              // Champ mot de passe
              _XTextField(hint: 'Mot de passe', obscure: true),
              const SizedBox(height: 8),

              // Mot de passe oublié
              Align(
                alignment: Alignment.centerRight,
                child: Text('Mot de passe oublié ?',
                  style: const TextStyle(color: Color(0xFF1D9BF0), fontSize: 14)),
              ),

              const SizedBox(height: 28),

              // Bouton Se connecter
              SizedBox(
                height: 52,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
                    elevation: 0,
                  ),
                  child: const Text('Se connecter',
                    style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700)),
                ),
              ),

              const SizedBox(height: 16),

              // Lien inscription
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text('Vous n\'avez pas de compte ? ', style: TextStyle(color: Colors.grey[600])),
                const Text('S\'inscrire', style: TextStyle(color: Color(0xFF1D9BF0), fontWeight: FontWeight.w600)),
              ]),

              const SizedBox(height: 32),

              // Termes
              Text(
                'En vous connectant, vous acceptez nos Conditions d\'utilisation et notre Politique de confidentialité.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[700], fontSize: 12, height: 1.5),
              ),

              const SizedBox(height: 32),
            ],
          ),
        ),
        ),
      ),
    );
  }
}

// ── Widgets réutilisables ─────────────────────────────────────────────────────

class _SocialButton extends StatelessWidget {
  final IconData icon;
  final String label;
  const _SocialButton({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.white,
          side: const BorderSide(color: Color(0xFF2F3336)),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(icon, color: Colors.white, size: 22),
          const SizedBox(width: 12),
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600)),
        ]),
      ),
    );
  }
}

class _XTextField extends StatelessWidget {
  final String hint;
  final bool obscure;
  const _XTextField({required this.hint, this.obscure = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscure,
      style: const TextStyle(color: Colors.white),
      cursorColor: const Color(0xFF1D9BF0),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey[600]),
        filled: true,
        fillColor: const Color(0xFF16181C),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Color(0xFF2F3336))),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Color(0xFF2F3336))),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Color(0xFF1D9BF0), width: 1.5)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
    );
  }
}

// ── Logo X ────────────────────────────────────────────────────────────────────

class XLogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 3.5
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    canvas.drawLine(Offset(size.width * 0.08, size.height * 0.06), Offset(size.width * 0.92, size.height * 0.94), paint);
    canvas.drawLine(Offset(size.width * 0.92, size.height * 0.06), Offset(size.width * 0.08, size.height * 0.94), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}