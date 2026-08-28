// Testes do fluxo do Sistema de Marcação de Consultas.
//
// Cobrem o que a aula de 28/08 pede: o card renderiza a consulta,
// os botões só aparecem enquanto o status for agendada, e confirmar
// e cancelar trocam o status e a mensagem exibida.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:marcacao_consultas_flutter/main.dart';

void main() {
  testWidgets('mostra a consulta agendada com os dois botões', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MarcacaoConsultasApp());

    expect(find.text('Sistema de Consultas'), findsOneWidget);
    expect(find.text('AGENDADA'), findsOneWidget);

    expect(find.text('Carlos Andrade'), findsOneWidget);
    expect(find.text('123.456.789-00'), findsOneWidget);
    expect(find.text('Dr. Roberto Silva'), findsOneWidget);
    expect(find.text('CRM12345'), findsOneWidget);
    expect(find.text('Cardiologia'), findsOneWidget);
    expect(find.text('21/08/2026 às 14:30'), findsOneWidget);
    expect(find.text('R\$ 350,00'), findsOneWidget);
    expect(find.text('Consulta de rotina'), findsOneWidget);

    expect(find.widgetWithText(ElevatedButton, 'Confirmar'), findsOneWidget);
    expect(find.widgetWithText(ElevatedButton, 'Cancelar'), findsOneWidget);
  });

  testWidgets('confirmar troca o status e mostra a mensagem de sucesso', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MarcacaoConsultasApp());

    final confirmar = find.widgetWithText(ElevatedButton, 'Confirmar');
    // O card é mais alto que a viewport de teste (600px); por isso a Home
    // usa SingleChildScrollView. Rolamos até o botão antes de tocar.
    await tester.ensureVisible(confirmar);
    await tester.pumpAndSettle();
    await tester.tap(confirmar);
    await tester.pump();

    expect(find.text('CONFIRMADA'), findsOneWidget);
    expect(find.text('Consulta confirmada com sucesso!'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsNothing);
  });

  testWidgets('cancelar troca o status e mostra a mensagem de cancelamento', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MarcacaoConsultasApp());

    final cancelar = find.widgetWithText(ElevatedButton, 'Cancelar');
    await tester.ensureVisible(cancelar);
    await tester.pumpAndSettle();
    await tester.tap(cancelar);
    await tester.pump();

    expect(find.text('CANCELADA'), findsOneWidget);
    expect(find.text('Consulta cancelada'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsNothing);
  });
}
