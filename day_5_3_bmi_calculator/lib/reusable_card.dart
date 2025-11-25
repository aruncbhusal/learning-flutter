import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({required this.cardColor, this.cardChild});
  // If we use positional arguments, it is required by default and thus no need to add the modifier
  // Previously, the modifier was @required, but that is now deprecated

  final Color cardColor;
  // This value should be immutable because this class is immutable. So by declaring it as final, any value assigned to it is immutable
  final Widget? cardChild;
  // Since we're not using required keyword and the child can be null, let's turn null safety off for this one

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
