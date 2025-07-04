import '../models/favorito.dart';

class FavoritoService {
  final List<Favorito> _favoritos = [];

  Future<void> favoritar(Favorito favorito) async {
    await Future.delayed(const Duration(milliseconds: 500));
    _favoritos.add(favorito);
  }

  Future<void> desfavoritar(String usuarioId, String animalId) async {
    _favoritos.removeWhere((f) =>
      f.usuarioId == usuarioId && f.animalId == animalId);
  }

  Future<List<String>> listarFavoritosPorUsuario(String usuarioId) async {
    return _favoritos
        .where((f) => f.usuarioId == usuarioId)
        .map((f) => f.animalId)
        .toList();
  }
}
