# Teorias Nerds

## Descrição
O **Teorias Nerds** é um aplicativo mobile focado em centralizar as mais diversas especulações, análises e teorias do mundo geek. O problema que ele resolve é a fragmentação desse tipo de conteúdo, que geralmente fica perdido em fóruns gigantescos ou comentários de redes sociais, permitindo que usuários criem e debatam hipóteses profundas sobre suas obras favoritas de forma estruturada e em uma plataforma dedicada.

## Público-Alvo
A aplicação foi pensada para os fãs assíduos da cultura pop: leitores de HQs, "otakus" (fãs de animes/mangás), cinéfilos, gamers e espectadores de séries que gostam de ir além do que a obra entrega e procurar significados ocultos, easter eggs e previsões para o futuro de suas franquias prediletas.

## Tecnologias Utilizadas
- **Linguagem Principal:** Flutter / Dart
- **Backend utilizado:** Firebase (Firestore) - *(Atualmente configurado com Mock Database escalável para integração direta)*
- **Gerenciador de estados:** GetX
- **Outras bibliotecas:**
  - `shared_preferences` (Persistência de dados locais)
  - `uuid` (Geração de chaves únicas)
  - `google_fonts` (Tipografia dinâmica e customizada)
  - `intl` (Formatação flexível de datas)

## Arquitetura
A arquitetura escolhida foi o **MVC (Model-View-Controller)** adaptada para fluir perfeitamente com a reatividade do GetX. As pastas foram organizadas da seguinte maneira no diretório `lib/`:
- `models/`: Contém as entidades e regras de conversão de dados da aplicação (`TheoryModel`).
- `views/`: Centraliza todas as telas e os elementos de UI que os usuários visualizam, puramente focadas em desenhar a interface na tela.
- `controllers/`: Armazena a lógica de negócio e mantém o estado das telas, separando por completo a regra de funcionamento das telas (`TheoryController`, `OnboardingController`).
- `bindings/`: Faz a Injeção de Dependências, alocando os *controllers* na memória apenas quando são necessários.
- `routes/`: Isola a navegação do app, definindo caminhos estritos para as telas (`/home`, `/detail`, etc).
- `core/theme/`: Temas e constantes que ditam as cores e estética visual padrão do projeto de modo global.

## Funcionalidades
- **Funcionalidade 1:** Tela de *Onboarding* interativa para introduzir os novos usuários aos recursos do aplicativo, vista uma única vez na instalação inicial.
- **Funcionalidade 2:** Feed dinâmico de leitura na Home, onde os usuários podem visualizar todas as teorias publicadas (exibindo autor, categoria, data e conteúdo), com feedback visual inteligente caso não haja conexão.
- **Funcionalidade 3:** Criação e aprofundamento das teorias, possibilitando redigir novas teorias definindo título e categoria, e a capacidade de abrir uma teoria da página inicial em uma nova página de Detalhes para leitura completa e imersiva.

## Backend
A aplicação foi construída com seu código base focado para consumir **Firebase Cloud Firestore**. Atualmente, ela se comunica através da camada `TheoryController`, que processa uma simulação de requisição (*Mock* com atraso artificial) simulando o tráfego da rede para gerar a UI corretamente. A substituição pelo `get()` do Firestore é transparente, pois a conversão do JSON (`fromMap`, `toJson`) já se encontra perfeitamente ajustada na camada de Model.

## Gerenciamento de Estados
O gerenciador de estados escolhido foi o **GetX** (`get`). Ele foi utilizado de ponta a ponta por causa da sua eficiência e ausência de complexidade exagerada. Ele foi alocado dentro da pasta `controllers` e em todos os locais da interface visual através do *widget* `<Obx>`, dispensando a obrigação constante de utilizar `StatefulWidgets` ou recarregar as árvores de widgets por completo através de `setState()`. Ao invés disso, o GetX atualiza somente a mínima porção de texto ou ícone que sofreu modificação na memória.

## Uso de IA
Durante o desenvolvimento, a inteligência artificial **Antigravity (Gemini 3.1 Pro)** foi utilizada como uma ferramenta de apoio em um processo contínuo de *pair programming*. A concepção do aplicativo, definição das regras de negócio, escolha da arquitetura e direção técnica foram totalmente lideradas e elaboradas por mim. A IA auxiliou ativamente acelerando a geração do código-fonte (*boilerplate*), montagem da estrutura de pastas e integração do GetX, sempre atuando sob meus comandos diretos, análises e revisões do código gerado.

## Como Executar o Projeto

1. Certifique-se de que o **SDK do Flutter** está devidamente instalado em sua máquina e configurado nas variáveis de ambiente.
2. Clone o repositório ou abra o diretório gerado.
3. Acesse a pasta raiz do projeto via terminal e inicialize as plataformas do Flutter:
   ```bash
   flutter create .
   ```
4. Instale as bibliotecas necessárias:
   ```bash
   flutter pub get
   ```
5. Com um emulador aberto (ou celular conectado via depuração USB), execute o app:
   ```bash
   flutter run
   ```

## Prints da Aplicação
*(Neste momento inicial, não possuímos capturas da tela física pois o código foi gerado "headless", sendo necessário a execução nativa na máquina para extrair o resultado visual final. Imagens/GIFs poderão ser incluídos aqui após a primeira Build).*

## Autor ou Equipe
* **Autor:** [Enzo]
