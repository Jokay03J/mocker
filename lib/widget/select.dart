import 'package:animated_styled_widget/animated_styled_widget.dart';
import 'package:flex_dropdown/flex_dropdown.dart';
import 'package:flutter/widgets.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mocker/widget/system.dart';

class Select extends StatefulWidget {
  const Select(
      {super.key,
      required this.label,
      required this.items,
      required this.onSelected});
  final String label;
  final List<SelectItem> items;
  final void Function(String? value) onSelected;

  @override
  State<StatefulWidget> createState() => _SelectState();
}

class SelectItem {
  SelectItem({required this.name, this.value});

  final String name;
  final String? value;
}

class _SelectState extends State<Select> {
  String? value;
  String? displayedName;
  bool _opened = false;
  void select(String? value) {}

  @override
  void initState() {
    super.initState();
  }

  final OverlayPortalController _controller = OverlayPortalController();

  final Style _menuItemStyle = Style(
      width: Dimension.min(100.toPercentLength, 100.toPercentLength),
      padding: const EdgeInsets.only(top: 4, bottom: 4, left: 2, right: 2),
      backgroundDecoration: BoxDecoration(color: Colors.defaultBackground));

  final Style _buttonStyle = Style(
      padding: const EdgeInsets.all(8),
      shapeBorder: RoundedRectangleShapeBorder(
          borderSides: RectangleBorderSides.all(
              DynamicBorderSide(color: Colors.neutralBorder)),
          borderRadius:
              DynamicBorderRadius.all(DynamicRadius.circular(5.toPXLength))));

  @override
  Widget build(BuildContext context) {
    return RawFlexDropDown(
      controller: _controller,
      buttonBuilder: (context, onTap) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.label,
              style: labelStyle,
            ),
            StyledButton(
              style: _buttonStyle,
              onPressed: () {
                onTap();
                setState(() {
                  _opened = !_opened;
                });
              },
              child: Row(
                children: [
                  Text(displayedName ?? widget.items[0].name),
                  const SizedBox(
                    width: 5,
                  ),
                  Icon(
                    _opened ? LucideIcons.arrowUp : LucideIcons.arrowDown,
                    size: 12,
                  ),
                ],
              ),
            ),
          ],
        );
      },
      menuBuilder: (context, width) {
        return Padding(
          padding: const EdgeInsets.only(top: 4),
          child: SizedBox(
            width: width,
            child: StyledContainer(
              style: Style(
                  width:
                      Dimension.min(100.toPercentLength, 100.toPercentLength),
                  shapeBorder: RectangleShapeBorder(
                      borderRadius: DynamicBorderRadius.all(
                          DynamicRadius.circular(4.toPXLength)),
                      border: DynamicBorderSide(color: Colors.neutralBorder))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (var index = 0; index < widget.items.length; index++) ...[
                    StyledButton(
                      style: _menuItemStyle,
                      hoveredStyle: _menuItemStyle.copyWith(
                          backgroundDecoration:
                              BoxDecoration(color: Colors.neutral[50])),
                      pressedStyle: _menuItemStyle.copyWith(
                          backgroundDecoration:
                              BoxDecoration(color: Colors.neutral[100])),
                      child: Text(
                        widget.items[index].name,
                        style: bodyStyle,
                      ),
                      onPressed: () {
                        _controller.hide();
                        setState(() {
                          value = widget.items[index].value ??
                              widget.items[index].name;
                          displayedName = widget.items[index].name;
                          _opened = false;
                        });
                        widget.onSelected(value);
                      },
                    )
                  ]
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
