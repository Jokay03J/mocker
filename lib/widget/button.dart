import 'package:animated_styled_widget/animated_styled_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:mocker/widget/system.dart';

final _baseStyle = Style(
  mouseCursor: SystemMouseCursors.click,
  padding: const EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 16),
  shapeBorder: RectangleShapeBorder(
      borderRadius:
          DynamicBorderRadius.all(DynamicRadius.circular(4.toPXLength))),
);

class BrandPrimaryButton extends StatelessWidget {
  const BrandPrimaryButton(
      {super.key, required this.child, required this.onPress, this.icon});
  final Widget child;
  final IconData? icon;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    final primaryStyle = _baseStyle.copyWith(
      textStyle: DynamicTextStyle(
          letterSpacing: 0.toPXLength,
          fontSize: Dimension.min(14.toPXLength, 14.toPXLength),
          fontWeight: FontWeight.w600,
          color: Colors.white),
      backgroundDecoration: BoxDecoration(color: Colors.brand[600]),
    );

    final primaryHoveredStyle = primaryStyle.copyWith(
        backgroundDecoration: BoxDecoration(color: Colors.brand[700]));

    final primaryFocusedStyle = primaryStyle.copyWith(
        backgroundDecoration: BoxDecoration(color: Colors.brand[800]));

    return StyledButton.builder(
      style: primaryStyle,
      hoveredStyle: primaryHoveredStyle,
      pressedStyle: primaryFocusedStyle,
      curve: Curves.easeInOut,
      duration: const Duration(milliseconds: 200),
      onPressed: onPress,
      builder: (context, state) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: Wrap(
            spacing: 8,
            children: [
              if (icon != null) ...[
                Icon(
                  icon,
                  color: Colors.white,
                  size: 16,
                )
              ],
              child
            ],
          ),
        );
      },
    );
  }
}

class BrandSecondaryButton extends StatelessWidget {
  const BrandSecondaryButton(
      {super.key, required this.child, required this.onPress, this.icon});
  final Widget child;
  final IconData? icon;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    final secondaryStyle = _baseStyle.copyWith(
      textStyle: DynamicTextStyle(
          letterSpacing: 0.toPXLength,
          fontSize: Dimension.min(14.toPXLength, 14.toPXLength),
          fontWeight: FontWeight.w600,
          color: Colors.brand[700]),
      backgroundDecoration: BoxDecoration(color: Colors.brand[50]),
    );

    final secondaryHoveredStyle = secondaryStyle.copyWith(
        backgroundDecoration: BoxDecoration(color: Colors.brand[100]));

    final secondaryFocusedStyle = secondaryStyle.copyWith(
        backgroundDecoration: BoxDecoration(color: Colors.brand[200]));

    return StyledButton.builder(
      style: secondaryStyle,
      hoveredStyle: secondaryHoveredStyle,
      pressedStyle: secondaryFocusedStyle,
      curve: Curves.easeInOut,
      duration: const Duration(milliseconds: 200),
      onPressed: onPress,
      builder: (context, state) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: Wrap(
            spacing: 8,
            children: [
              if (icon != null) ...[
                Icon(
                  icon,
                  color: Colors.brand[700],
                  size: 16,
                )
              ],
              child
            ],
          ),
        );
      },
    );
  }
}

class DangerPrimaryButton extends StatelessWidget {
  const DangerPrimaryButton(
      {super.key, required this.child, required this.onPress, this.icon});
  final Widget child;
  final IconData? icon;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    final secondaryStyle = _baseStyle.copyWith(
      textStyle: DynamicTextStyle(
          letterSpacing: 0.toPXLength,
          fontSize: Dimension.min(14.toPXLength, 14.toPXLength),
          fontWeight: FontWeight.w600,
          color: Colors.white),
      backgroundDecoration: BoxDecoration(color: Colors.error[600]),
    );

    final secondaryHoveredStyle = secondaryStyle.copyWith(
        backgroundDecoration: BoxDecoration(color: Colors.error[700]));

    final secondaryFocusedStyle = secondaryStyle.copyWith(
        backgroundDecoration: BoxDecoration(color: Colors.error[800]));

    return StyledButton.builder(
      style: secondaryStyle,
      hoveredStyle: secondaryHoveredStyle,
      pressedStyle: secondaryFocusedStyle,
      curve: Curves.easeInOut,
      duration: const Duration(milliseconds: 200),
      onPressed: onPress,
      builder: (context, state) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: Wrap(
            spacing: 8,
            children: [
              if (icon != null) ...[
                Icon(
                  icon,
                  color: Colors.white,
                  size: 16,
                )
              ],
              child
            ],
          ),
        );
      },
    );
  }
}

