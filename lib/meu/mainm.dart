import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

main() => runApp(new PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'Pontuação': 5},
        {'texto': 'Vermelho', 'Pontuação': 6},
        {'texto': 'Verde', 'Pontuação': 7},
        {'texto': 'Branco', 'Pontuação': 8},
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Coelho', 'Pontuação': 5},
        {'texto': 'Cobra', 'Pontuação': 6},
        {'texto': 'Elefante', 'Pontuação': 7},
        {'texto': 'Leão', 'Pontuação': 8}
      ],
    },
    {
      'texto': 'Qual sua comida favorita?',
      'respostas': [
        {'texto': 'Lasanha', 'Pontuação': 5},
        {'texto': 'Hamburguer', 'Pontuação': 6},
        {'texto': 'Pizza', 'Pontuação': 7},
        {'texto': 'Sushi', 'Pontuação': 8}
      ],
    }
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder,
              )
            : Resultado(_pontuacaoTotal,_reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
