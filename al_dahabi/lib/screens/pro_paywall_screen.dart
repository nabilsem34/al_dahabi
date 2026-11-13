import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'leaderboard_screen.dart';
import 'profile_screen.dart';

class ProPaywallScreen extends StatelessWidget {
  const ProPaywallScreen({super.key});

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
              padding: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1. En-tête : Titre AL-DAHABI et bouton fermer (croix)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'AL-DAHABI',
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close, color: Colors.white, size: 20),
                        onPressed: () => Navigator.pop(context),
                        constraints: const BoxConstraints(),
                        padding: EdgeInsets.zero,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // 2. Bannière orange/rouge "Débloquez Al-Dahabi PRO"
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 11),
                    decoration: BoxDecoration(
                      color: Colors.deepOrange[700],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text(
                        'Débloquez Al-Dahabi PRO',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.5,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // 3. Bloc VIP et texte explicatif en haut
                  Center(
                    child: Container(
                      width: 130,
                      padding: const EdgeInsets.symmetric(vertical: 7),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Center(
                        child: Text(
                          'VIP',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Center(
                    child: Text(
                      'Profitez d\'une expérience illimitée et sans publicité.',
                      style: TextStyle(color: Colors.grey, fontSize: 11.5),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  // 4. Section centrale (les 4 rubriques au texte agrandi et Pass Pro)
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Rubrique 1
                        _buildFeatureItem(
                          'Al-Dahabi All-Time',
                          'Accès au classement historique des légendes.',
                        ),
                        const SizedBox(height: 12),
                        // Rubrique 2
                        _buildFeatureItem(
                          'Archives illimitées',
                          'Saisons complètes au-delà de 5 ans.',
                        ),
                        const SizedBox(height: 12),
                        // Rubrique 3
                        _buildFeatureItem(
                          'El Zaim All-Time',
                          'Les plus grands joueurs de chaque continent sacrés de tous les temps.',
                        ),
                        const SizedBox(height: 12),
                        // Rubrique 4
                        _buildFeatureItem(
                          'Palmarès Al-Dahabi',
                          'Classement officiel et historique des meilleurs joueurs récompensés.',
                        ),
                        const SizedBox(height: 18),

                        // Bloc Pass Pro élargi en hauteur et texte agrandi
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
                          decoration: BoxDecoration(
                            color: const Color(0xFF161B22),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.amber.withOpacity(0.5), width: 1.2),
                          ),
                          child: Column(
                            children: [
                              const Text(
                                'Pass Pro',
                                style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 15.5),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                'Prix : 14,99 € / Accès à vie',
                                style: TextStyle(color: Colors.white, fontSize: 13.5, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      height: 42,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.amber,
                                          foregroundColor: Colors.black,
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                          padding: EdgeInsets.zero,
                                        ),
                                        child: const Text('Acheter', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: SizedBox(
                                      height: 42,
                                      child: TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        style: TextButton.styleFrom(
                                          foregroundColor: Colors.grey,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            side: BorderSide(color: Colors.grey[800]!),
                                          ),
                                          padding: EdgeInsets.zero,
                                        ),
                                        child: const Text('Annuler', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Paiement sécurisé via Google Play',
                                style: TextStyle(color: Colors.grey, fontSize: 10.5),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 6),

                  // 5. Barre de navigation en bas (laissée strictement à sa place)
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
                        _buildNavButton(context, Icons.person, 'Profil', false, () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => ProfileScreen()),
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

  // Widget pour chaque rubrique avec une taille de texte agrandie (titre et explication)
  Widget _buildFeatureItem(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 13.5, // Titre agrandi
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 12, // Explication agrandie pour remplir l'écran
          ),
        ),
      ],
    );
  }

  // Widget pour les boutons de navigation du bas
  Widget _buildNavButton(BuildContext context, IconData icon, String label, bool isSelected, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: isSelected ? Colors.amber : Colors.grey, size: 20),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.amber : Colors.grey,
              fontSize: 9.5,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}