import '../models/mensagem.dart';

class MensagemService {
  final List<Mensagem> _mensagens = [];

  Future<void> enviarMensagem(Mensagem mensagem) async {
    await Future.delayed(const Duration(milliseconds: 500));
    _mensagens.add(mensagem);
  }

  Future<List<Mensagem>> listarMensagensPorUsuario(String usuarioId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _mensagens.where((m) =>
      m.destinatarioId == usuarioId || m.remetenteId == usuarioId
    ).toList();
  }
}
