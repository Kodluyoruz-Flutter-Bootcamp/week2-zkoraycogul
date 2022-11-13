import 'package:flutter/material.dart';
import 'constants.dart';


void main() => runApp(BilgiTesti());

class BilgiTesti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.indigo[700],
            body: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: SoruSayfasi(),
                ))));
  }
}

class SoruSayfasi extends StatefulWidget {
  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}


class _SoruSayfasiState extends State<SoruSayfasi> {
  List <Widget> ifadeler = [];
  List <Question> questionBank = [
    Question(questionText: "Titanik en büyük gemidir", questionAns: false),
    Question(questionText: "Dünyadaki tavuk sayısı insan sayısından fazladır", questionAns: true),
    Question(questionText: "Kelebekler bir gün yaşar", questionAns: false),
    Question(questionText: "Dünya düzdür", questionAns: false),
    Question(questionText:  "Kaju aslında bir meyvenin sapıdır", questionAns: true),
    Question(questionText:  "Fatih Sultan Mehmet hiç patates yememiştir", questionAns: true)];
int index = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questionBank[index].questionText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Wrap(
          children: ifadeler,
        ),
        Expanded(
          flex: 1,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.0),
              child: Row(children: <Widget>[
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: ElevatedButton(
                            child: Icon(
                              Icons.thumb_down,
                              size: 30.0,
                            ),
                            onPressed: () {
                              setState(() {
                                if(questionBank[index].questionAns == false) {
                                  ifadeler.add(trueAns);
                                } else{
                                  ifadeler.add(falseAns);
                                }
                              });

                              index++;
                              if(index >= questionBank.length){
                                index=0;
                              }
                            },
                          ),
                        ))),
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: ElevatedButton (
                            child: Icon(Icons.thumb_up, size: 30.0),
                            onPressed: () {
                                setState(() {
                                  if(questionBank[index].questionAns == true) {
                                    ifadeler.add(trueAns);
                                  } else{
                                    ifadeler.add(falseAns);
                                  }

                                });
                                index++;
                                if(index >= questionBank.length){
                                  index=0;
                                }


                            },
                          ),
                        ))),
              ])),
        )
      ],
    );
  }
}

class Question {
  String questionText;
  bool questionAns;

  Question({required this.questionText, required this.questionAns});
}
