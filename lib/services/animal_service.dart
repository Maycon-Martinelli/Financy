import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/animal.dart';

class AnimalService {
  final _db = FirebaseFirestore.instance;

  Future<void> adicionarAnimal(Animal animal) async {
    await _db.collection('animais').doc(animal.id).set(animal.toMap());
  }

  Future<List<Animal>> listarAnimais() async {
    final snapshot = await _db.collection('animais').get();
    return snapshot.docs
        .map((doc) => Animal.fromMap(doc.data()))
        .toList();
  }

  Future<void> atualizarStatus(String id, String novoStatus) async {
    await _db.collection('animais').doc(id).update({'status': novoStatus});
  }
}
