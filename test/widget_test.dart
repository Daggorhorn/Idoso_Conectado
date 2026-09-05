import 'package:flutter_test/flutter_test.dart';

import 'package:idoso_conectado/app/app.dart';

void main() {
  testWidgets('Aplicativo inicia corretamente', (WidgetTester tester) async {
    await tester.pumpWidget(const IdosoConectadoApp());

    expect(find.text('Idoso Conectado'), findsOneWidget);
  });
}