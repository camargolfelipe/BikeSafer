//ROUTE
import 'package:flutter/material.dart';

const motivacional = [
  "Nada se compara ao simples prazer de pedalar.",
  "É proibido desistir. Respire fundo e continue!",
  "As metas de um ciclista estão atreladas à perseverança.",
  "Pedale! Seja mais forte que a sua melhor desculpa.",
  "Eu sou ciclista, com muito orgulho e com muito amor!",
  "Você não pode comprar a felicidade, mas pode comprar uma bicicleta, que é quase a mesma coisa!",
  "Sem trânsito, sem poluição, sem gastos com combustível... Pedale sua bike e salve o planeta!",
  "Não pense na linha de chegada, apenas aprecie o percurso.",
  "De carro eu vou mais rápido, mas de bike a minha vida vai mais longe.",
  "Pedale hoje e descanse amanhã. Repita diariamente e veja a sua vida mudar pra sempre!",
];
dialog(context, String title, Widget content) {
  return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            title: Text(title),
            content: content,
          ));
}
