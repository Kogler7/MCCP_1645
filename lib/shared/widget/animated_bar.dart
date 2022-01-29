///自定义动态底部导航栏
import 'package:flutter/material.dart';
import 'package:mccp_1645/config/color.dart';

class AnimatedBottomBar extends StatelessWidget {
  final int selectedIndex;
  final double iconSize;
  final Color? backgroundColor;
  final bool showElevation;
  final Duration animateDuration;
  final List<AnimatedBarItem> items;
  final ValueChanged<int> onItemSelected;
  final double itemCornerRadius;
  final double containerHeight;

  const AnimatedBottomBar({
    Key? key,
    this.selectedIndex = 0,
    this.iconSize = 24,
    this.backgroundColor,
    this.showElevation = true,
    this.animateDuration = const Duration(milliseconds: 200),
    required this.items,
    required this.onItemSelected,
    this.itemCornerRadius = 24,
    this.containerHeight = 48,
  })  : assert(items.length >= 2 && items.length <= 5),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final bgColor = backgroundColor ?? Theme.of(context).bottomAppBarColor;

    return SafeArea(
      //异形屏幕适配
      child: Container(
        width: double.infinity,
        height: containerHeight,
        decoration: BoxDecoration(
          color: bgColor,
          boxShadow: [
            if (showElevation)
              const BoxShadow(
                color: Colors.black12,
                blurRadius: 2,
              )
          ],
        ),
        child: SafeArea(
          child: Container(
            width: double.infinity,
            height: containerHeight,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            //最外层水平边距加高了一点，避免边上图标有与屏幕边缘贴边的感觉，也让图标之间更紧凑些
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                items.length,
                (index) => GestureDetector(
                  child: _ItemWidget(
                    item: items[index],
                    isSelected: index == selectedIndex,
                    backgroundColor: bgColor,
                    animateDuration: animateDuration,
                    itemCornerRadius: itemCornerRadius,
                    iconSize: iconSize,
                  ),
                  onTap: () {
                    onItemSelected(index);
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ItemWidget extends StatelessWidget {
  final double iconSize;
  final bool isSelected;
  final AnimatedBarItem item;
  final Color backgroundColor;
  final double itemCornerRadius;
  final Duration animateDuration;

  const _ItemWidget({
    Key? key,
    required this.iconSize,
    required this.isSelected,
    required this.item,
    required this.backgroundColor,
    required this.itemCornerRadius,
    required this.animateDuration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      //语义（可忽略）
      container: true,
      selected: isSelected,
      child: AnimatedContainer(
        width: isSelected ? 100 : 50,
        height: double.maxFinite,
        duration: animateDuration,
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: isSelected
              ? item.activeColor.withOpacity(0.2)
              : backgroundColor.withOpacity(0),
          borderRadius: BorderRadius.circular(itemCornerRadius),
        ),
        child: Container(
          width: isSelected ? 100 : 50,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              IconTheme(
                data: IconThemeData(
                  size: iconSize,
                  color: isSelected ? item.activeColor : item.inactiveColor,
                ),
                child: item.icon,
              ),
              isSelected
                  ? Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: DefaultTextStyle.merge(
                          child: item.title,
                          style: TextStyle(
                            color: item.activeColor,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  : const Text('')
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedBarItem {
  final Widget icon;
  final Widget title;
  final Color activeColor;
  final Color inactiveColor;

  AnimatedBarItem({
    required this.icon,
    required this.title,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.grey,
  });
}
