import 'package:flutter/material.dart';
import 'package:quiz/core/styles/colors.dart';
import 'package:quiz/core/widgets/medium_text.dart';

class DefaultTextButton extends StatelessWidget {

  final String text ;
  final VoidCallback onPressed ;
  final Color color;
  final bool isUnderLine ;

  const DefaultTextButton({Key? key , required this.text , required this.onPressed ,this.color = AppColor.primaryColor,this.isUnderLine= false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed,
        child: MediumText(text: text,color: color,isUnderLine: isUnderLine,fontSize: 16,));
  }
}
