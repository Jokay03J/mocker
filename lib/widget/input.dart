import 'package:animated_styled_widget/animated_styled_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:mocker/widget/system.dart';

class Input extends StatefulWidget {
  const Input(
      {super.key,
      required this.controller,
      required this.label,
      this.keyboardType,
      this.onSubmit,
      this.validator});
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final void Function(String? value)? onSubmit;
  final String? Function(String? value)? validator;
  final String label;

  @override
  State<StatefulWidget> createState() => _InputState();
}

class _InputState extends State<Input> {
  final FocusNode focusNode = FocusNode();
  String? _hasError;

  final _inputStyle = Style(
      width: Dimension.min(200.toPXLength, 200.toPXLength),
      padding: const EdgeInsets.all(8),
      shapeBorder: RoundedRectangleShapeBorder(
          borderSides: RectangleBorderSides.all(
              DynamicBorderSide(color: Colors.neutralBorder)),
          borderRadius:
              DynamicBorderRadius.all(DynamicRadius.circular(5.toPXLength))));

  @override
  void initState() {
    super.initState();
    _hasError = null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: labelStyle,
        ),
        StyledContainer(
          style: _inputStyle,
          child: EditableText(
            controller: widget.controller,
            focusNode: focusNode,
            style: bodyStyle,
            cursorColor: Colors.defaultFont,
            backgroundCursorColor: Colors.defaultFont,
            selectionColor: Colors.brand[100],
            keyboardType: widget.keyboardType ?? TextInputType.text,
            onSubmitted: (String? value) {
              if (widget.validator != null) {
                final hasError = widget.validator!(value);
                setState(() {
                  _hasError = hasError;
                });
                if (hasError != null) {
                  focusNode.requestFocus();
                  return;
                }
              }
              if (widget.onSubmit != null) {
                widget.onSubmit!(value);
              }
            },
          ),
        ),
        if (_hasError != null) ...[
          Text(
            _hasError!,
            style: labelStyle.copyWith(color: Colors.error[700]),
          )
        ]
      ],
    );
  }
}
