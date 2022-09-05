import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({@required this.child, @required this.onPressed});
  final Widget child;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        child: child,
        shape: CircleBorder(),
        fillColor: Color(0xFF4C4F5E),
        elevation: 6.0,
        onPressed: onPressed,
        constraints: BoxConstraints.tightFor(
          width: 56.0,
          height: 56.0,
        ));
  }
}
