import 'package:flutter/material.dart';
import '../models/animal.dart';

class AnimalDetailView extends StatelessWidget {
  final Animal animal;

  const AnimalDetailView({super.key, required this.animal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(animal.nome),
        backgroundColor: Colors.teal[700],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagem do animal (substitua com animal.imagemUrl se existir)
            Container(
              height: 220,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.grey.shade300,
                image: animal.imagemUrl != null
                    ? DecorationImage(
                        image: NetworkImage(animal.imagemUrl!),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: animal.imagemUrl == null
                  ? const Icon(Icons.pets, size: 80, color: Colors.grey)
                  : null,
            ),
            const SizedBox(height: 20),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${animal.especie} - ${animal.raca}',
                      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Chip(
                          label: Text('Idade: ${animal.idade} anos'),
                          backgroundColor: Colors.teal.shade50,
                          avatar: const Icon(Icons.cake, color: Colors.teal),
                        ),
                        const SizedBox(width: 12),
                        Chip(
                          label: Text('Porte: ${animal.porte}'),
                          backgroundColor: Colors.teal.shade50,
                          avatar: const Icon(Icons.pets, color: Colors.teal),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      animal.descricao,
                      style: const TextStyle(fontSize: 16, height: 1.4),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.favorite_border),
                    label: const Text('Favoritar'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Adicionado aos favoritos')),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.chat),
                    label: const Text('Entrar em contato'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal[700],
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/mensagens');
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
