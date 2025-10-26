# PLANILHA DE CASOS DE TESTE - PROJETO BRAGARESOLVER

## TESTES UNITÁRIOS

### TU-01: Teste da função de cálculo de orçamento
**Objetivo:** Verificar se o cálculo de orçamento com margem de lucro está correto
**Pré-condições:** Valores válidos de material, mão de obra e margem
**Passos:**
1. Chamar função calculateBudget com valores conhecidos
2. Verificar se o retorno é o valor esperado com margem aplicada
**Resultado Esperado:** Cálculo correto do valor total
**Critério de Sucesso:** Valor calculado = (material + mão_obra) * (1 + margem)

### TU-02: Teste do serviço de API - getUserStats
**Objetivo:** Verificar se o serviço retorna dados de estatísticas válidos
**Pré-condições:** Conexão de rede simulada
**Passos:**
1. Chamar ApiService.getUserStats()
2. Verificar estrutura dos dados retornados
**Resultado Esperado:** Map com chaves obrigatórias (totalTasks, completedTasks, etc.)
**Critério de Sucesso:** Todas as chaves esperadas presentes e com tipos corretos

## TESTES DE WIDGET

### TW-01: Teste da tela de calculadora (CalculatorPage)
**Objetivo:** Verificar se os widgets da calculadora são renderizados corretamente
**Pré-condições:** Tela carregada
**Passos:**
1. Carregar CalculatorPage
2. Verificar presença dos campos de entrada
3. Verificar presença dos botões
**Resultado Esperado:** Todos os elementos da interface presentes
**Critério de Sucesso:** TextFields, Slider e botões encontrados

### TW-02: Teste da interação na tela de orçamentos (BudgetPage)
**Objetivo:** Verificar se a lista de orçamentos é exibida e o FAB funciona
**Pré-condições:** BudgetPage carregada com dados mockados
**Passos:**
1. Carregar BudgetPage
2. Verificar se os cards de orçamento aparecem
3. Testar toque no FloatingActionButton
**Resultado Esperado:** Lista exibida e dialog aparece ao tocar FAB
**Critério de Sucesso:** Cards visíveis e dialog de "Novo Orçamento" exibido

## TESTES DE INTEGRAÇÃO

### TI-01: Teste de navegação completa do app
**Objetivo:** Verificar fluxo de navegação entre telas principais
**Pré-condições:** App iniciado
**Passos:**
1. Iniciar app na tela inicial
2. Navegar para login
3. Acessar HomePage
4. Testar navegação entre abas
**Resultado Esperado:** Navegação fluida entre todas as telas
**Critério de Sucesso:** Todas as transições funcionam sem erro

### TI-02: Teste de fluxo completo da calculadora
**Objetivo:** Verificar fluxo completo: abrir calculadora → calcular → salvar
**Pré-condições:** App na HomePage
**Passos:**
1. Tocar no FAB da HomePage
2. Preencher campos da calculadora
3. Ajustar margem de lucro
4. Tocar em "Salvar Orçamento"
**Resultado Esperado:** Fluxo completo funciona e mostra confirmação
**Critério de Sucesso:** SnackBar de confirmação aparece após salvar

---

**Data de Criação:** 26/10/2025
**Responsável:** Equipe de Desenvolvimento
**Versão do App:** 1.0.0
**Framework:** Flutter 3.8.1