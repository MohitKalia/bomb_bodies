import 'package:flutter/material.dart';

class ButtonRC extends StatefulWidget {
  final String text;
  final Function() callback;
  final Color color;
  final Color textColor;

  ButtonRC(this.text, this.callback, this.color, this.textColor);

  @override
  PrimaryButtonRCState createState() => PrimaryButtonRCState();
}

class PrimaryButtonRCState extends State<ButtonRC> {
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
        style: TextStyle(color: widget.textColor, fontSize: 16.0),
      ),
    );
  }
}
