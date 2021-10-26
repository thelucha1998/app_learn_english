import 'package:flutter/material.dart';

class ContainerColor extends StatefulWidget {
  final Color colors;

  const ContainerColor({Key key, this.colors}) : super(key: key);
  @override
  _ContainerColorState createState() => _ContainerColorState();
}

class _ContainerColorState extends State<ContainerColor> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10, top: 5, bottom: 5),
      width: 23,
      height: 10,
      decoration: BoxDecoration(
        color: widget.colors,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
    );
  }
}
