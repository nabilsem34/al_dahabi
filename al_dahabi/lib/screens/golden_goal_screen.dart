import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'leaderboard_screen.dart';
import 'profile_screen.dart';

class GoldenGoalScreen extends StatefulWidget {
  const GoldenGoalScreen({super.key});

  @override
  State<GoldenGoalScreen> createState() => _GoldenGoalScreenState();
}

class _GoldenGoalScreenState extends State<GoldenGoalScreen> {
  // Liste des buts avec les noms exacts de tes fichiers d'images
  final goals = [
    {
      'rank': 1,
      'player': 'YAN DIOMANDE',
      'team': 'Real Madrid VS Racing Santander',
      'votes': 5634,
      'flag': '🇨🇮',
      'image': 'assets/images/img_player_diomande_yan.png',
      'videoImage': 'assets/images/img_goal.png',
    },
    {
      'rank': 2,
      'player': 'LAMINE YAMAL',
      'team': 'FC Barcelone VS Getafe',
      'votes': 4634,
      'flag': '🇪🇸',
      'image': 'assets/images/img_player_yamal_lamine.png',
      'videoImage': 'assets/images/img_goal.png',
    },
    {
      'rank': 3,
      'player': 'ANIS HADJ MOUSSA',
      'team': 'Feyenoord VS Ajax',
      'votes': 4034,
      'flag': '🇩🇿',
      'image': 'assets/images/img_player_anis_hm.png',
      'videoImage': 'assets/images/img_goal.png',
    },
    {
      'rank': 4,
      'player': 'BELLINGHAM',
      'team': 'Real Madrid VS Racing Santander',
      'votes': 3034,
      'flag': '🏴󠁧󠁢󠁥󠁮󠁧󠁿',
      'image': 'assets/images/img_player_jude.png',
      'videoImage': 'assets/images/img_goal.png',
    },
  ];

  // Pop-up de confirmation de vote
  void _showVoteDialog(String playerName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF161B22),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
            side: BorderSide(color: Colors.amber.withOpacity(0.5), width: 1.2),
          ),
          content: Container(
            width: 300,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.how_to_vote, color: Colors.amber, size: 54),
                const SizedBox(height: 16),
                const Text(
                  'Merci pour votre vote !',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  'Votre vote pour $playerName a bien été pris en compte.',
                  style: const TextStyle(color: Colors.grey, fontSize: 13),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 42,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child: const Text('Fermer', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Pop-up vidéo rectangulaire spacieuse
  void _showVideoDialog(String matchTitle, String videoImagePath) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF161B22),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
            side: BorderSide(color: Colors.amber.withOpacity(0.5), width: 1.2),
          ),
          content: Container(
            width: 300,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Aperçu du But',
                      style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.white, size: 20),
                      onPressed: () => Navigator.pop(context),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Container(
                  height: 180,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: AssetImage(videoImagePath),
                      fit: BoxFit.cover,
                      onError: (exception, stackTrace) {},
                    ),
                  ),
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.6),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: const Icon(Icons.play_arrow, color: Colors.black, size: 36),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  matchTitle,
                  style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 42,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.play_circle_fill, size: 20),
                    label: const Text('Ouvrir sur YouTube', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[700],
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
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
              padding: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // En-tête
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios, color: Colors.amber, size: 18),
                        onPressed: () => Navigator.pop(context),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                      const Text(
                        'AL-DAHABI',
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.deepOrange[800],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          'Reste 2 jours',
                          style: TextStyle(color: Colors.white, fontSize: 9.5, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // Titre LE GOLDEN BUT
                  Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.deepOrange[700],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        'LE GOLDEN BUT',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Liste des buts
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: goals.length,
                      itemBuilder: (context, index) {
                        final goal = goals[index];
                        return Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: const Color(0xFF161B22),
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(color: Colors.grey[850]!, width: 1),
                          ),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // 1. Chiffre et votes centrés et en rouge
                                  SizedBox(
                                    width: 75,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          '${goal['rank']}',
                                          style: const TextStyle(
                                            color: Colors.amber,
                                            fontSize: 32,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          '${goal['votes']} votes',
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            color: Colors.redAccent,
                                            fontSize: 11.5,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 4),

                                  // 2. Cadre carré de la photo du joueur avec bouton Play au centre
                                  Expanded(
                                    child: Center(
                                      child: GestureDetector(
                                        onTap: () => _showVideoDialog(goal['team'] as String, goal['videoImage'] as String),
                                        child: Container(
                                          width: 110,
                                          height: 110,
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.circular(12),
                                            image: DecorationImage(
                                              image: AssetImage(goal['image'] as String),
                                              fit: BoxFit.cover,
                                              colorFilter: ColorFilter.mode(
                                                Colors.black.withOpacity(0.25),
                                                BlendMode.darken,
                                              ),
                                              onError: (exception, stackTrace) {},
                                            ),
                                            border: Border.all(color: Colors.amber.withOpacity(0.6), width: 1.2),
                                          ),
                                          child: Center(
                                            child: Container(
                                              padding: const EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                color: Colors.amber,
                                                shape: BoxShape.circle,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black.withOpacity(0.6),
                                                    blurRadius: 6,
                                                  ),
                                                ],
                                              ),
                                              child: const Icon(Icons.play_arrow, color: Colors.black, size: 22),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 4),

                                  // 3. Bouton "Votez ici" épuré à droite
                                  SizedBox(
                                    width: 75,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          'Votez ici',
                                          style: TextStyle(color: Colors.white70, fontSize: 10),
                                        ),
                                        const SizedBox(height: 4),
                                        InkWell(
                                          onTap: () => _showVoteDialog(goal['player'] as String),
                                          child: Container(
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              color: Colors.amber,
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            child: const Icon(Icons.touch_app, color: Colors.black, size: 24),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),

                              // Nom du joueur et équipe
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                                    decoration: BoxDecoration(
                                      color: Colors.amber,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Text(
                                      goal['player'] as String,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  Text(goal['flag'] as String, style: const TextStyle(fontSize: 13)),
                                ],
                              ),
                              const SizedBox(height: 3),
                              Text(
                                goal['team'] as String,
                                style: const TextStyle(color: Colors.grey, fontSize: 10),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 6),

                  // Barre de navigation
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