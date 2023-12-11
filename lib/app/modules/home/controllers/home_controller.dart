import 'dart:async';

import 'package:PresenceMonitor/app/data/models/pc_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:PresenceMonitor/app/data/models/adafruit_get.dart';
import 'package:PresenceMonitor/app/data/providers/rfid_API.dart';
import 'package:PresenceMonitor/app/modules/home/views/dashboard_view.dart';
import 'package:PresenceMonitor/app/modules/home/views/settings_view.dart';

class HomeController extends GetxController {
  // bottom nav current index.
  final RxInt _currentIndex = 0.obs;
  get currentIndex => _currentIndex.value;
  final RxBool _updateCard = false.obs;
  get updateCard => _updateCard.value;

  // userData
  String userName = 'Lucas';
  bool isMale = true;

  List<Student> students = [
    Student(
        id: 1,
        name: 'Lucas Vinícius Góis Nogueira',
        registration: '20210076805'),
    Student(
        id: 2,
        name: 'Lourrayni Feliph Querino de Araujo Dantas',
        registration: '20230032693'),
    Student(id: 3, name: 'Pedro Lucas Góis Costa', registration: '20210056750')
  ];

  // List of room data
  List<WorkStation> workStations = [
    WorkStation(
        id: 1,
        name: 'PC-201-01',
        status: 'DISPONIVEL',
        type: 'SAIDA',
        student: Student(
            id: 3, name: 'Pedro Lucas Góis Costa', registration: '20210056750'),
        updatedAt: DateTime.now()),
    WorkStation(
        id: 2,
        name: 'PC-201-02',
        status: 'OCUPADA',
        type: 'ENTRADA',
        student: Student(
            id: 2,
            name: 'Lourrayni Feliph Querino de Araujo Dantas',
            registration: '20230032693'),
        updatedAt: DateTime.now()),
    WorkStation(
        id: 3,
        name: 'PC-201-03',
        status: 'MANUTENCAO',
        type: '',
        student: Student(id: 0, name: '', registration: ''),
        updatedAt: DateTime.now()),
    WorkStation(
        id: 4,
        name: 'PC-201-04',
        status: 'INDISPONIVEL',
        type: '',
        student: Student(id: 0, name: '', registration: ''),
        updatedAt: DateTime.now()),
  ];

  // the list of screens switched by bottom navBar
  final List<Widget> homeViews = [
    const DashboardView(),
    const SettingsView(),
  ];

  // funtion to set current index
  setCurrentIndex(int index) {
    _currentIndex.value = index;
  }

  updateCardValues() {
    _updateCard.value = !_updateCard.value;
  }

  // function to return correct view on bottom navBar switch
  Widget navBarSwitcher() {
    return homeViews.elementAt(currentIndex);
  }

  // function to retreve sensor data
  obterUltimasMensagensAdafruit() async {
    AdafruitGETAcesso novoAcesso = await AdafruitAPI.getUltimoAcesso();
    AdafruitGETEstado novoEstado = await AdafruitAPI.getUltimoEstado();
    processarUltimoAcesso(novoAcesso.acesso!);
    processarUltimoEstado(novoEstado.estacao!);
    updateCardValues();
  }

  processarUltimoAcesso(Acesso acesso) {
    int idEstacao = acesso.idEstacao ?? -1;
    if (idEstacao != -1) {
      if (acesso.tipo != null) {
        workStations[idEstacao - 1].type = acesso.tipo!;
      }
      if (acesso.idAluno != null) {
        workStations[idEstacao - 1].student = students[acesso.idAluno! - 1];
        workStations[idEstacao - 1].updatedAt = acesso.updatedAt!;
      }
    }
  }

  processarUltimoEstado(EstacaoEstado estacaoEstado) {
    int idEstacaoEstado = estacaoEstado.id ?? -1;
    if (idEstacaoEstado != -1) {
      if (estacaoEstado.estado != null) {
        workStations[idEstacaoEstado - 1].status = estacaoEstado.estado!;
      }
    }
  }

  iniciarStream() {
    Timer.periodic(
      const Duration(seconds: 3),
      (_) {
        obterUltimasMensagensAdafruit();
      },
    );
  }

  @override
  void onInit() {
    iniciarStream();
    super.onInit();
  }
}
