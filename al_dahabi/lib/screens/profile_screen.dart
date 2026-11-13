import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'leaderboard_screen.dart';
import 'settings_screen.dart';
import 'player_detail_screen.dart';
import 'edit_profile_screen.dart'; // Assure-toi que ce fichier existe bien dans lib/screens/

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
                children: [
                  // 1. Titre AL-DAHABI en Doré et icônes (fixé en haut)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'AL-DAHABI',
                        style: TextStyle(
                          color: Colors.amber,
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

                  // Contenu principal étiré vers le bas
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 2. Section Avatar utilisateur agrandi + Nom + Drapeau
                        Center(
                          child: Column(
                            children: [
                              Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  Container(
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.amber, width: 2.5),
                                    ),
                                    child: ClipOval(
                                      child: Image.asset(
                                        'assets/images/img_user_profil.png',
                                        fit: BoxFit.cover,
                                        errorBuilder: (context, error, stackTrace) => const Icon(Icons.person, color: Colors.white, size: 36),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 22,
                                    height: 15,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white, width: 0.5),
                                    ),
                                    child: Image.asset(
                                      'assets/images/img_flag_algeria.png',
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, error, stackTrace) => Container(color: Colors.green),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              const Text(
                                'NABIL SEM',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  letterSpacing: 1.2,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // 3. Statistiques Profil agrandies et élargies
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                          decoration: BoxDecoration(
                            color: const Color(0xFF161B22),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey[850]!, width: 1),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _buildStatItem('Points Quiz', '1250 Pts', Colors.amber),
                              _buildStatItem('Rang Fan', '42', Colors.greenAccent),
                              _buildStatItem('Trophées débloqués', '8/15', Colors.blueAccent),
                            ],
                          ),
                        ),

                        // 4. Options du profil (Redirection vers EditProfileScreen sans const)
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0xFF161B22),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey[850]!, width: 1),
                          ),
                          child: Column(
                            children: [
                              _buildMenuOption('Modifier le profil', () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => EditProfileScreen()),
                                );
                              }),
                              Divider(color: Colors.grey[850], height: 1),
                              _buildMenuOption('Mes trophées', () {}),
                              Divider(color: Colors.grey[850], height: 1),
                              _buildMenuOption('Paramètres', () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => SettingsScreen()),
                                );
                              }),
                            ],
                          ),
                        ),

                        // 5. Section des Favoris parfaitement alignée
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(child: _buildFavoriteTab('Joueur Préféré')),
                                const SizedBox(width: 6),
                                Expanded(child: _buildFavoriteTab('Entraîneur Préféré')),
                                const SizedBox(width: 6),
                                Expanded(child: _buildFavoriteTab('Club Préféré')),
                              ],
                            ),
                            const SizedBox(height: 6),
                            SizedBox(
                              height: 230,
                              child: Row(
                                children: [
                                  // Joueur Préféré (Cristiano Ronaldo) avec lien vers PlayerDetailScreen
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => const PlayerDetailScreen()),
                                        );
                                      },
                                      child: _buildFavoriteCard(
                                        'Cristiano Ronaldo',
                                        'Al Nassr.\nAttaquant',
                                        '858.5 Pts',
                                        '#8',
                                        'assets/images/img_player_cristiano.png',
                                        'assets/images/img_flag_portugal.png',
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  Expanded(child: _buildFavoriteCard(
                                    'José Mourinho',
                                    'Real Madrid\n ',
                                    '200 Pts',
                                    '#8',
                                    'assets/images/IMG_coach_mourinho.png',
                                    'assets/images/img_flag_portugal.png',
                                  )),
                                  const SizedBox(width: 6),
                                  Expanded(child: _buildFavoriteCard(
                                    'Real Madrid',
                                    'Espagne\n ',
                                    '15 Pts',
                                    '#1',
                                    'assets/images/img_club_real_madrid.png',
                                    'assets/images/img_flag_spain.png',
                                  )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 6),

                  // 6. Barre de navigation du bas
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF161B22),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey[850]!, width: 1),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildNavButton(context, Icons.home, 'Accueil', false, () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const HomeScreen()),
                          );
                        }),
                        _buildNavButton(context, Icons.bar_chart, 'Classement', false, () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const LeaderboardScreen()),
                          );
                        }),
                        _buildNavButton(context, Icons.person, 'Profil', true, () {}),
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

  Widget _buildStatItem(String title, String value, Color valueColor) {
    return Column(
      children: [
        Text(title, style: const TextStyle(color: Colors.grey, fontSize: 9)),
        const SizedBox(height: 2),
        Text(value, style: TextStyle(color: valueColor, fontWeight: FontWeight.bold, fontSize: 11.5)),
      ],
    );
  }

  Widget _buildMenuOption(String title, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: const TextStyle(color: Colors.white, fontSize: 11.5, fontWeight: FontWeight.w500)),
            const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 12),
          ],
        ),
      ),
    );
  }

  Widget _buildFavoriteTab(String title) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(10)),
      child: Text(title, style: const TextStyle(color: Colors.black, fontSize: 8.5, fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis),
    );
  }

  Widget _buildFavoriteCard(String name, String role, String points, String rank, String imagePath, String flagPath) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 95,
          height: 105,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.amber, width: 2)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.5),
            child: Image.asset(imagePath, fit: BoxFit.cover, alignment: Alignment.topCenter, errorBuilder: (context, error, stackTrace) => const Icon(Icons.shield, color: Colors.amber, size: 32)),
          ),
        ),
        const SizedBox(height: 3),
        Text(name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 9.5), textAlign: TextAlign.center, overflow: TextOverflow.ellipsis),
        SizedBox(
          height: 22,
          child: Text(role, style: const TextStyle(color: Colors.grey, fontSize: 7.5), textAlign: TextAlign.center, overflow: TextOverflow.ellipsis, maxLines: 2),
        ),
        const SizedBox(height: 2),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          decoration: BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(6)),
          child: Text(points, style: const TextStyle(color: Colors.black, fontSize: 8.5, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 2),
        Text(rank, style: const TextStyle(color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 14)),
        const SizedBox(height: 2),
        Container(
          width: 18,
          height: 12,
          decoration: BoxDecoration(border: Border.all(color: Colors.white, width: 0.5)),
          child: Image.asset(flagPath, fit: BoxFit.cover, errorBuilder: (context, error, stackTrace) => Container(color: Colors.red)),
        ),
      ],
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
          Text(label, style: TextStyle(color: isSelected ? Colors.amber : Colors.grey, fontSize: 10, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}