class DangerSecondaryButton extends StatelessWidget {
  const DangerSecondaryButton(
      {super.key, required this.child, required this.onPress, this.icon});
  final Widget child;
  final IconData? icon;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    final secondaryStyle = _baseStyle.copyWith(
      textStyle: DynamicTextStyle(
          letterSpacing: 0.toPXLength,
          fontSize: Dimension.min(14.toPXLength, 14.toPXLength),
          fontWeight: FontWeight.w600,
          color: Colors.error[800]),
      backgroundDecoration: BoxDecoration(color: Colors.error[50]),
    );

    final secondaryHoveredStyle = secondaryStyle.copyWith(
        backgroundDecoration: BoxDecoration(color: Colors.error[100]));

    final secondaryFocusedStyle = secondaryStyle.copyWith(
        backgroundDecoration: BoxDecoration(color: Colors.error[200]));

    return StyledButton.builder(
      style: secondaryStyle,
      hoveredStyle: secondaryHoveredStyle,
      pressedStyle: secondaryFocusedStyle,
      curve: Curves.easeInOut,
      duration: const Duration(milliseconds: 200),
      onPressed: onPress,
      builder: (context, state) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: Wrap(
            spacing: 8,
            children: [
              if (icon != null) ...[
                Icon(
                  icon,
                  color: Colors.error[800],
                  size: 16,
                )
              ],
              child
            ],
          ),
        );
      },
    );
  }
}

class NeutralPrimaryButton extends StatelessWidget {
  const NeutralPrimaryButton(
      {super.key, required this.child, required this.onPress, this.icon});
  final Widget child;
  final IconData? icon;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    final secondaryStyle = _baseStyle.copyWith(
        textStyle: DynamicTextStyle(
            letterSpacing: 0.toPXLength,
            fontSize: Dimension.min(14.toPXLength, 14.toPXLength),
            fontWeight: FontWeight.w600,
            color: Colors.neutral[700]),
        backgroundDecoration: BoxDecoration(color: Colors.defaultBackground),
        shapeBorder: RoundedRectangleShapeBorder(
            borderSides: RectangleBorderSides.all(
                DynamicBorderSide(color: Colors.neutralBorder)),
            borderRadius:
                DynamicBorderRadius.all(DynamicRadius.circular(4.toPXLength))));

    final secondaryHoveredStyle = secondaryStyle.copyWith(
        backgroundDecoration: BoxDecoration(color: Colors.neutral[50]));

    final secondaryFocusedStyle = secondaryStyle.copyWith(
        backgroundDecoration: BoxDecoration(color: Colors.neutral[100]));

    return StyledButton.builder(
      style: secondaryStyle,
      hoveredStyle: secondaryHoveredStyle,
      pressedStyle: secondaryFocusedStyle,
      curve: Curves.easeInOut,
      duration: const Duration(milliseconds: 200),
      onPressed: onPress,
      builder: (context, state) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: Wrap(
            spacing: 8,
            children: [
              if (icon != null) ...[
                Icon(
                  icon,
                  color: Colors.neutral[700],
                  size: 16,
                )
              ],
              child
            ],
          ),
        );
      },
    );
  }
}

class NeutralSecondaryButton extends StatelessWidget {
  const NeutralSecondaryButton(
      {super.key, required this.child, required this.onPress, this.icon});
  final Widget child;
  final IconData? icon;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    final secondaryStyle = _baseStyle.copyWith(
        textStyle: DynamicTextStyle(
            letterSpacing: 0.toPXLength,
            fontSize: Dimension.min(14.toPXLength, 14.toPXLength),
            fontWeight: FontWeight.w600,
            color: Colors.neutral[700]),
        backgroundDecoration: BoxDecoration(color: Colors.neutral[50]));

    final secondaryHoveredStyle = secondaryStyle.copyWith(
        backgroundDecoration: BoxDecoration(color: Colors.neutral[100]));

    final secondaryFocusedStyle = secondaryStyle.copyWith(
        backgroundDecoration: BoxDecoration(color: Colors.neutral[200]));

    return StyledButton.builder(
      style: secondaryStyle,
      hoveredStyle: secondaryHoveredStyle,
      pressedStyle: secondaryFocusedStyle,
      curve: Curves.easeInOut,
      duration: const Duration(milliseconds: 200),
      onPressed: onPress,
      builder: (context, state) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: Wrap(
            spacing: 8,
            children: [
              if (icon != null) ...[
                Icon(
                  icon,
                  color: Colors.neutral[700],
                  size: 16,
                )
              ],
              child
            ],
          ),
        );
      },
    );
  }
}
