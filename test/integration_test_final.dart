import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:braga_resolve/main.dart';
import 'package:braga_resolve/Presentation/Screens/initialScreen.dart';
import 'package:braga_resolve/Presentation/Screens/calculator_page.dart';

void main() {
  group('TESTES DE INTEGRAÇÃO', () {
    
    testWidgets('Deve navegar corretamente entre telas principais', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(Size(400, 800));
      
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
          child: const MyApp(),
        ),
      );
      await tester.pumpAndSettle();
      
      expect(find.byType(InitialScreen), findsOneWidget);
      expect(find.text('Bem Vindo!'), findsOneWidget);
      
      expect(find.text('Sou cliente'), findsOneWidget);
      expect(find.text('Sou prestador'), findsOneWidget);
    });

    //teste de fluxo da calculadora
    testWidgets('Deve completar fluxo: Calculadora → Calcular → Salvar', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(Size(400, 800));
      
      await tester.pumpWidget(
        const MaterialApp(
          home: CalculatorPage(),
        ),
      );
      await tester.pumpAndSettle();
      
      //verificar se calculadora carregou
      expect(find.text('Calculadora de Orçamento'), findsOneWidget);
      expect(find.byKey(const Key('material_field')), findsOneWidget);
      expect(find.byKey(const Key('labor_field')), findsOneWidget);
      expect(find.byKey(const Key('extra_field')), findsOneWidget);
      
      await tester.enterText(find.byKey(const Key('material_field')), '100');
      await tester.enterText(find.byKey(const Key('labor_field')), '200');
      await tester.enterText(find.byKey(const Key('extra_field')), '50');
      await tester.pumpAndSettle();
      
      await tester.pump(const Duration(milliseconds: 500));
      
      expect(find.textContaining('R\$ 420.00'), findsOneWidget);
      
      await tester.tap(find.byKey(const Key('save_button')));
      await tester.pumpAndSettle();
      
      expect(find.text('Orçamento de R\$ 420.00 salvo!'), findsOneWidget);
    });
  });
}