import '../models/animal.dart';
import '../services/animal_service.dart';

class AnimalController {
  final _animalService = AnimalService();

  Future<List<Animal>> listarAnimais() async {
    return await _animalService.listarAnimais();
  }

  Future<void> adicionarAnimal(Animal animal) async {
    await _animalService.adicionarAnimal(animal);
  }

  Future<void> atualizarStatus(String id, String novoStatus) async {
    await _animalService.atualizarStatus(id, novoStatus);
  }
}
