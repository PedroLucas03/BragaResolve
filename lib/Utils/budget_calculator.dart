// Classe utilitária para cálculos de orçamento
class BudgetCalculator {
  // TU-01: Função para calcular orçamento com margem de lucro
  static double calculateBudget({
    required double material,
    required double labor,
    required double extras,
    required double profitMargin,
  }) {
    if (material < 0 || labor < 0 || extras < 0 || profitMargin < 0) {
      throw ArgumentError('Valores não podem ser negativos');
    }
    
    final subtotal = material + labor + extras;
    return subtotal * (1 + profitMargin);
  }

  // Função auxiliar para validar dados de entrada
  static bool isValidBudgetData(double material, double labor, double extras) {
    return material >= 0 && labor >= 0 && extras >= 0;
  }

  // Função para formatar valor monetário
  static String formatCurrency(double value) {
    return 'R\$ ${value.toStringAsFixed(2)}';
  }
}