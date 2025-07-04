import 'package:flutter/material.dart';
import '../models/animal.dart';
import '../views/animal_detal_view.dart';

class AnimalCard extends StatelessWidget {
  final Animal animal;

  const AnimalCard({super.key, required this.animal});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        title: Text(animal.nome),
        subtitle: Text('${animal.especie} • ${animal.raca}'),
        trailing: Text(
          animal.status,
          style: TextStyle(
            color: animal.status == 'adotado' ? Colors.red : Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AnimalDetailView(animal: animal),
            ),
          );
        },
      ),
    );
  }
}
