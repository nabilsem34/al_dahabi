import 'package:flutter/material.dart';

class StandingScreen extends StatelessWidget {
  const StandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Utilisation de 'var' pour éviter les erreurs de chevrons
    var standings = [
      {'position': 1, 'team': 'Real Madrid', 'points': 75, 'played': 30},
      {'position': 2, 'team': 'FC Barcelone', 'points': 72, 'played': 30},
      {'position': 3, 'team': 'Atlético Madrid', 'points': 65, 'played': 30},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Classement - Al-Dahabi'),
        backgroundColor: Colors.green[700],
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: standings.length,
        itemBuilder: (context, index) {
          var teamData = standings[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green[100],
              child: Text('${teamData['position']}'),
            ),
            title: Text(
              teamData['team'].toString(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('Matchs joués : ${teamData['played']}'),
            trailing: Text(
              '${teamData['points']} pts',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.green,
              ),
            ),
          );
        },
      ),
    );
  }
}