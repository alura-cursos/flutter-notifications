## Dev Meetups

Este projeto foi criado para o Curso de notificações com Flutter. 
O Dev Meetups é um aplicativo que consulta uma API chamada [dev meetups api](https://github.com/alura-cursos/dev-meetups-api) e lista os eventos que foram cadastrados nela. O intuito é que ao longo do curso nós exploremos como criar e receber notificãções através do Firebase Cloud Messaging (FCM) e este aplicativo será utilizado como base para o curso.


## 🔨 Funcionalidades do projeto

O dev meetups como dito anteroirmente, lê dados de uma api que podemos rodar localmente em nossa máquina. É através desta api que o aplicativo lê os dados de eventos e exibe-os na tela de eventos do app. 

![Imagem da tela de um emulador android com o aplicativo dev meetups listando dois eventos](devmeetups.gif)


## ✔️ Técnicas e tecnologias utilizadas

- `http`: Utilizamos o módulo http para a comunicação externa com API.
- `firebase`: Este projeto utiliza firebase core como dependência para o FCM.
  - `FCM`: Módulo do firebase cloud messaging focado em receber notificações e exibí-las aos usuários.


## 📁 Acesso ao projeto

O acesso ao projeto está separado da seguinte forma:
```
start
├── aula_1
├── aula_2
├── aula_3
├── aula_4
└── main
```

A branch [start](https://github.com/alura-cursos/flutter-notifications/tree/start) é o ponto de partida do repositório, é partindo dela que desenvolveremos a aula_1. Por sua vez, a aula_2 é uma continuação da aula_1 e assim vai sucessivamente. A branch main é a final, nela você encontra o código final criado no curso até a aula_4.

Você pode [baixar](https://github.com/alura-cursos/flutter-notifications/archive/refs/heads/start.zip) o zip com o código inicial do projeto.


**Para executar este projeto você precisa:**

- Ter o [Flutter](https://flutter.dev/docs/get-started/install) instalado na sua máquina
- Ter algum editor de códigos ou IDE como o [Android Studio](https://developer.android.com/studio) ou [Intellij Idea](https://www.jetbrains.com/pt-br/idea/download/). 

Caso opte por IDEs como as duas sugeridas acima, o processo de execução do aplicativo funcionará através de um botão de play na parte superior que ambas dispõem. Caso escolha rodar o projeto via linha de comandos, utilize o comando `flutter run`. Lembre-se de antes de executar o comando de navegar até a pasta do projeto antes. 

Para mais instruções sobre a configuração do ambiente, recomendamos a leitura do artigo [Flutter - Como configurar o ambiente de desenvolvimento](https://www.alura.com.br/artigos/flutter-como-configurar-o-ambiente-de-desenvolvimento). Caso tenha desejo de obter conhecimento além dos cursos da [Formação Flutter](https://www.alura.com.br/formacao-flutter), recomendamos os livros [Iniciando com Flutter Framework](https://www.casadocodigo.com.br/products/livro-flutter) e [Aprofundando em Flutter](https://www.casadocodigo.com.br/products/livro-aprofundando-flutter) da editora [Casa do código](https://www.casadocodigo.com.br/).


## 📚 Mais informações do curso

O curso de notificações tem o foco em ensinar como manipular as notificações recebidas do firebase cloud messaging em um aplicativo Flutter. Entenderemos os tipos de notificações, quais são as formas de receber e exibílas e como dispará-las através de um servidor web que criamos e também através do firebase console.
