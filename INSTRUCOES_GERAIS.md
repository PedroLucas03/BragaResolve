# 📋 INSTRUÇÕES GERAIS PARA TODOS OS GRUPOS

## 🎯 Contexto da Dinâmica
Vocês são uma **empresa terceirizada** contratada para **atualizar e expandir** o sistema BragaResolve. Cada grupo receberá uma tarefa específica que simula um cenário real de manutenção/evolução de software.

## ⏰ Tempo Total: 2 horas
- **Planejamento:** 15-30 minutos
- **Desenvolvimento:** 60-90 minutos  
- **Apresentação:** 15 minutos por grupo

---

## 📁 Estrutura do Projeto
```
BragaResolve/
├── lib/
│   ├── main.dart
│   ├── Data/
│   │   ├── Models/
│   │   └── Services/
│   ├── Domain/
│   ├── Presentation/
│   │   └── Screens/
│   └── injection_container/
├── pubspec.yaml
└── README.md
```

---

## 🛠️ Setup Inicial (TODOS OS GRUPOS)

### 1. Preparar ambiente
```bash
# Verificar Flutter instalado
flutter --version

# Navegar para o projeto
cd BragaResolve

# Instalar dependências
flutter pub get

# Verificar dispositivos
flutter devices

# Executar o app
flutter run
```

### 2. Testar navegação básica
- Execute o app
- Teste o login/navegação
- Vá até a tela "Início" (HomePage)
- Navegue pelas abas do BottomNavigationBar

---

## 📋 DIVISÃO DOS GRUPOS

### 🎨 **GRUPO 1 - UI/UX Design**
**Arquivo:** `GRUPO_1_UI_DESIGN.md`
- **Objetivo:** Criar design no Figma + implementar interface da BudgetPage
- **Habilidades:** Design, Flutter UI, Layouts responsivos

### 🔧 **GRUPO 2 - API Integration** 
**Arquivo:** `GRUPO_2_API_INTEGRATION.md`
- **Objetivo:** Integrar API REST na ResumePage
- **Habilidades:** HTTP requests, tratamento de dados, estados de loading

### 🔔 **GRUPO 3 - Sistema de Notificações**
**Arquivo:** `GRUPO_3_NOTIFICATIONS.md`  
- **Objetivo:** Implementar sistema completo de notificações
- **Habilidades:** Gerenciamento de estado, navegação, funcionalidades avançadas

---

## 📝 Critérios de Avaliação

### ✅ Critérios Técnicos
- **Código funcional** (40 pontos)
- **Boas práticas** (20 pontos) 
- **Tratamento de erros** (15 pontos)
- **Interface intuitiva** (15 pontos)
- **Documentação/comentários** (10 pontos)

### 🎤 Critérios de Apresentação
- **Explicação clara da solução** (30 pontos)
- **Demonstração prática** (30 pontos)
- **Identificação de melhorias futuras** (20 pontos)
- **Trabalho em equipe** (20 pontos)

---

## 🚨 Regras Importantes

### ✅ PODE FAZER:
- Modificar arquivos especificados na sua tarefa
- Criar novos arquivos nas pastas indicadas
- Usar bibliotecas listadas nas instruções
- Pesquisar documentação Flutter/Dart
- Pedir ajuda para configuração de ambiente

### ❌ NÃO DEVE FAZER:
- Modificar `main.dart` ou outros arquivos não mencionados
- Alterar estrutura de pastas principal
- Instalar bibliotecas não autorizadas
- Copiar código de outros grupos

---

## 📱 Como Testar Sua Implementação

### Para todos os grupos:
1. **Salve** todos os arquivos criados/modificados
2. **Execute** `flutter pub get` se adicionou dependências
3. **Execute** `flutter run` ou use o botão play do VS Code
4. **Navegue** até sua funcionalidade específica
5. **Teste** todas as funcionalidades implementadas
6. **Documente** problemas encontrados

---

## 🎤 Estrutura da Apresentação (15 min)

### 1. **Introdução** (2 min)
- Nome do grupo e integrantes
- Qual problema foi resolvido

### 2. **Demonstração** (8 min)
- Mostrar o código implementado
- Executar a aplicação
- Demonstrar todas as funcionalidades

### 3. **Discussão Técnica** (3 min)
- Principais desafios enfrentados
- Soluções adotadas
- Melhorias futuras

### 4. **Perguntas** (2 min)
- Responder perguntas dos avaliadores

---

## 🆘 Suporte Técnico

### Problemas Comuns:
- **Flutter não reconhecido:** Verificar PATH do Flutter
- **Dependências:** Executar `flutter clean` + `flutter pub get`
- **Emulador:** Usar Chrome (flutter run -d chrome) se Android não funcionar
- **Erros de build:** Verificar syntax errors nos arquivos modificados

### Contatos para Suporte:
- **Setup/Configuração:** Instrutor principal
- **Dúvidas técnicas:** Assistentes disponíveis
- **Problemas de código:** Revisar arquivo específico do grupo

---

## 🏆 Dicas para o Sucesso

1. **Leiam COMPLETAMENTE** o arquivo do seu grupo antes de começar
2. **Dividam as tarefas** entre os integrantes
3. **Testem frequentemente** durante o desenvolvimento
4. **Documentem** o que estão fazendo
5. **Preparem** a apresentação com antecedência
6. **Tenham um plano B** caso algo não funcione

---

## 📞 Em caso de dúvidas
- Levantem a mão para chamar assistência
- Consultem a documentação oficial do Flutter
- Trabalhem em equipe - aproveitem os conhecimentos de cada um!

**BOA SORTE! 🚀**