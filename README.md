# Lista de casa

Aplicativo Android de lista de compras desenvolvido para a disciplina Desenvolvimento para Dispositivos Móveis do IFB. O projeto implementa o [tutorial integrador da Aula 15](https://github.com/claulis/Desenvolvimento-para-Dispositivos-Moveis-2026/blob/main/aulas/aula-15-flutter-tutorial-integrador-sqlite.md), adaptado para compras domésticas.

## O que faz

- Cadastra, edita e exclui itens com categoria, quantidade e observação.
- Marca itens comprados e mantém os dados em SQLite no dispositivo.
- Exibe estado de conectividade e simula envio de alterações pendentes, com nova tentativa em falhas transitórias.
- Abre itens por ligação profunda e mostra dados do dispositivo por um canal de plataforma Kotlin.

A sincronização é **simulada**: nenhum servidor real recebe os dados. A demonstração em `docs/` é independente do aplicativo Android e guarda sua própria lista no navegador.

## Arquitetura

O código é organizado em três camadas. `dominio/` contém a entidade, as regras e o contrato do repositório; `dados/` implementa o armazenamento SQLite, o serviço remoto simulado e a integração nativa; `apresentacao/` reúne telas, componentes, rotas e estado com Riverpod. O arquivo `providers.dart` monta as dependências e conecta a interface ao contrato do domínio. A navegação usa `go_router`.

Ao alterar um item, a interface chama o notifier, que usa o repositório para gravá-lo no SQLite. O estado é atualizado com a lista relida. A sincronização consulta os itens pendentes e só marca a versão enviada se ela não tiver sido alterada durante o envio.

## Executar e testar

Com Flutter e o SDK Android configurados:

```sh
flutter pub get
flutter analyze
flutter test
flutter run
flutter build apk --release
```

O APK de release é gerado em `build/app/outputs/flutter-apk/app-release.apk`. O serviço remoto é uma simulação e não oferece backup nem sincronização entre dispositivos.

## Autoria

Felipe Madison da Silva Veloso. Base técnica e código de referência: tutorial da Aula 15, disponível no repositório da disciplina.
