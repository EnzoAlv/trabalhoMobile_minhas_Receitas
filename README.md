# 📚 Meu Caderno de Receitas

Um aplicativo Flutter simples e intuitivo para você guardar e organizar suas receitas favoritas! Crie, visualize e exclua suas receitas, com persistência de dados local para que você nunca perca suas anotações culinárias.

---

## ✨ Funcionalidades

* **Splash Screen:** Uma tela de abertura com o logo do aplicativo para uma experiência de carregamento agradável.
* **Listagem de Receitas:** Visualize todas as suas receitas salvas em uma lista organizada na tela inicial.
* **Adicionar Nova Receita:** Um formulário fácil de usar para inserir o nome, ingredientes, modo de preparo e categoria de suas novas criações culinárias.
* **Detalhes da Receita:** Clique em qualquer receita na lista para ver todos os seus detalhes em uma tela dedicada.
* **Excluir Receita:** Remova receitas da sua lista que você não precisa mais.
* **Persistência de Dados:** Suas receitas são salvas localmente no dispositivo usando `shared_preferences`, garantindo que não sejam perdidas ao fechar o aplicativo.

---

## 🛠️ Tecnologias Utilizadas

* **Flutter:** Framework UI de código aberto do Google para construir aplicativos compilados nativamente para mobile, web e desktop a partir de uma única base de código.
* **Dart:** Linguagem de programação otimizada para UI, usada pelo Flutter.
* **`shared_preferences`:** Pacote Flutter para persistir dados simples no disco de forma assíncrona. Ideal para dados-chave/valor.
* **`uuid`:** Pacote Dart para gerar Identificadores Únicos Universais (UUIDs), utilizados para dar um ID exclusivo a cada receita.

---

## 🚀 Como Executar o Projeto

Para configurar e executar este projeto em sua máquina local, siga os passos abaixo:

### Pré-requisitos

Certifique-se de ter o Flutter SDK instalado e configurado em seu ambiente de desenvolvimento. Você pode seguir as instruções oficiais de instalação em [flutter.dev/docs/get-started/install](https://flutter.dev/docs/get-started/install).

### Configuração do Projeto

1.  **Clone o Repositório:**
    ```bash
    git clone https://github.com/EnzoAlv/trabalhoMobile_minhas_Receitas
    cd meu_caderno_de_receitas
    ```
    *Substitua `https://github.com/EnzoAlv/trabalhoMobile_minhas_Receitas` pelo link real do seu repositório no GitHub.*

2.  **Instale as Dependências:**
    Após navegar para o diretório do projeto, obtenha todas as dependências necessárias executando:
    ```bash
    flutter pub get
    ```

3.  **Adicione o Logo (Opcional, mas recomendado para a Splash Screen):**
    * Crie uma pasta `imagens` dentro de `lib`:
        ```bash
        mkdir lib/imagens
        ```
    * Coloque seu arquivo de logo (por exemplo, `logo.png`) dentro de `lib/imagens/`.
    * Certifique-se de que o `pubspec.yaml` esteja configurado para incluir este asset, como mostrado na seção `flutter > assets` do `pubspec.yaml` fornecido no projeto.

4.  **Execute o Aplicativo:**
    Conecte um dispositivo Android ou iOS (ou inicie um emulador/simulador) e execute o aplicativo:
    ```bash
    flutter run
    ```
    Para testar na web:
    ```bash
    flutter run -d web-renderer html --web-hostname localhost --web-port 8080
    ```
    (Opcional: use `--web-renderer html` para melhor compatibilidade em alguns navegadores, especialmente para aplicativos com muitos Widgets.)

---

## 🌐 QrCode para Testar a Versão Web

Você pode testar a versão web deste aplicativo diretamente no seu navegador escaneando o QrCode abaixo:


![image](https://github.com/user-attachments/assets/90c16737-d981-42b7-8d32-f16a80e2ed50)

---

## 🎬 Vídeo de Demonstração

Assista a um vídeo rápido mostrando as funcionalidades do aplicativo:


https://github.com/user-attachments/assets/bf3dcc8a-c007-4d3c-a0a1-c2d5e2cebbb0




---

## 🤝 Contribuições

Contribuições são bem-vindas! Se você tiver sugestões, melhorias ou encontrar algum bug, sinta-se à vontade para abrir uma *issue* ou enviar um *pull request*.

---

## 📄 Licença

Este projeto está licenciado sob a Licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

---

## 📧 Contato

Se tiver alguma dúvida ou sugestão, entre em contato:

* Nome: Enzo Alvarenga Mariano
* Email: alvarengaenzo2005@gmail
* GitHub: https://github.com/EnzoAlv/trabalhoMobile_minhas_Receitas
