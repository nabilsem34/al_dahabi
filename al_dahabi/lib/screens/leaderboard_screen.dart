import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'profile_screen.dart';
import 'player_detail_screen.dart';
import 'leaderboard_country_screen.dart';
import 'goalkeeper_detail_screen.dart';

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({super.key});

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  String selectedSeason = 'Saison 2026/2027';
  String selectedMainTab = 'Joueurs'; // 'Joueurs', 'Entraîneurs', 'Clubs'
  String selectedFilter = 'Tous'; // 'Tous', 'Gardiens', 'Défenseurs', etc.

  List getItems() {
    if (selectedMainTab == 'Entraîneurs') {
      return [
        {'rank': '1', 'name': 'Zinédine Zidane', 'team': 'Équipe de France', 'points': '250 Points', 'image': 'assets/images/img_coach_zidane.png', 'flag': 'assets/images/img_flag_france.png'},
        {'rank': '2', 'name': 'Luis de la Fuente', 'team': 'Espagne', 'points': '240 Points', 'image': 'assets/images/img_coach_luis_de_la_fuente.png', 'flag': 'assets/images/img_flag_spain.png'},
        {'rank': '3', 'name': 'Michael Carrick', 'team': 'Manchester United', 'points': '238 Points', 'image': 'assets/images/img_coach_carrick.png', 'flag': 'assets/images/img_flag_england.png'},
        {'rank': '4', 'name': 'Luis Enrique', 'team': 'PSG', 'points': '235 Points', 'image': 'assets/images/img_coach_luis_enrique.png', 'flag': 'assets/images/img_flag_spain.png'},
        {'rank': '5', 'name': 'Lionel Scaloni', 'team': 'Argentine', 'points': '232 Points', 'image': 'assets/images/img_coach_scaloni.png', 'flag': 'assets/images/img_flag_argentina.png'},
        {'rank': '6', 'name': 'Mikel Arteta', 'team': 'Arsenal', 'points': '230 Points', 'image': 'assets/images/img_coach_arteta.png', 'flag': 'assets/images/img_flag_spain.png'},
        {'rank': '7', 'name': 'Hansi Flick', 'team': 'FC Barcelone', 'points': '220 Points', 'image': 'assets/images/img_coach_flick.png', 'flag': 'assets/images/img_flag_germany.png'},
        {'rank': '8', 'name': 'José Mourinho', 'team': 'Real Madrid', 'points': '200 Points', 'image': 'assets/images/img_coach_mourinho.png', 'flag': 'assets/images/img_flag_portugal.png'},
        {'rank': '9', 'name': 'Carlo Ancelotti', 'team': 'Sélection Brésil', 'points': '190 Points', 'image': 'assets/images/img_coach_ancelotti.png', 'flag': 'assets/images/img_flag_brazil.png'},
        {'rank': '10', 'name': 'Pep Guardiola', 'team': 'Sans club', 'points': '180 Points', 'image': 'assets/images/img_coach_guardiola.png', 'flag': 'assets/images/img_flag_spain.png'},
      ];
    } else if (selectedMainTab == 'Clubs') {
      return [
        {'rank': '1', 'name': 'Real Madrid', 'j': '12', 'v': '10', 'n': '1', 'd': '1', 'bp': '38', 'bc': '12', 'diff': '+26', 'pts': '31', 'image': 'assets/images/img_club_real_madrid.png'},
        {'rank': '2', 'name': 'AC Milan', 'j': '12', 'v': '8', 'n': '2', 'd': '2', 'bp': '24', 'bc': '14', 'diff': '+10', 'pts': '26', 'image': 'assets/images/img_club_ac_milan.png'},
        {'rank': '3', 'name': 'Arsenal', 'j': '12', 'v': '7', 'n': '3', 'd': '2', 'bp': '22', 'bc': '13', 'diff': '+9', 'pts': '24', 'image': 'assets/images/img_club_arsenal.png'},
        {'rank': '4', 'name': 'Leverkusen', 'j': '12', 'v': '7', 'n': '1', 'd': '2', 'bp': '22', 'bc': '13', 'diff': '+13', 'pts': '24', 'image': 'assets/images/img_club_leverkusen.png'},
        {'rank': '5', 'name': 'Dortmund', 'j': '12', 'v': '6', 'n': '0', 'd': '2', 'bp': '24', 'bc': '17', 'diff': '+9', 'pts': '23', 'image': 'assets/images/img_club_dortmund.png'},
        {'rank': '6', 'name': 'Bayern Munich', 'j': '12', 'v': '5', 'n': '3', 'd': '2', 'bp': '20', 'bc': '14', 'diff': '+2', 'pts': '23', 'image': 'assets/images/img_club_bayern.png'},
        {'rank': '7', 'name': 'Inter Milan', 'j': '12', 'v': '4', 'n': '3', 'd': '4', 'bp': '23', 'bc': '15', 'diff': '-3', 'pts': '20', 'image': 'assets/images/img_club_inter.png'},
        {'rank': '8', 'name': 'Schalke 04', 'j': '12', 'v': '4', 'n': '3', 'd': '4', 'bp': '21', 'bc': '16', 'diff': '-4', 'pts': '18', 'image': 'assets/images/img_club_schalke.png'},
        {'rank': '9', 'name': 'Liverpool', 'j': '12', 'v': '3', 'n': '3', 'd': '4', 'bp': '20', 'bc': '27', 'diff': '-10', 'pts': '16', 'image': 'assets/images/img_club_liverpool.png'},
        {'rank': '10', 'name': 'Atlético de Madrid', 'j': '12', 'v': '4', 'n': '3', 'd': '7', 'bp': '20', 'bc': '23', 'diff': '+3', 'pts': '13', 'image': 'assets/images/img_club_atletico.png'},
        {'rank': '11', 'name': 'Chelsea', 'j': '12', 'v': '3', 'n': '4', 'd': '5', 'bp': '15', 'bc': '18', 'diff': '-3', 'pts': '13', 'image': 'assets/images/img_club_chelsea.png'},
        {'rank': '12', 'name': 'FC Barcelone', 'j': '12', 'v': '3', 'n': '3', 'd': '6', 'bp': '14', 'bc': '18', 'diff': '-4', 'pts': '12', 'image': 'assets/images/img_club_barcelona.png'},
        {'rank': '13', 'name': 'Galatasaray', 'j': '12', 'v': '3', 'n': '3', 'd': '6', 'bp': '13', 'bc': '19', 'diff': '-6', 'pts': '12', 'image': 'assets/images/img_club_galatasaray.png'},
        {'rank': '14', 'name': 'Man United', 'j': '12', 'v': '3', 'n': '3', 'd': '6', 'bp': '10', 'bc': '16', 'diff': '-6', 'pts': '12', 'image': 'assets/images/img_club_man_utd.png'},
        {'rank': '15', 'name': 'FC Porto', 'j': '12', 'v': '3', 'n': '3', 'd': '6', 'bp': '12', 'bc': '20', 'diff': '-8', 'pts': '12', 'image': 'assets/images/img_club_porto.png'},
        {'rank': '16', 'name': 'PSG', 'j': '12', 'v': '3', 'n': '3', 'd': '6', 'bp': '14', 'bc': '24', 'diff': '-10', 'pts': '12', 'image': 'assets/images/img_club_psg.png'},
        {'rank': '17', 'name': 'FC Seville', 'j': '12', 'v': '3', 'n': '2', 'd': '7', 'bp': '12', 'bc': '21', 'diff': '-9', 'pts': '11', 'image': 'assets/images/img_club_seville.png'},
        {'rank': '18', 'name': 'Man City', 'j': '12', 'v': '4', 'n': '2', 'd': '5', 'bp': '18', 'bc': '23', 'diff': '-15', 'pts': '12', 'image': 'assets/images/img_club_man_city.png'},
        {'rank': '19', 'name': 'Al-Nassr', 'j': '12', 'v': '3', 'n': '1', 'd': '6', 'bp': '17', 'bc': '26', 'diff': '-27', 'pts': '11', 'image': 'assets/images/img_club_al_nassr.png'},
        {'rank': '20', 'name': 'Marseille', 'j': '12', 'v': '1', 'n': '1', 'd': '3', 'bp': '16', 'bc': '28', 'diff': '-24', 'pts': '9', 'image': 'assets/images/img_club_marseille.png'},
      ];
    } else {
      // Onglet 'Joueurs'
      if (selectedFilter == 'Gardiens') {
        return [
          {'rank': '1', 'name': 'Thibaut Courtois', 'team': 'Real Madrid', 'points': '112 Points', 'image': 'assets/images/img_player_courtois.png', 'flag': 'assets/images/img_flag_belgium.png'},
          {'rank': '2', 'name': 'Joan Garcia', 'team': 'FC Barcelone', 'points': '110 Points', 'image': 'assets/images/img_player_joan_garcia.png', 'flag': 'assets/images/img_flag_spain.png'},
          {'rank': '3', 'name': 'Jordan Pickford', 'team': 'Everton', 'points': '105 Points', 'image': 'assets/images/img_player_pickford.png', 'flag': 'assets/images/img_flag_england.png'},
          {'rank': '4', 'name': 'Mike Maignan', 'team': 'AC Milan', 'points': '102 Points', 'image': 'assets/images/img_player_maignan.png', 'flag': 'assets/images/img_flag_france.png'},
          {'rank': '5', 'name': 'Emiliano Martínez', 'team': 'Chelsea FC', 'points': '100 Points', 'image': 'assets/images/img_player_martinez.png', 'flag': 'assets/images/img_flag_argentina.png'},
          {'rank': '6', 'name': 'Dean Henderson', 'team': 'Crystal Palace', 'points': '94 Points', 'image': 'assets/images/img_player_henderson.png', 'flag': 'assets/images/img_flag_england.png'},
          {'rank': '7', 'name': 'Alisson Becker', 'team': 'Liverpool', 'points': '90 Points', 'image': 'assets/images/img_player_alisson.png', 'flag': 'assets/images/img_flag_brazil.png'},
          {'rank': '8', 'name': 'Diogo Costa', 'team': 'FC Porto', 'points': '83 Points', 'image': 'assets/images/img_player_diogo_costa.png', 'flag': 'assets/images/img_flag_portugal.png'},
          {'rank': '9', 'name': 'Jan Oblak', 'team': 'Atlético de Madrid', 'points': '80 Points', 'image': 'assets/images/img_player_oblak.png', 'flag': 'assets/images/img_flag_slovenia.png'},
        ];
      } else if (selectedFilter == 'Défenseurs') {
        return [
          {'rank': '1', 'name': 'Dayot Upamecano', 'team': 'FC Bayern Munich', 'points': '180 Points', 'image': 'assets/images/img_player_upamecano.png', 'flag': 'assets/images/img_flag_france.png'},
          {'rank': '2', 'name': 'Pau Cubarsí', 'team': 'FC Barcelone', 'points': '175 Points', 'image': 'assets/images/img_player_pau_cubarsi.png', 'flag': 'assets/images/img_flag_spain.png'},
          {'rank': '3', 'name': 'Ezri Konsa', 'team': 'Arsenal', 'points': '170 Points', 'image': 'assets/images/img_player_ezri_konsa.png', 'flag': 'assets/images/img_flag_england.png'},
          {'rank': '4', 'name': 'Ibrahima Konaté', 'team': 'Real Madrid', 'points': '165 Points', 'image': 'assets/images/img_player_konate.png', 'flag': 'assets/images/img_flag_france.png'},
          {'rank': '5', 'name': 'Cristian Romero', 'team': 'Atlético de Madrid', 'points': '160 Points', 'image': 'assets/images/img_player_romero.png', 'flag': 'assets/images/img_flag_argentina.png'},
          {'rank': '6', 'name': 'Harry Maguire', 'team': 'Manchester United', 'points': '150 Points', 'image': 'assets/images/img_player_maguire.png', 'flag': 'assets/images/img_flag_england.png'},
          {'rank': '7', 'name': 'Marquinhos', 'team': 'PSG', 'points': '145 Points', 'image': 'assets/images/img_player_marquinhos.png', 'flag': 'assets/images/img_flag_brazil.png'},
          {'rank': '8', 'name': 'Rúben Dias', 'team': 'Manchester City', 'points': '140 Points', 'image': 'assets/images/img_player_dias.png', 'flag': 'assets/images/img_flag_portugal.png'},
          {'rank': '9', 'name': 'Álex Grimaldo', 'team': 'Atlético de Madrid', 'points': '135 Points', 'image': 'assets/images/img_player_grimaldo.png', 'flag': 'assets/images/img_flag_spain.png'},
        ];
      } else if (selectedFilter == 'Milieux') {
        return [
          {'rank': '1', 'name': 'Jude Bellingham', 'team': 'Real Madrid', 'points': '230 Points', 'image': 'assets/images/img_player_bellingham.png', 'flag': 'assets/images/img_flag_england.png'},
          {'rank': '2', 'name': 'Pedri', 'team': 'FC Barcelone', 'points': '190 Points', 'image': 'assets/images/img_player_pedri.png', 'flag': 'assets/images/img_flag_spain.png'},
          {'rank': '3', 'name': 'Declan Rice', 'team': 'Arsenal', 'points': '185 Points', 'image': 'assets/images/img_player_declan_rice.png', 'flag': 'assets/images/img_flag_england.png'},
          {'rank': '4', 'name': 'Aurélien Tchouaméni', 'team': 'Real Madrid', 'points': '180 Points', 'image': 'assets/images/img_player_tchouameni.png', 'flag': 'assets/images/img_flag_france.png'},
          {'rank': '5', 'name': 'Enzo Fernández', 'team': 'Manchester City', 'points': '150 Points', 'image': 'assets/images/img_player_enzo_fernandez.png', 'flag': 'assets/images/img_flag_argentina.png'},
          {'rank': '6', 'name': 'Elliott Anderson', 'team': 'Manchester City', 'points': '140 Points', 'image': 'assets/images/img_player_elliott_anderson.png', 'flag': 'assets/images/img_flag_england.png'},
          {'rank': '7', 'name': 'Casemiro', 'team': 'Inter Miami', 'points': '130 Points', 'image': 'assets/images/img_player_casemiro.png', 'flag': 'assets/images/img_flag_brazil.png'},
          {'rank': '8', 'name': 'Bruno Fernandes', 'team': 'Manchester United', 'points': '120 Points', 'image': 'assets/images/img_player_bruno_fernandes.png', 'flag': 'assets/images/img_flag_portugal.png'},
          {'rank': '9', 'name': 'Dominik Szoboszlai', 'team': 'Liverpool', 'points': '115 Points', 'image': 'assets/images/img_player_szoboszlai.png', 'flag': 'assets/images/img_flag_hungary.png'},
        ];
      } else if (selectedFilter == 'Attaquants') {
        return [
          {'rank': '1', 'name': 'Kylian Mbappé', 'team': 'Real Madrid', 'points': '250 Points', 'image': 'assets/images/img_player_mbappe.png', 'flag': 'assets/images/img_flag_france.png'},
          {'rank': '2', 'name': 'Lamine Yamal', 'team': 'FC Barcelone', 'points': '240 Points', 'image': 'assets/images/img_player_yamal.png', 'flag': 'assets/images/img_flag_spain.png'},
          {'rank': '3', 'name': 'Harry Kane', 'team': 'FC Bayern Munich', 'points': '238 Points', 'image': 'assets/images/img_player_kane.png', 'flag': 'assets/images/img_flag_england.png'},
          {'rank': '4', 'name': 'Michael Olise', 'team': 'FC Bayern Munich', 'points': '235 Points', 'image': 'assets/images/img_player_olise.png', 'flag': 'assets/images/img_flag_france.png'},
          {'rank': '5', 'name': 'Lionel Messi', 'team': 'Inter Miami', 'points': '232 Points', 'image': 'assets/images/img_player_messi.png', 'flag': 'assets/images/img_flag_argentina.png'},
          {'rank': '6', 'name': 'Vinícius Júnior', 'team': 'Real Madrid', 'points': '220 Points', 'image': 'assets/images/img_player_vinicius.png', 'flag': 'assets/images/img_flag_brazil.png'},
          {'rank': '7', 'name': 'Cristiano Ronaldo', 'team': 'Al Nassr FC', 'points': '200 Points', 'image': 'assets/images/img_player_cristiano.png', 'flag': 'assets/images/img_flag_portugal.png'},
          {'rank': '8', 'name': 'Joao Félix', 'team': 'Al Nassr', 'points': '140 Points', 'image': 'assets/images/img_player_joao_felix.png', 'flag': 'assets/images/img_flag_portugal.png'},
          {'rank': '9', 'name': 'Julián Álvarez', 'team': 'Atlético de Madrid', 'points': '130 Points', 'image': 'assets/images/img_player_alvarez.png', 'flag': 'assets/images/img_flag_argentina.png'},
        ];
      } else {
        // Tous (Joueurs)
        return [
          {'rank': '1', 'name': 'Kylian Mbappé', 'team': 'Real Madrid', 'points': '250 Points', 'image': 'assets/images/img_player_mbappe.png', 'flag': 'assets/images/img_flag_france.png'},
          {'rank': '2', 'name': 'Lamine Yamal', 'team': 'FC Barcelone', 'points': '240 Points', 'image': 'assets/images/img_player_yamal.png', 'flag': 'assets/images/img_flag_spain.png'},
          {'rank': '3', 'name': 'Harry Kane', 'team': 'FC Bayern Munich', 'points': '238 Points', 'image': 'assets/images/img_player_kane.png', 'flag': 'assets/images/img_flag_england.png'},
          {'rank': '4', 'name': 'Michael Olise', 'team': 'FC Bayern Munich', 'points': '235 Points', 'image': 'assets/images/img_player_olise.png', 'flag': 'assets/images/img_flag_france.png'},
          {'rank': '5', 'name': 'Lionel Messi', 'team': 'Inter Miami', 'points': '232 Points', 'image': 'assets/images/img_player_messi.png', 'flag': 'assets/images/img_flag_argentina.png'},
          {'rank': '6', 'name': 'Jude Bellingham', 'team': 'Real Madrid', 'points': '230 Points', 'image': 'assets/images/img_player_bellingham.png', 'flag': 'assets/images/img_flag_england.png'},
          {'rank': '7', 'name': 'Vinícius Júnior', 'team': 'Real Madrid', 'points': '220 Points', 'image': 'assets/images/img_player_vinicius.png', 'flag': 'assets/images/img_flag_brazil.png'},
          {'rank': '8', 'name': 'Cristiano Ronaldo', 'team': 'Al Nassr FC', 'points': '200 Points', 'image': 'assets/images/img_player_cristiano.png', 'flag': 'assets/images/img_flag_portugal.png'},
          {'rank': '9', 'name': 'Erling Haaland', 'team': 'Manchester City', 'points': '190 Points', 'image': 'assets/images/img_player_haaland.png', 'flag': 'assets/images/img_flag_norway.png'},
        ];
      }
    }
  }

  void _showSeasonPicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF161B22),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(color: Colors.grey, width: 1),
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
          color: selectedSeason == seasonName ? Colors.amber : Colors.grey.shade800,
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
    final items = getItems();

    return Scaffold(
      backgroundColor: const Color(0xFF030712),
      body: Center(
        child: Container(
          width: 420,
          height: 850,
          decoration: BoxDecoration(
            color: const Color(0xFF0B0F19),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Colors.grey.shade800, width: 1.5),
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
                  const SizedBox(height: 6),
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0),
                    child: const Text(
                      'CLASSEMENT GÉNÉRAL',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
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
                  const SizedBox(height: 10),
                  // Onglets principaux : Joueurs, Entraîneurs, Clubs
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildMainTab('Joueurs'),
                      const SizedBox(width: 8),
                      _buildMainTab('Entraîneurs'),
                      const SizedBox(width: 8),
                      _buildMainTab('Clubs'),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Sous-filtres (uniquement affichés si on est dans l'onglet Joueurs)
                  if (selectedMainTab == 'Joueurs')
                    Row(
                      children: [
                        Expanded(child: _buildFilterChip('Tous')),
                        const SizedBox(width: 4),
                        Expanded(child: _buildFilterChip('Gardiens')),
                        const SizedBox(width: 4),
                        Expanded(child: _buildFilterChip('Défenseurs')),
                        const SizedBox(width: 4),
                        Expanded(child: _buildFilterChip('Milieux')),
                        const SizedBox(width: 4),
                        Expanded(child: _buildFilterChip('Attaquants')),
                      ],
                    ),
                  // En-tête du tableau si on est sur l'onglet Clubs
                  if (selectedMainTab == 'Clubs')
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                      child: Row(
                        children: const [
                          SizedBox(width: 18, child: Text('POS', style: TextStyle(color: Colors.grey, fontSize: 9, fontWeight: FontWeight.bold))),
                          SizedBox(width: 8),
                          Expanded(flex: 3, child: Text('CLUB', style: TextStyle(color: Colors.grey, fontSize: 9, fontWeight: FontWeight.bold))),
                          SizedBox(width: 16, child: Text('J', style: TextStyle(color: Colors.grey, fontSize: 9, fontWeight: FontWeight.bold), textAlign: TextAlign.center)),
                          SizedBox(width: 16, child: Text('V', style: TextStyle(color: Colors.grey, fontSize: 9, fontWeight: FontWeight.bold), textAlign: TextAlign.center)),
                          SizedBox(width: 16, child: Text('N', style: TextStyle(color: Colors.grey, fontSize: 9, fontWeight: FontWeight.bold), textAlign: TextAlign.center)),
                          SizedBox(width: 16, child: Text('D', style: TextStyle(color: Colors.grey, fontSize: 9, fontWeight: FontWeight.bold), textAlign: TextAlign.center)),
                          SizedBox(width: 22, child: Text('BP', style: TextStyle(color: Colors.grey, fontSize: 9, fontWeight: FontWeight.bold), textAlign: TextAlign.center)),
                          SizedBox(width: 22, child: Text('BC', style: TextStyle(color: Colors.grey, fontSize: 9, fontWeight: FontWeight.bold), textAlign: TextAlign.center)),
                          SizedBox(width: 28, child: Text('DIFF', style: TextStyle(color: Colors.grey, fontSize: 9, fontWeight: FontWeight.bold), textAlign: TextAlign.center)),
                          SizedBox(width: 24, child: Text('PTS', style: TextStyle(color: Colors.grey, fontSize: 9, fontWeight: FontWeight.bold), textAlign: TextAlign.center)),
                        ],
                      ),
                    ),
                  const SizedBox(height: 6),
                  Expanded(
                    child: selectedMainTab == 'Clubs'
                        ? Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF161B22),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.grey.shade800, width: 1.5),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          itemCount: items.length,
                          separatorBuilder: (context, index) => Divider(
                            color: Colors.grey.shade800.withOpacity(0.6),
                            height: 1,
                            thickness: 1,
                            indent: 8,
                            endIndent: 8,
                          ),
                          itemBuilder: (context, index) {
                            final item = items[index];
                            return _buildClubRow(
                              context,
                              item['rank']!,
                              item['name']!,
                              item['j']!,
                              item['v']!,
                              item['n']!,
                              item['d']!,
                              item['bp']!,
                              item['bc']!,
                              item['diff']!,
                              item['pts']!,
                              item['image']!,
                            );
                          },
                        ),
                      ),
                    )
                        : ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final item = items[index];
                        return _buildItemRow(
                          context,
                          item['rank']!,
                          item['name']!,
                          item['team']!,
                          item['points']!,
                          item['image']!,
                          item['flag']!,
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xFF161B22),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade800, width: 1),
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
                        _buildNavButton(context, Icons.bar_chart, 'Classement', true, () {}),
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

  Widget _buildMainTab(String title) {
    final bool isSelected = selectedMainTab == title;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedMainTab = title;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? Colors.amber.shade800 : const Color(0xFF161B22),
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
      ),
    );
  }

  Widget _buildFilterChip(String label) {
    final bool isSelected = selectedFilter == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedFilter = label;
        });
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? Colors.red.shade800 : const Color(0xFF161B22),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade800, width: 1),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey,
            fontSize: 8.5,
            fontWeight: FontWeight.bold,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  Widget _buildClubRow(BuildContext context, String rank, String name, String j, String v, String n, String d, String bp, String bc, String diff, String pts, String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: Row(
        children: [
          SizedBox(
            width: 18,
            child: Text(
              rank,
              style: TextStyle(
                color: rank == '1' || rank == '2' || rank == '3' ? Colors.amber : Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 11,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Container(
                  width: 22,
                  height: 22,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey.shade700, width: 1),
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => const Icon(Icons.shield, color: Colors.white, size: 12),
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 16, child: Text(j, style: const TextStyle(color: Colors.white, fontSize: 9), textAlign: TextAlign.center)),
          SizedBox(width: 16, child: Text(v, style: const TextStyle(color: Colors.white, fontSize: 9), textAlign: TextAlign.center)),
          SizedBox(width: 16, child: Text(n, style: const TextStyle(color: Colors.white, fontSize: 9), textAlign: TextAlign.center)),
          SizedBox(width: 16, child: Text(d, style: const TextStyle(color: Colors.white, fontSize: 9), textAlign: TextAlign.center)),
          SizedBox(width: 22, child: Text(bp, style: const TextStyle(color: Colors.white, fontSize: 9), textAlign: TextAlign.center)),
          SizedBox(width: 22, child: Text(bc, style: const TextStyle(color: Colors.white, fontSize: 9), textAlign: TextAlign.center)),
          SizedBox(width: 28, child: Text(diff, style: const TextStyle(color: Colors.amber, fontSize: 9, fontWeight: FontWeight.bold), textAlign: TextAlign.center)),
          SizedBox(width: 24, child: Text(pts, style: const TextStyle(color: Colors.amber, fontSize: 10, fontWeight: FontWeight.bold), textAlign: TextAlign.center)),
        ],
      ),
    );
  }

  Widget _buildItemRow(BuildContext context, String rank, String name, String team, String points, String imagePath, String flagPath) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF161B22),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade800, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          children: [
            SizedBox(
              width: 18,
              child: Text(
                rank,
                style: TextStyle(
                  color: rank == '1' || rank == '2' || rank == '3' ? Colors.amber : Colors.white,
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
                  if (selectedMainTab == 'Entraîneurs') {
                    // Actions pour les entraîneurs si besoin
                  } else {
                    if (selectedFilter == 'Gardiens') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GoalkeeperDetailScreen(
                            playerName: name,
                            playerTeam: team,
                            playerPoints: points,
                            playerImage: imagePath,
                            playerFlag: flagPath,
                            playerRank: rank,
                          ),
                        ),
                      );
                    } else {
                      String pos = 'Attaquant';
                      if (selectedFilter == 'Milieux') {
                        pos = 'Milieu';
                      } else if (selectedFilter == 'Défenseurs') {
                        pos = 'Défenseur';
                      } else if (selectedFilter == 'Attaquants') {
                        pos = 'Attaquant';
                      }

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PlayerDetailScreen(
                            playerName: name,
                            playerTeam: team,
                            playerPoints: points,
                            playerImage: imagePath,
                            playerFlag: flagPath,
                            playerRank: rank,
                            playerPosition: pos,
                          ),
                        ),
                      );
                    }
                  }
                },
                child: Row(
                  children: [
                    Container(
                      width: 38,
                      height: 38,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: rank == '1' ? Colors.amber : Colors.grey.shade700, width: 1.5),
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          imagePath,
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                          filterQuality: FilterQuality.high,
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
            GestureDetector(
              onTap: () {
                if (flagPath.contains('flag_france')) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LeaderboardCountryScreen()),
                  );
                }
              },
              child: Container(
                padding: const EdgeInsets.all(4),
                child: SizedBox(
                  width: 22,
                  height: 15,
                  child: Image.asset(
                    flagPath,
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: Colors.grey,
                    ),
                  ),
                ),
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