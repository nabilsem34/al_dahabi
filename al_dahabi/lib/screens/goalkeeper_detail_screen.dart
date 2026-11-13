import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'leaderboard_screen.dart';
import 'profile_screen.dart';

class GoalkeeperDetailScreen extends StatelessWidget {
  final String playerName;
  final String playerTeam;
  final String playerPoints;
  final String playerImage;
  final String playerFlag;
  final String playerRank;

  const GoalkeeperDetailScreen({
    super.key,
    required this.playerName,
    required this.playerTeam,
    required this.playerPoints,
    required this.playerImage,
    required this.playerFlag,
    required this.playerRank,
  });

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
                  // 1. En-tête : Logo AL-DAHABI et bouton retour correct
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'AL-DAHABI',
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios, color: Colors.amber, size: 18),
                        onPressed: () => Navigator.pop(context),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),

                  // 2. Contenu principal avec défilement
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          // Carte supérieure : Classement à gauche, Photo centrée, Drapeau à droite
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: const Color(0xFF161B22),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: Colors.grey[850]!, width: 1),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    // Numéro de classement dynamique
                                    Text(
                                      '# $playerRank',
                                      style: const TextStyle(
                                        color: Colors.amber,
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(width: 25),
                                    // Photo du gardien ultra-nette
                                    Container(
                                      width: 95,
                                      height: 115,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(12),
                                        image: DecorationImage(
                                          image: AssetImage(playerImage),
                                          fit: BoxFit.cover,
                                          alignment: Alignment.topCenter,
                                          filterQuality: FilterQuality.high, // Force une netteté maximale
                                        ),
                                        border: Border.all(color: Colors.amber, width: 1.5),
                                      ),
                                    ),
                                    const SizedBox(width: 25),
                                    // Drapeau du pays à droite
                                    SizedBox(
                                      width: 28,
                                      height: 20,
                                      child: Image.asset(
                                        playerFlag,
                                        fit: BoxFit.cover,
                                        filterQuality: FilterQuality.high,
                                        errorBuilder: (context, error, stackTrace) => const Text('🏳️', style: TextStyle(fontSize: 18)),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 14),
                                Text(
                                  playerName,
                                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  '$playerTeam\nGardien',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                                ),
                                const SizedBox(height: 8),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    '$playerPoints ⭐',
                                    style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 13),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),

                          // 3. Grille des 4 statistiques (Clean Sheets & Arrêts)
                          Row(
                            children: [
                              Expanded(child: _buildStatCard('Clean Sheets', '17 🧤')),
                              const SizedBox(width: 10),
                              Expanded(child: _buildStatCard('Arrêts', '132 🥅')),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(child: _buildStatCard('Matches', '45 🏟️')),
                              const SizedBox(width: 10),
                              Expanded(child: _buildStatCard('Trophées', '00 🏆')),
                            ],
                          ),
                          const SizedBox(height: 20),

                          // 4. Paliers libres sans grand rectangle
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildPalierFree('Palier 01', '82Pts', Colors.amber, '1'),
                              const SizedBox(width: 6),
                              _buildPalierFree('Palier 02', '000Pts', Colors.grey[300]!, '2'),
                              const SizedBox(width: 6),
                              _buildPalierFree('Palier 03', '30Pts', Colors.orange[800]!, '3'),
                              const SizedBox(width: 6),
                              _buildPalierFree('Palier 04', '0000Pts', Colors.blueAccent, '4'),
                            ],
                          ),
                          const SizedBox(height: 15),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),

                  // 5. Barre de navigation en bas
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

  Widget _buildStatCard(String title, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 26, horizontal: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF161B22),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey[850]!, width: 1.2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFFD4AF37),
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPalierFree(String palierTitle, String points, Color color, String badgeNumber) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFF161B22),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: color.withOpacity(0.6), width: 1.2),
            ),
            child: Text(
              palierTitle,
              textAlign: TextAlign.center,
              style: TextStyle(color: color, fontSize: 9.5, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              shape: BoxShape.circle,
              border: Border.all(color: color, width: 2),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.military_tech, color: color, size: 16),
                  const SizedBox(width: 1),
                  Text(
                    badgeNumber,
                    style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            points,
            style: TextStyle(
              color: color,
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Icon(Icons.arrow_downward, color: color, size: 18),
          const SizedBox(height: 10),
          InkWell(
            onTap: () {},
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 7),
              decoration: BoxDecoration(
                color: const Color(0xFF161B22),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: color.withOpacity(0.7), width: 1.2),
              ),
              child: Text(
                'De détails',
                textAlign: TextAlign.center,
                style: TextStyle(color: color, fontSize: 8.5, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

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