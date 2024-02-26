import 'package:animated_styled_widget/animated_styled_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:mocker/widget/system.dart';

final _baseStyle = Style(padding: const EdgeInsets.all(10));

class FilledCard extends StatelessWidget {
  FilledCard({super.key, this.title, this.child, this.actions});
  final String? title;
  final Widget? child;
  final List<Widget>? actions;

  final _filledCardStyle = _baseStyle.copyWith(
      backgroundDecoration: BoxDecoration(color: Colors.brand[50]),
      shapeBorder: RoundedRectangleShapeBorder(
          borderRadius:
              DynamicBorderRadius.all(DynamicRadius.circular(10.toPXLength))));

  @override
  Widget build(BuildContext context) {
    return StyledContainer(
        style: _filledCardStyle,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title != null) ...[Text(title!, style: subHeaderStyle)],
            if (child != null) ...[child!],
            if (actions != null) ...[
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: actions!,
              )
            ]
          ],
        ));
  }
}
