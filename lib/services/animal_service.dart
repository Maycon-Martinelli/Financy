import '../models/animal.dart';

class AnimalService {
  final List<Animal> _animais = [];

  Future<List<Animal>> listarAnimais() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _animais;
  }

  Future<void> adicionarAnimal(Animal animal) async {
    await Future.delayed(const Duration(milliseconds: 500));
    _animais.add(animal);
  }

  Future<void> atualizarStatus(String id, String novoStatus) async {
    final index = _animais.indexWhere((a) => a.id == id);
    if (index != -1) {
      _animais[index] = Animal(
        id: _animais[index].id,
        nome: _animais[index].nome,
        idade: _animais[index].idade,
        raca: _animais[index].raca,
        especie: _animais[index].especie,
        porte: _animais[index].porte,
        descricao: _animais[index].descricao,
        status: novoStatus,
        fotos: _animais[index].fotos,
        donoId: _animais[index].donoId,
      );
    }
  }
}
