import 'package:flutter/material.dart';

class MatchesScreen extends StatelessWidget {
  const MatchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Utilisation de 'var' pour éviter les erreurs de chevrons
    var matches = [
      {
        'teamA': 'Real Madrid',
        'teamB': 'FC Barcelone',
        'score': '2 - 1',
        'time': 'Terminé',
      },
      {
        'teamA': 'Manchester City',
        'teamB': 'Arsenal',
        'score': '1 - 1',
        'time': 'En cours',
      },
      {
        'teamA': 'Bayern Munich',
        'teamB': 'Borussia Dortmund',
        'score': '3 - 0',
        'time': 'A venir',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Matchs - Al-Dahabi'),
        backgroundColor: Colors.green[700],
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: matches.length,
        itemBuilder: (context, index) {
          var match = matches[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            elevation: 3,
            child: ListTile(
              leading: const Icon(Icons.sports_soccer, color: Colors.green),
              title: Text(
                '${match['teamA']} vs ${match['teamB']}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Statut : ${match['time']}'),
              trailing: Text(
                match['score']!,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}