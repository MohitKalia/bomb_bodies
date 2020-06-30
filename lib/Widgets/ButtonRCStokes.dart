import 'package:flutter/material.dart';

class ButtonRCStokes extends StatefulWidget {
  final String text;
  final Function() callback;
  final Color color;
  final Color textColor;
  final Color stokeColor;

  ButtonRCStokes(this.text, this.callback, this.color, this.textColor, this.stokeColor);

  @override
  PrimaryButtonRCStokeState createState() => PrimaryButtonRCStokeState();
}

class PrimaryButtonRCStokeState extends State<ButtonRCStokes> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      onPressed: widget.callback,
      padding: EdgeInsets.all(12),
      color: widget.color,
      child: Text(
        widget.text,
        style: TextStyle(shadows: [
            Shadow( // bottomLeft
            offset: Offset(-1.5, -1.5),
          color: widget.stokeColor
      ),
        Shadow( // bottomRight
            offset: Offset(1.5, -1.5),
            color: widget.stokeColor
        ),
        Shadow( // topRight
            offset: Offset(1.5, 1.5),
            color: widget.stokeColor
        ),
        Shadow( // topLeft
            offset: Offset(-1.5, 1.5),
            color: widget.stokeColor
        ),
        ],color: widget.textColor, fontSize: 16.0),
      ),
    );
  }

}
