import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/mensagem.dart';
import '../services/mensagem_service.dart';

class MensagemView extends StatefulWidget {
  const MensagemView({super.key});

  @override
  State<MensagemView> createState() => _MensagemViewState();
}

class _MensagemViewState extends State<MensagemView> {
  final _mensagemService = MensagemService();
  final _mensagens = <Mensagem>[];
  final _controller = TextEditingController();

  final String _usuarioId = 'usuario_123'; // simulando usuário logado

  void _enviarMensagem() async {
    if (_controller.text.trim().isEmpty) return;

    final msg = Mensagem(
      id: DateTime.now().toIso8601String(),
      remetenteId: _usuarioId,
      destinatarioId: 'ong_456',
      animalId: 'animal_001',
      texto: _controller.text.trim(),
      dataEnvio: DateTime.now(),
    );

    await _mensagemService.enviarMensagem(msg);
    _controller.clear();
    setState(() {
      _mensagens.add(msg);
    });
  }

  @override
  void initState() {
    super.initState();
    _carregarMensagens();
  }

  void _carregarMensagens() async {
    final lista = await _mensagemService.listarMensagensPorUsuario(_usuarioId);
    setState(() {
      _mensagens.addAll(lista);
    });
  }

  String _formatarData(DateTime data) {
    return DateFormat('dd/MM/yyyy HH:mm').format(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mensagens'),
        centerTitle: true,
        backgroundColor: Colors.teal[700],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: _mensagens.length,
              itemBuilder: (context, index) {
                final msg = _mensagens[index];
                final souEu = msg.remetenteId == _usuarioId;

                return Align(
                  alignment: souEu ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
                    decoration: BoxDecoration(
                      color: souEu ? Colors.teal[300] : Colors.grey[300],
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(16),
                        topRight: const Radius.circular(16),
                        bottomLeft: souEu ? const Radius.circular(16) : const Radius.circular(0),
                        bottomRight: souEu ? const Radius.circular(0) : const Radius.circular(16),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          msg.texto,
                          style: TextStyle(
                            color: souEu ? Colors.white : Colors.black87,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          _formatarData(msg.dataEnvio),
                          style: TextStyle(
                            fontSize: 10,
                            color: souEu ? Colors.white70 : Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Digite uma mensagem...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                CircleAvatar(
                  backgroundColor: Colors.teal[700],
                  child: IconButton(
                    icon: const Icon(Icons.send, color: Colors.white),
                    onPressed: _enviarMensagem,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
