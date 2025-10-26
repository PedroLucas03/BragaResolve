# 📊 PLANILHA DE CASOS DE TESTE - MODELO PADRONIZADO

## PROJETO BRAGARESOLVER - CASOS DE TESTE IMPLEMENTADOS

| ID do Caso | Tipo de Teste | Módulo/Classe Testada | Descrição do Cenário | Pré-Condição |
|------------|---------------|----------------------|---------------------|--------------|
| **TU-01** | Unitário | UserModel.validateBudget() | Verificar se um orçamento com formato válido é aceito e rejeitado. | Nenhuma. |
| **TW-01** | Widget | CalculatorScreen | Verificar se a tela de calculadora exibe erro ao submeter campos vazios. | O usuário está na CalculatorScreen. |
| **TI-01** | Integração | Fluxo de Navegação | Verificar se um usuário pode ser direcionado da tela inicial e a navegação é atualizada. | O usuário está logado na HomeScreen. |
| **TU-02** | Unitário | ApiService.fetchData() | Verificar se dados válidos são retornados da API externa. | Conexão com internet disponível. |
| **TW-02** | Widget | BudgetPage | Verificar se a lista de orçamentos e FAB são exibidos corretamente. | O usuário está na BudgetPage. |
| **TI-02** | Integração | Fluxo de Calculadora | Verificar se o usuário pode calcular, salvar orçamento e receber confirmação. | O usuário está na CalculatorPage. |

---

## 📋 DETALHAMENTO EXPANDIDO DOS CASOS DE TESTE

### **📊 TESTES UNITÁRIOS (TU-01, TU-02)**

#### **TU-01: UserModel.validateBudget()**
- **ID:** TU-01
- **Tipo:** Unitário
- **Módulo/Classe:** `BudgetCalculator.calculateBudget()`
- **Descrição:** Verificar se um orçamento com formato válido é aceito e cálculo é rejeitado com valores inválidos
- **Pré-Condição:** Nenhuma
- **Cenário de Teste:**
  - Entrada válida: Material(100) + Mão de obra(200) + Extras(50) + Lucro(20%)
  - Resultado esperado: R$ 420.00
  - Validação de valores negativos (deve lançar erro)

#### **TU-02: ApiService.fetchData()**
- **ID:** TU-02
- **Tipo:** Unitário
- **Módulo/Classe:** `ApiService.fetchData()`
- **Descrição:** Verificar se dados válidos são retornados da API externa
- **Pré-Condição:** Conexão com internet disponível
- **Cenário de Teste:**
  - Chamada para JSONPlaceholder API
  - Verificar retorno de dados não nulos
  - Validar estrutura do JSON retornado

---

### **🖥️ TESTES DE WIDGET (TW-01, TW-02)**

#### **TW-01: CalculatorScreen**
- **ID:** TW-01
- **Tipo:** Widget
- **Módulo/Classe:** `CalculatorPage`
- **Descrição:** Verificar se a tela de calculadora exibe todos os campos e botões corretamente
- **Pré-Condição:** O usuário está na CalculatorScreen
- **Cenário de Teste:**
  - Verificar presença de 7 widgets essenciais
  - Campos: Material, Mão de obra, Extras
  - Controles: Slider de lucro, Botões limpar/salvar
  - Display: Valor total calculado

#### **TW-02: BudgetPage**
- **ID:** TW-02
- **Tipo:** Widget
- **Módulo/Classe:** `BudgetPage`
- **Descrição:** Verificar se a lista de orçamentos e FAB são exibidos corretamente
- **Pré-Condição:** O usuário está na BudgetPage
- **Cenário de Teste:**
  - Título "Meus Orçamentos" presente
  - FloatingActionButton visível
  - Lista com 3 orçamentos mockados exibida
  - Cards com dados corretos (títulos e valores)

---

### **🔗 TESTES DE INTEGRAÇÃO (TI-01, TI-02)**

#### **TI-01: Fluxo de Navegação**
- **ID:** TI-01
- **Tipo:** Integração
- **Módulo/Classe:** `InitialScreen` → Navegação
- **Descrição:** Verificar se um usuário pode ser direcionado da tela inicial e a navegação funciona
- **Pré-Condição:** O usuário está na tela inicial
- **Cenário de Teste:**
  - Aplicativo carrega na `InitialScreen`
  - Título "Bem Vindo!" é exibido
  - Botões "Sou cliente" e "Sou prestador" estão presentes
  - Navegação entre telas funciona corretamente

#### **TI-02: Fluxo de Calculadora**
- **ID:** TI-02
- **Tipo:** Integração
- **Módulo/Classe:** `CalculatorPage` → Cálculo → Salvamento
- **Descrição:** Verificar se o usuário pode calcular, salvar orçamento e receber confirmação
- **Pré-Condição:** O usuário está na CalculatorPage
- **Cenário de Teste:**
  - Preencher campos: Material(100), Mão de obra(200), Extras(50)
  - Verificar cálculo automático: R$ 420.00
  - Clicar "Salvar Orçamento"
  - Confirmar mensagem: "Orçamento de R$ 420.00 salvo!"

---

## 📈 RESUMO EXECUTIVO

| Categoria | Casos Implementados | Taxa de Sucesso | Status |
|-----------|-------------------|------------------|---------|
| Testes Unitários | 2 | 100% | ✅ Passou |
| Testes de Widget | 2 | 100% | ✅ Passou |
| Testes de Integração | 2 | 100% | ✅ Passou |
| **TOTAL** | **6** | **100%** | **✅ Completo** |

---

## 🎯 COBERTURA DE TESTES

- **Cálculos de Negócio:** ✅ Validado (TU-01)
- **Integração Externa:** ✅ Validado (TU-02)  
- **Interface de Usuário:** ✅ Validado (TW-01, TW-02)
- **Fluxos End-to-End:** ✅ Validado (TI-01, TI-02)

---

## 🏆 CONCLUSÃO

A planilha de casos de teste está **100% completa** seguindo o modelo padronizado fornecido. Todos os 6 casos de teste foram implementados, executados e validados com sucesso, garantindo a qualidade e confiabilidade do sistema BragaResolver.

**Comando de execução:**
```bash
flutter test test/unit_test.dart test/widget_test_final.dart test/integration_test_final.dart
```