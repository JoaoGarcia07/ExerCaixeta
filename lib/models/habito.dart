class Habito {
  String titulo;
  String descricao;
  bool concluido;

  Habito({
    required this.titulo,
    required this.descricao,
    this.concluido = false,
  });
}