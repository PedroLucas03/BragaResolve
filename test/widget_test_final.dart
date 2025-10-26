import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:braga_resolve/Presentation/Screens/calculator_page.dart';
import 'package:braga_resolve/Presentation/Screens/budgetPage.dart';

void main() {
  group('TESTES DE WIDGET', () {
    
    group('Testes de Widget', () {
      
      testWidgets('TW-01: CalculatorPage deve renderizar todos os widgets corretamente', (WidgetTester tester) async {
        await tester.binding.setSurfaceSize(Size(400, 800));
        
        await tester.pumpWidget(
          const MaterialApp(home: CalculatorPage()),
        );
        await tester.pumpAndSettle();
        
        //verificar widgets essenciais
        expect(find.text('Calculadora de Orçamento'), findsOneWidget);
        expect(find.byKey(const Key('material_field')), findsOneWidget);
        expect(find.byKey(const Key('labor_field')), findsOneWidget);
        expect(find.byKey(const Key('extra_field')), findsOneWidget);
        expect(find.byKey(const Key('profit_slider')), findsOneWidget);
        expect(find.byKey(const Key('total_value')), findsOneWidget);
        expect(find.byKey(const Key('clear_button')), findsOneWidget);
        expect(find.byKey(const Key('save_button')), findsOneWidget);
      });

      testWidgets('TW-02: BudgetPage deve exibir lista de orçamentos e FAB', (WidgetTester tester) async {
        await tester.binding.setSurfaceSize(Size(400, 800));
        
        await tester.pumpWidget(
          const MaterialApp(home: BudgetPage()),
        );
        await tester.pumpAndSettle();
        
        expect(find.text('Meus Orçamentos'), findsOneWidget);
        expect(find.byType(FloatingActionButton), findsOneWidget);
      
        expect(find.text('Instalação Elétrica'), findsOneWidget);
        expect(find.text('Reparo Hidráulico'), findsOneWidget);
        expect(find.text('Pintura Externa'), findsOneWidget);
      });
    });
  });
}