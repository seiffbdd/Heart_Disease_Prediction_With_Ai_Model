import 'package:flutter/material.dart';

class BuildRow extends StatelessWidget {
  final Widget firstField;
  final Widget secondField;
  const BuildRow({
    super.key,
    required this.firstField,
    required this.secondField,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [Expanded(child: firstField), Expanded(child: secondField)],
    );
  }
}
