import 'package:flutter/material.dart';
import 'package:shop_new/constants.dart';

class UnorderedList extends StatelessWidget {
   const UnorderedList({Key? key,required this.texts}): super(key: key);
  final List<String> texts;

  @override
  Widget build(BuildContext context) {
    var widgetList = <Widget>[];
    for (var text in texts) {
      // Add list item
      widgetList.add(UnorderedListItem( text:text,));
      // Add space between items
      widgetList.add(const SizedBox(height: 5.0));
    }

    return Column(children: widgetList);
  }
}

class UnorderedListItem extends StatelessWidget {
  const UnorderedListItem({Key? key,required this.text}): super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("• ",style: TextStyle(
          fontSize: size(context).height/mediumTextHeight,
          fontWeight: FontWeight.w800
        ),),
        Expanded(
          child: Text(text,
            style: TextStyle(
              fontSize: size(context).height/mediumTextHeight,
            ),),
        ),
      ],
    );
  }
}