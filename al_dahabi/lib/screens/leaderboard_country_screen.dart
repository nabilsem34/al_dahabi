import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'leaderboard_screen.dart';
import 'profile_screen.dart';
import 'player_detail_screen.dart';

class LeaderboardCountryScreen extends StatefulWidget {
  const LeaderboardCountryScreen({super.key});

  @override
  State<LeaderboardCountryScreen> createState() => _LeaderboardCountryScreenState();
}

class _LeaderboardCountryScreenState extends State<LeaderboardCountryScreen> {
  String selectedSeason = 'Saison 2026/2027';

  void _showSeasonPicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF161B22),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: Colors.grey[850]!, width: 1), // CORRIGÉ ICI
          ),
          title: const Text(
            'Choisir la saison',
            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildSeasonOption(context, 'Saison 2026/2027', false),
              _buildSeasonOption(context, 'Saison 2025/2026', false),
              _buildSeasonOption(context, 'Saison 2024/2025', false),
              _buildSeasonOption(context, 'Saison 2023/2024', true),
              _buildSeasonOption(context, 'Saison 2022/2023', true),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSeasonOption(BuildContext context, String seasonName, bool isLocked) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: selectedSeason == seasonName ? Colors.amber.withOpacity(0.2) : const Color(0xFF0B0F19),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: selectedSeason == seasonName ? Colors.amber : Colors.grey[850]!,
          width: 1,
        ),
      ),
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              seasonName,
              style: TextStyle(
                color: isLocked ? Colors.grey : Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
            if (isLocked)
              const Icon(Icons.lock, color: Colors.amber, size: 16)
            else if (selectedSeason == seasonName)
              const Icon(Icons.check, color: Colors.amber, size: 16),
          ],
        ),
        onTap: () {
          if (isLocked) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Cette saison historique est réservée à la version Pro (Cadenas).'),
                backgroundColor: Colors.redAccent,
                duration: Duration(seconds: 2),
              ),
            );
          } else {
            setState(() {
              selectedSeason = seasonName;
            });
            Navigator.pop(context);
          }
        },
      ),
    );
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
              padding: const EdgeInsets.fromLTRB(14.0, 22.0, 14.0, 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios, color: Colors.amber, size: 18),
                        onPressed: () => Navigator.pop(context),
                        constraints: const BoxConstraints(),
                        padding: EdgeInsets.zero,
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'CLASSEMENT (FRANCE)',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(width: 8),
                        SizedBox(
                          width: 22,
                          height: 15,
                          child: Image.asset(
                            'assets/images/img_flag_france.png',
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => Container(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: GestureDetector(
                      onTap: () => _showSeasonPicker(context),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              selectedSeason,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Icon(Icons.arrow_drop_down, color: Colors.black, size: 16),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildTabButton('Joueurs', true),
                      const SizedBox(width: 8),
                      _buildTabButton('Entraîneurs', false),
                      const SizedBox(width: 8),
                      _buildTabButton('Clubs', false),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        _buildPlayerRow(context, '1', 'Kylian Mbappé', 'Real Madrid', '250 Points', 'assets/images/img_player_mbappe.png', 'assets/images/img_flag_france.png'),
                        _buildPlayerRow(context, '2', 'Michael Olise', 'FC Bayern Munich', '235 Points', 'assets/images/img_player_olise.png', 'assets/images/img_flag_france.png'),
                        _buildPlayerRow(context, '3', 'Ousmane Dembélé', 'PSG', '195 Points', 'assets/images/img_player_dembele.png', 'assets/images/img_flag_france.png'),
                        _buildPlayerRow(context, '4', 'Dayot Upamecano', 'FC Bayern Munich', '180 Points', 'assets/images/img_player_upamecano.png', 'assets/images/img_flag_france.png'),
                        _buildPlayerRow(context, '5', 'Lucas Digne', 'PSG', '178 Points', 'assets/images/img_player_digne.png', 'assets/images/img_flag_france.png'),
                        _buildPlayerRow(context, '6', 'Désiré Doué', 'PSG', '172 Points', 'assets/images/img_player_doue.png', 'assets/images/img_flag_france.png'),
                        _buildPlayerRow(context, '7', 'Rayan Cherki', 'Manchester City', '165 Points', 'assets/images/img_player_cherki.png', 'assets/images/img_flag_france.png'),
                        _buildPlayerRow(context, '8', 'Aurélien Tchouaméni', 'Real Madrid', '160 Points', 'assets/images/img_player_tchouameni.png', 'assets/images/img_flag_france.png'),
                        _buildPlayerRow(context, '9', 'Mike Maignan', 'AC Milan', '150 Points', 'assets/images/img_player_maignan.png', 'assets/images/img_flag_france.png'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
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
                        _buildNavButton(context, Icons.home, 'Accueil', false, () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const HomeScreen()),
                          );
                        }),
                        _buildNavButton(context, Icons.bar_chart, 'Classement', true, () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const LeaderboardScreen()),
                          );
                        }),
                        _buildNavButton(context, Icons.person, 'Profil', false, () {
                          Navigator.pushReplacement(
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

  Widget _buildTabButton(String title, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: isSelected ? Colors.amber[800] : const Color(0xFF161B22),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.black : Colors.grey,
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildPlayerRow(BuildContext context, String rank, String name, String team, String points, String imagePath, String flagPath) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF161B22),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[850]!, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          children: [
            SizedBox(
              width: 18,
              child: Text(
                rank,
                style: const TextStyle(
                  color: Colors.amber,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PlayerDetailScreen()),
                  );
                },
                child: Row(
                  children: [
                    Container(
                      width: 38,
                      height: 38,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.amber, width: 1.5),
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          imagePath,
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                          errorBuilder: (context, error, stackTrace) => const Icon(Icons.person, color: Colors.white, size: 18),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 11,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 2),
                          Text(
                            team,
                            style: const TextStyle(color: Colors.grey, fontSize: 9),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 22,
              height: 15,
              child: Image.asset(
                flagPath,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(color: Colors.blue),
              ),
            ),
            const SizedBox(width: 10),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  points,
                  style: const TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                  ),
                ),
                const SizedBox(width: 3),
                const Text('⭐', style: TextStyle(fontSize: 10)),
              ],
            ),
          ],
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