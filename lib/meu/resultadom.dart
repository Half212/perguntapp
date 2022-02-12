import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function () reniciaQuestionario;

  Resultado (this.pontuacao,this.reniciaQuestionario);


  String get fraseResultado {
    if (pontuacao < 15){
      return 'Parabéns!';
    }else if (pontuacao < 25){
      return 'Que cara bom !';
    }else if (pontuacao < 36){
      return 'Ala o cara é uma maquina bixo !';
    }else {
      return 'OOOOHH FAKER OMG WHAT WAS THAT !';
    }

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment:MainAxisAlignment.center ,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(fontSize: 28),
          ),
        ),
        TextButton(onPressed:reniciaQuestionario,
            child: Text( "Reiniciar ?",
            style: TextStyle(
              fontSize: 18,
              color: Colors.blueAccent
            )
              ,)
        ),
      ],
    );
  }
}
