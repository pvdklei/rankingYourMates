import 'package:flutter/material.dart';
import 'package:ranking_your_mates/constants/style.dart';

class ExpandableAuthOption extends StatelessWidget {

  final int color;
  final String title;
  final List<Widget> children;

  ExpandableAuthOption({this.color, this.title, this.children});

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context).copyWith(dividerColor: Colors.transparent, accentColor: Colors.black.withOpacity(.1));

    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Theme(
        data: theme,
        child: Container(
          padding: EdgeInsets.all(5.0),
          width: 300.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Color(color),
          ),
          child: ExpansionTile(
            title: Text(
              title,
              style: bodyStyle1,
            ),
            children: children,
          ),
        ),
      ),
    );
  }
}
