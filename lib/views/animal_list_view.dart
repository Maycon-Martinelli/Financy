import 'package:flutter/material.dart';
import '../models/animal.dart';
import '../services/animal_service.dart';
import 'animal_detal_view.dart';

class AnimalListView extends StatefulWidget {
  const AnimalListView({super.key});

  @override
  State<AnimalListView> createState() => _AnimalListViewState();
}

class _AnimalListViewState extends State<AnimalListView> {
  final _animalService = AnimalService();
  List<Animal> _animais = [];

  @override
  void initState() {
    super.initState();
    _carregarAnimais();
  }

  void _carregarAnimais() async {
    final lista = await _animalService.listarAnimais();
    setState(() {
      _animais = lista;
    });
  }

  Color _getStatusColor(String status) {
    return status == 'disponivel' ? Colors.green : Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animais para Adoção'),
        centerTitle: true,
        backgroundColor: Colors.teal[700],
      ),
      body: _animais.isEmpty
          ? const Center(child: Text('Nenhum animal cadastrado ainda.'))
          : ListView.builder(
              itemCount: _animais.length,
              itemBuilder: (context, index) {
                final animal = _animais[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 3,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(12),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: animal.imagemUrl != null
                          ? Image.network(
                              animal.imagemUrl!,
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            )
                          : Container(
                              width: 60,
                              height: 60,
                              color: Colors.grey.shade300,
                              child: const Icon(Icons.pets, size: 32, color: Colors.grey),
                            ),
                    ),
                    title: Text(animal.nome, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('${animal.especie} • ${animal.raca}'),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.circle, size: 12, color: _getStatusColor(animal.status)),
                        const SizedBox(height: 4),
                        Text(
                          animal.status == 'disponivel' ? 'Disponível' : 'Adotado',
                          style: TextStyle(
                            fontSize: 12,
                            color: _getStatusColor(animal.status),
                          ),
                        ),
                      ],
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
              },
            ),
    );
  }
}
