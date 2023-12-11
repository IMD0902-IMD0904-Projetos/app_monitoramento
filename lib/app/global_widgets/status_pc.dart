import 'package:flutter/material.dart';

class StatusPC extends StatelessWidget {
  final String status;
  static const Color verde = Color(0xFF00C853); // Verde
  static const Color verdeEscuro = Color(0xFF00796B); // Verde Escuro
  static const Color azul = Color(0xFF2196F3); // Azul
  static const Color azulEscuro = Color(0xFF1565C0); // Azul Escuro
  static const Color vermelho = Color(0xFFE53935); // Vermelho
  static const Color vermelhoEscuro = Color(0xFFB71C1C); // Vermelho Escuro

  const StatusPC({
    Key? key,
    required this.status,
  }) : super(key: key);

  getStatusColor() {
    Color color = const Color.fromARGB(226, 0, 0, 0);
    if (status == 'DISPONIVEL') {
      color = verde;
    } else if (status == 'OCUPADA') {
      color = azul;
    } else if (status == 'MANUTENCAO') {
      color = vermelho;
    }
    return color;
  }

  getStatusText() {
    String statusText = 'INDISPONÍVEL';
    if (status == 'DISPONIVEL') {
      statusText = 'DISPONÍVEL';
    } else if (status == 'OCUPADA') {
      statusText = 'OCUPADA';
    } else if (status == 'MANUTENCAO') {
      statusText = 'MANUTENÇÃO';
    }
    return statusText;
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      getStatusText(),
      style: TextStyle(
          fontSize: 16.0, fontWeight: FontWeight.bold, color: getStatusColor()),
    );
  }
}
