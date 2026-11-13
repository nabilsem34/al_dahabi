import 'package:flutter/material.dart';
import 'leaderboard_screen.dart';
import 'golden_goal_screen.dart';
import 'profile_screen.dart'; // Import de la page Profil
import 'pro_paywall_screen.dart'; // Import de l'écran Dhahabi Pro (Paywall)

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
              padding: const EdgeInsets.fromLTRB(14.0, 10.0, 14.0, 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // 1. Titre AL-DAHABI et icônes
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'AL-DAHABI',
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                          fontSize: 20,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.search, color: Colors.white, size: 22),
                            onPressed: () {},
                            constraints: const BoxConstraints(),
                            padding: const EdgeInsets.all(4),
                          ),
                          const SizedBox(width: 12),
                          IconButton(
                            icon: const Icon(Icons.notifications, color: Colors.white, size: 22),
                            onPressed: () {},
                            constraints: const BoxConstraints(),
                            padding: const EdgeInsets.all(4),
                          ),
                        ],
                      ),
                    ],
                  ),

                  // 2. En-tête Utilisateur avec El Dahabi PRO cliquable vers le Paywall
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFF161B22),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey[850]!, width: 1),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.amber, width: 1.2),
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              'assets/images/img_user_profil.png',
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) => const Icon(Icons.person, color: Colors.white, size: 16),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                'BIENVENUE',
                                style: TextStyle(color: Colors.grey, fontSize: 8),
                              ),
                              const SizedBox(height: 1),
                              Row(
                                children: [
                                  const Flexible(
                                    child: Text(
                                      'NABIL SEM',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 11,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  SizedBox(
                                    width: 18,
                                    height: 12,
                                    child: Image.asset(
                                      'assets/images/img_flag_algeria.png',
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, error, stackTrace) => Container(
                                        alignment: Alignment.center,
                                        color: Colors.green[700],
                                        child: const Text('ALG', style: TextStyle(color: Colors.white, fontSize: 5, fontWeight: FontWeight.bold)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // Bouton El Dahabi PRO cliquable vers l'écran ProPaywallScreen
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const ProPaywallScreen()),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Text(
                                  'El Dahabi PRO',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 9.5,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 4),
                                Icon(Icons.lock, color: Colors.black, size: 9.5),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // 3. Le Podium
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // 2ème place (Lamine Yamal)
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text('2', style: TextStyle(color: Colors.amber, fontSize: 44, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 2),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(vertical: 62, horizontal: 2),
                              decoration: BoxDecoration(
                                color: const Color(0xFF161B22),
                                borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                                border: Border.all(color: Colors.grey[850]!, width: 1),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 58,
                                    height: 58,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.blueAccent, width: 2),
                                    ),
                                    child: ClipOval(
                                      child: Image.asset(
                                        'assets/images/img_player_yamal.png',
                                        fit: BoxFit.cover,
                                        alignment: Alignment.topCenter,
                                        errorBuilder: (context, error, stackTrace) => const Center(child: Text('LY', style: TextStyle(color: Colors.white, fontSize: 10))),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 16,
                                        height: 11,
                                        child: Image.asset(
                                          'assets/images/img_flag_spain.png',
                                          fit: BoxFit.cover,
                                          errorBuilder: (context, error, stackTrace) => Container(
                                            alignment: Alignment.center,
                                            color: Colors.red[800],
                                            child: const Text('ESP', style: TextStyle(color: Colors.white, fontSize: 5, fontWeight: FontWeight.bold)),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 4),
                                      const Flexible(
                                        child: Text(
                                          'Lamine Yamal',
                                          style: TextStyle(color: Colors.white, fontSize: 9.5, fontWeight: FontWeight.bold),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 2),
                                  const Text('FC Barcelone', textAlign: TextAlign.center, style: TextStyle(color: Colors.grey, fontSize: 8)),
                                  const SizedBox(height: 2),
                                  const Text('240 Pts ⭐', textAlign: TextAlign.center, style: TextStyle(color: Colors.amber, fontSize: 8)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      // 1ère place (Kylian Mbappé)
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text('1', style: TextStyle(color: Colors.amber, fontSize: 54, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 2),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(vertical: 78, horizontal: 2),
                              decoration: BoxDecoration(
                                color: const Color(0xFF161B22),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.amber.withOpacity(0.5), width: 1.5),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 68,
                                    height: 68,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.amber, width: 2.5),
                                    ),
                                    child: ClipOval(
                                      child: Image.asset(
                                        'assets/images/img_player_mbappe.png',
                                        fit: BoxFit.cover,
                                        alignment: Alignment.topCenter,
                                        errorBuilder: (context, error, stackTrace) => const Center(child: Text('KM', style: TextStyle(color: Colors.black, fontSize: 11))),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 16,
                                        height: 11,
                                        child: Image.asset(
                                          'assets/images/img_flag_france.png',
                                          fit: BoxFit.cover,
                                          errorBuilder: (context, error, stackTrace) => Container(
                                            alignment: Alignment.center,
                                            color: Colors.blue[800],
                                            child: const Text('FRA', style: TextStyle(color: Colors.white, fontSize: 5, fontWeight: FontWeight.bold)),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 4),
                                      const Flexible(
                                        child: Text(
                                          'Kylian Mbappé',
                                          style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 2),
                                  const Text('Real Madrid', textAlign: TextAlign.center, style: TextStyle(color: Colors.grey, fontSize: 8.5)),
                                  const SizedBox(height: 2),
                                  const Text('250 Pts ⭐', textAlign: TextAlign.center, style: TextStyle(color: Colors.amber, fontSize: 8.5)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      // 3ème place (Harry Kane)
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text('3', style: TextStyle(color: Colors.amber, fontSize: 44, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 2),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 2),
                              decoration: BoxDecoration(
                                color: const Color(0xFF161B22),
                                borderRadius: const BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
                                border: Border.all(color: Colors.grey[850]!, width: 1),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 58,
                                    height: 58,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.redAccent, width: 2),
                                    ),
                                    child: ClipOval(
                                      child: Image.asset(
                                        'assets/images/img_player_kane.png',
                                        fit: BoxFit.cover,
                                        alignment: Alignment.topCenter,
                                        errorBuilder: (context, error, stackTrace) => const Center(child: Text('HK', style: TextStyle(color: Colors.white, fontSize: 10))),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 16,
                                        height: 11,
                                        child: Image.asset(
                                          'assets/images/img_flag_england.png',
                                          fit: BoxFit.cover,
                                          errorBuilder: (context, error, stackTrace) => Container(
                                            alignment: Alignment.center,
                                            color: Colors.white,
                                            child: const Text('ENG', style: TextStyle(color: Colors.red, fontSize: 5, fontWeight: FontWeight.bold)),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 4),
                                      const Flexible(
                                        child: Text(
                                          'Harry Kane',
                                          style: TextStyle(color: Colors.white, fontSize: 9.5, fontWeight: FontWeight.bold),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 2),
                                  const Text('Bayern Munich', textAlign: TextAlign.center, style: TextStyle(color: Colors.grey, fontSize: 8)),
                                  const SizedBox(height: 2),
                                  const Text('238 Pts ⭐', textAlign: TextAlign.center, style: TextStyle(color: Colors.amber, fontSize: 8)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  // 4. Les 12 cases de menu
                  GridView.count(
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 6,
                    mainAxisSpacing: 3,
                    childAspectRatio: 3.5,
                    children: [
                      _buildMenuButton('Le Golden But', context),
                      _buildMenuButton('El Zaim', context),
                      _buildMenuButton('El Dahabi Actualités', context),
                      _buildMenuButton('Matchs en direct', context),
                      _buildMenuButton('Quiz Foot', context),
                      _buildMenuButton('Ce jour-là', context),
                      _buildMenuButton('Joueur Préféré', context),
                      _buildMenuButton('Entraîneur Préféré', context),
                      _buildMenuButton('Club Préféré', context),
                      _buildMenuButton('The Battle', context),
                      _buildMenuButton('Le 11 Galactique', context),
                      _buildMenuButton('Le Golden de la Semaine', context),
                    ],
                  ),

                  // 5. Barre de navigation unique tout en bas avec liaison Profil corrigée
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xFF161B22),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey[850]!, width: 1),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildNavButton(context, Icons.home, 'Accueil', true, () {}),
                        _buildNavButton(context, Icons.bar_chart, 'Classement', false, () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const LeaderboardScreen()),
                          );
                        }),
                        _buildNavButton(context, Icons.person, 'Profil', false, () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ProfileScreen()),
                          );
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuButton(String title, BuildContext context) {
    return InkWell(
      onTap: () {
        if (title == 'Le Golden But') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const GoldenGoalScreen()),
          );
        } else if (title == 'Le 11 Galactique' || title == 'Classement') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LeaderboardScreen()),
          );
        }
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.amber[800],
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 9,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildNavButton(BuildContext context, IconData icon, String label, bool isSelected, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: isSelected ? Colors.amber : Colors.grey, size: 22),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.amber : Colors.grey,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}