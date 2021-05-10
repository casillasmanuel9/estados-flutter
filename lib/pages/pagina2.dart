import 'package:flutter/material.dart';

class Pagina2 extends StatelessWidget {
  const Pagina2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pagina 2'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonCustom(text: 'Establecer Usuario',onPress: (){},),
            ButtonCustom(text: 'Establecer Edad',onPress: (){},),
            ButtonCustom(text: 'Establecer Profeción',onPress: (){},)
          ],
        )));
  }
}

class ButtonCustom extends StatelessWidget {
  final String text;
  final Function onPress;

  const ButtonCustom({Key key, @required this.text,@required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        '${this.text}',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: this.onPress,
      style: ElevatedButton.styleFrom(
        shape: StadiumBorder()
      ),
    );
  }
}
