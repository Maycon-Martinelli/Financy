import 'package:flutter/material.dart';
import '../models/animal.dart';
import '../services/favorito_service.dart';
import '../services/animal_service.dart';
import 'animal_detal_view.dart';

class FavoritosView extends StatefulWidget {
  const FavoritosView({super.key});

  @override
  State<FavoritosView> createState() => _FavoritosViewState();
}

class _FavoritosViewState extends State<FavoritosView> {
  final _favoritoService = FavoritoService();
  final _animalService = AnimalService();

  List<Animal> _favoritos = [];

  @override
  void initState() {
    super.initState();
    _carregarFavoritos();
  }

  void _carregarFavoritos() async {
    final ids = await _favoritoService.listarFavoritosPorUsuario('usuario_123');
    final todosAnimais = await _animalService.listarAnimais();
    setState(() {
      _favoritos = todosAnimais.where((a) => ids.contains(a.id)).toList();
    });
  }

  Color _getStatusColor(String status) {
    return status == 'disponivel' ? Colors.green : Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Favoritos'),
        centerTitle: true,
        backgroundColor: Colors.teal[700],
      ),
      body: _favoritos.isEmpty
          ? const Center(
              child: Text(
                'Você ainda não adicionou nenhum animal aos favoritos.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            )
          : ListView.builder(
              itemCount: _favoritos.length,
              itemBuilder: (context, index) {
                final animal = _favoritos[index];
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
