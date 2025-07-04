import '../models/mensagem.dart';
import '../services/mensagem_service.dart';

class MensagemController {
  final _mensagemService = MensagemService();

  Future<void> enviarMensagem(Mensagem mensagem) async {
    await _mensagemService.enviarMensagem(mensagem);
  }

  Future<List<Mensagem>> buscarMensagensDoUsuario(String usuarioId) async {
    return await _mensagemService.listarMensagensPorUsuario(usuarioId);
  }
}
