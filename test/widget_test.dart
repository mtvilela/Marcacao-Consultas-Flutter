// Smoke test da tela inicial do Sistema de Marcação de Consultas.
//
// O template do Flutter testava o app contador (MyApp). Como o main.dart
// passou a iniciar MarcacaoConsultasApp e apontar para a HomeScreen,
// o teste acompanha essa mudança.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:marcacao_consultas_flutter/main.dart';

void main() {
  testWidgets('Home inicial mostra o título do sistema', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MarcacaoConsultasApp());

    expect(find.text('Sistema de Consultas'), findsOneWidget);
    expect(find.byType(Scaffold), findsOneWidget);
  });
}
