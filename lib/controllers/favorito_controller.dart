import '../models/favorito.dart';
import '../services/favorito_service.dart';

class FavoritoController {
  final _favoritoService = FavoritoService();

  Future<void> favoritar(Favorito favorito) async {
    await _favoritoService.favoritar(favorito);
  }

  Future<void> desfavoritar(String usuarioId, String animalId) async {
    await _favoritoService.desfavoritar(usuarioId, animalId);
  }

  Future<List<String>> buscarFavoritos(String usuarioId) async {
    return await _favoritoService.listarFavoritosPorUsuario(usuarioId);
  }
}
