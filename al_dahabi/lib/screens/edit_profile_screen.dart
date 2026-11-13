import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'leaderboard_screen.dart';
import 'profile_screen.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  // Contrôleurs et FocusNodes pour gérer la sélection et le curseur clignotant
  late TextEditingController _nameController;
  late TextEditingController _countryController;
  late TextEditingController _dobController;
  late TextEditingController _clubController;
  late TextEditingController _playerController;
  late TextEditingController _coachController;

  late FocusNode _nameFocus;
  late FocusNode _countryFocus;
  late FocusNode _dobFocus;
  late FocusNode _clubFocus;
  late FocusNode _playerFocus;
  late FocusNode _coachFocus;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: 'NABIL SEM');
    _countryController = TextEditingController(text: 'Algérie');
    _dobController = TextEditingController(text: '08/10/1988');
    _clubController = TextEditingController(text: 'Real Madrid');
    _playerController = TextEditingController(text: 'Cristiano Ronaldo');
    _coachController = TextEditingController(text: 'José Mourinho');

    _nameFocus = FocusNode();
    _countryFocus = FocusNode();
    _dobFocus = FocusNode();
    _clubFocus = FocusNode();
    _playerFocus = FocusNode();
    _coachFocus = FocusNode();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _countryController.dispose();
    _dobController.dispose();
    _clubController.dispose();
    _playerController.dispose();
    _coachController.dispose();

    _nameFocus.dispose();
    _countryFocus.dispose();
    _dobFocus.dispose();
    _clubFocus.dispose();
    _playerFocus.dispose();
    _coachFocus.dispose();
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
              padding: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1. En-tête : Logo AL-DAHABI et bouton retour
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

                  // 2. Contenu principal avec défilement (légèrement redescendu)
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Column(
                          children: [
                            const SizedBox(height: 12),
                            // Avatar utilisateur et bouton "Changer la photo"
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
                                          border: Border.all(color: Colors.amber, width: 2),
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
                                    'Changer la photo',
                                    style: TextStyle(
                                      color: Colors.amber,
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 24),

                            // Champs modifiables avec focus activé sur le champ et sur le crayon
                            _buildEditableField('Nom d\'utilisateur', _nameController, _nameFocus),
                            const SizedBox(height: 14),
                            _buildEditableField('Pays de naissance', _countryController, _countryFocus),
                            const SizedBox(height: 14),
                            _buildEditableField('Date de naissance', _dobController, _dobFocus),
                            const SizedBox(height: 14),
                            _buildEditableField('Club de cœur', _clubController, _clubFocus),
                            const SizedBox(height: 14),
                            _buildEditableField('Joueur préféré', _playerController, _playerFocus),
                            const SizedBox(height: 14),
                            _buildEditableField('Entraîneur préféré', _coachController, _coachFocus),
                            const SizedBox(height: 28),

                            // Bouton Enregistrer
                            SizedBox(
                              width: double.infinity,
                              height: 46,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.amber,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  'Enregistrer',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // 3. Barre de navigation en bas (inchangée)
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
                        _buildNavButton(context, Icons.person, 'Profil', true, () {
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

  // Widget avec liaison directe du focus sur le TextField et sur l'icône du crayon
  Widget _buildEditableField(String label, TextEditingController controller, FocusNode focusNode) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFFD4AF37),
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        GestureDetector(
          onTap: () {
            // Donne le focus et affiche le curseur clignotant dès qu'on clique sur la boîte
            focusNode.requestFocus();
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
            decoration: BoxDecoration(
              color: const Color(0xFF161B22),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey[850]!, width: 1),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    focusNode: focusNode,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                    ),
                  ),
                ),
                // En cliquant sur le crayon, le curseur s'active directement
                GestureDetector(
                  onTap: () {
                    focusNode.requestFocus();
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Icon(Icons.edit, color: Colors.grey, size: 16),
                  ),
                ),
              ],
            ),
          ),
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