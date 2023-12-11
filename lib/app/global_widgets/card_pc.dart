import 'package:PresenceMonitor/app/global_widgets/status_pc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardPC extends StatefulWidget {
  final String studentName;
  final String studentRegistration;
  final String type;
  final DateTime publishedAt;
  final String pcName;
  final String pcStatus;

  const CardPC({
    Key? key,
    required this.studentName,
    required this.studentRegistration,
    required this.type,
    required this.publishedAt,
    required this.pcName,
    required this.pcStatus,
  }) : super(key: key);

  @override
  CardPCState createState() => CardPCState();
}

class CardPCState extends State<CardPC> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: Container(
        width: 800,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.pcName,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                StatusPC(status: widget.pcStatus),
              ],
            ),
            const SizedBox(height: 8.0),
            const Text(
              'ESTUDANTE:',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            Text(
              widget.studentName,
              style: const TextStyle(fontSize: 16.0),
            ),
             const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'MATRICULA:',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 58.0),
                Text(
                  'TIPO:',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  widget.studentRegistration,
                  style: const TextStyle(fontSize: 16.0),
                ),
                const SizedBox(width: 54.0),
                Text(
                  widget.type,
                  style: const TextStyle(fontSize: 16.0),
                ),
              ],
            ),
            const Text(
              'PUBLICADO EM:',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            Text(
              DateFormat('dd/MM/yyyy HH:mm:ss').format(widget.publishedAt),
              style: const TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
