import 'package:material_ui/material_ui.dart';

/// Pessoa responsável pelo aplicativo.
class Integrante {
  const Integrante({required this.nome});

  final String nome;
}

/// Identificação do aplicativo e da autoria. É o único arquivo a editar para
/// definir nome, créditos, cor do tema e categorias da lista.
abstract final class Identidade {
  /// Nome exibido na barra superior e na tela "Sobre".
  static const nomeDoApp = 'Lista de casa';

  /// Frase curta que descreve o propósito do aplicativo.
  static const descricao =
      'Lista de compras com armazenamento local em SQLite e envio posterior '
      'a um serviço simulado.';

  static const turma = 'Desenvolvimento para Dispositivos Móveis — 2026';

  static const integrantes = [
    Integrante(nome: 'Felipe Madison da Silva Veloso'),
  ];

  /// Cor semente do tema (Aula 10): o Material 3 deriva a paleta a partir dela.
  static const corSemente = Color(0xFF343434);

  /// Categorias oferecidas no formulário. A primeira é o valor padrão.
  static const categorias = ['Hortifrúti', 'Mercearia', 'Limpeza', 'Higiene'];
}
