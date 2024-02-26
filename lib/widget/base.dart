import 'package:flutter/widgets.dart';
import 'package:mocker/shared/colors.dart';
import 'package:mocker/shared/texts.dart';

class Scaffold extends StatelessWidget {
  const Scaffold({super.key, required this.appBar, required this.body});
  final AppBar appBar;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.defaultBackground,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: appBar,
          ),
          Expanded(child: body)
        ],
      ),
    );
  }
}

class AppBar extends StatelessWidget {
  const AppBar({super.key, required this.title, required this.items});
  final String title;
  final List<Widget> items;
  final double gap = 8;

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: subHeaderStyle,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (var index = 0; index < items.length; index++) ...[
              if (index > 0) ...[
                SizedBox(
                  width: gap,
                )
              ],
              items[index]
            ]
          ],
        )
      ],
    );
  }
}
