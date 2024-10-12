/// Documentation
///
/// bottom_navbar_with_indicator library.
library bottom_navbar_with_indicator;

import 'package:flutter/material.dart';

import '../../../data/model/bottom_nav_model.dart';

/// Documentation
///
/// enum's for indicator type.
enum IndicatorType { top, bottom }

/// Documentation
///
/// customer line indicator bottom navigation bar class.
class CustomLineIndicatorBottomNavbar extends StatelessWidget {
  final Color? backgroundColor;
  final List<CustomBottomBarItems> customBottomBarItems;
  final Color? selectedColor;
  final Color? unSelectedColor;
  final double unselectedFontSize;
  final Color? splashColor;
  final int currentIndex;
  final bool enableLineIndicator;
  final double lineIndicatorWidth;
  final IndicatorType indicatorType;
  final Function(int) onTap;
  final double selectedFontSize;
  final double selectedIconSize;
  final double unselectedIconSize;
  final LinearGradient? gradient;
  final TextStyle? selectedLabelStyle;
  final TextStyle? unselectedLabelStyle;

  const CustomLineIndicatorBottomNavbar({
    super.key,
    this.backgroundColor,
    this.selectedColor,
    required this.customBottomBarItems,
    this.unSelectedColor,
    this.unselectedFontSize = 11,
    this.selectedFontSize = 12,
    this.selectedIconSize = 20,
    this.unselectedIconSize = 15,
    this.splashColor,
    this.currentIndex = 0,
    required this.onTap,
    this.enableLineIndicator = true,
    this.lineIndicatorWidth = 3,
    this.indicatorType = IndicatorType.top,
    this.gradient,
    this.selectedLabelStyle,
    this.unselectedLabelStyle,
  });

  /// body of nav bar.
  @override
  Widget build(BuildContext context) {
    final BottomNavigationBarThemeData bottomTheme =
        BottomNavigationBarTheme.of(context);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor ?? bottomTheme.backgroundColor,
        gradient: gradient,
      ),
      child: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            for (int i = 0; i < customBottomBarItems.length; i++) ...[
              Expanded(
                child: CustomLineIndicatorBottomNavbarItems(
                  selectedColor: selectedColor,
                  unSelectedColor: unSelectedColor,
                  icon: customBottomBarItems[i].icon,
                  label: customBottomBarItems[i].label,
                  unSelectedFontSize: unselectedFontSize,
                  selectedFontSize: selectedFontSize,
                  unselectedIconSize: unselectedIconSize,
                  selectedLabelStyle: selectedLabelStyle,
                  unselectedLabelStyle: unselectedLabelStyle,
                  selectedIconSize: selectedIconSize,
                  splashColor: splashColor,
                  currentIndex: currentIndex,
                  enableLineIndicator: enableLineIndicator,
                  lineIndicatorWidth: lineIndicatorWidth,
                  indicatorType: indicatorType,
                  index: i,
                  onTap: onTap,
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}

/// Documentation
///
/// custom bottom bar items model.

/// Documentation
///
/// custom line indicator bottom navbar items stateless widget.
class CustomLineIndicatorBottomNavbarItems extends StatelessWidget {
  /// pass icon with type IconData or Widget
  final dynamic icon;

  /// pass label with type .
  final String? label;
  final Color? selectedColor;
  final Color? unSelectedColor;
  final double unSelectedFontSize;
  final double selectedIconSize;
  final double unselectedIconSize;
  final double selectedFontSize;
  final Color? splashColor;
  final int? currentIndex;
  final int index;
  final Function(int) onTap;
  final bool enableLineIndicator;
  final double lineIndicatorWidth;
  final IndicatorType indicatorType;
  final TextStyle? selectedLabelStyle;
  final TextStyle? unselectedLabelStyle;

  const CustomLineIndicatorBottomNavbarItems({
    super.key,
    required this.icon,
    this.label,
    this.selectedColor,
    this.unSelectedColor,
    this.unSelectedFontSize = 11,
    this.selectedFontSize = 12,
    this.selectedIconSize = 20,
    this.unselectedIconSize = 15,
    this.splashColor,
    this.currentIndex,
    required this.onTap,
    required this.index,
    this.enableLineIndicator = true,
    this.lineIndicatorWidth = 3,
    this.indicatorType = IndicatorType.top,
    this.selectedLabelStyle,
    this.unselectedLabelStyle,
  });

  TextStyle _getLabelStyle(BuildContext context) {
    final bottomTheme = BottomNavigationBarTheme.of(context);

    if (currentIndex == index) {
      return selectedLabelStyle ??
          TextStyle(
            fontSize: selectedFontSize,
            color: selectedColor ?? bottomTheme.selectedItemColor,
          );
    } else {
      return unselectedLabelStyle ??
          TextStyle(
            fontSize: unSelectedFontSize,
            color: unSelectedColor ?? bottomTheme.unselectedItemColor,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBarThemeData bottomTheme =
        BottomNavigationBarTheme.of(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(right: 7),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: splashColor ?? Theme.of(context).splashColor,
            onTap: () {
              onTap(index);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7.0),
              decoration: BoxDecoration(
                border: enableLineIndicator
                    ? Border(
                        bottom: indicatorType == IndicatorType.bottom
                            ? BorderSide(
                                color: currentIndex == index
                                    ? selectedColor ??
                                        bottomTheme.selectedItemColor!
                                    : Colors.transparent,
                                width: lineIndicatorWidth,
                              )
                            : const BorderSide(color: Colors.transparent),
                        top: indicatorType == IndicatorType.top
                            ? BorderSide(
                                color: currentIndex == index
                                    ? selectedColor ??
                                        bottomTheme.selectedItemColor!
                                    : Colors.transparent,
                                width: lineIndicatorWidth,
                              )
                            : const BorderSide(color: Colors.transparent),
                      )
                    : null,
              ),

              // width: 70,
              // height: 60,
              child: Column(
                children: [
                  icon is Widget
                      ? icon
                      : Icon(
                          icon,
                          size: currentIndex == index
                              ? selectedIconSize
                              : unselectedIconSize,
                          color: currentIndex == index
                              ? selectedColor ?? bottomTheme.unselectedItemColor
                              : unSelectedColor,
                        ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    '$label',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: _getLabelStyle(context),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
