// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../enums/app_enums.dart';
import '../global/global.dart';
import '../../../providers/theme_provider.dart';
import '../constants/constants.dart';
import 'custom_icon.dart';
import 'text_widget.dart';

class CustomSliverAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomSliverAppBar({
    super.key,
    required this.title,
    this.actions = const [],
    this.prefixIcon,
    this.appBarHeight = 90.0,
    this.centerTitle = false,
    this.styleType,
    this.automaticallyImplyLeading,
  });

  final List<Widget> actions;
  final bool? automaticallyImplyLeading;
  final bool centerTitle;
  final double appBarHeight;
  final Widget? prefixIcon;
  final TextStyleType? styleType;
  final String title;

  @override
  _CustomSliverAppBarState createState() => _CustomSliverAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
}

class _CustomSliverAppBarState extends State<CustomSliverAppBar> {
  late ThemeProvider _provider;

  @override
  void initState() {
    super.initState();
    _provider = Provider.of<ThemeProvider>(context, listen: false);
  }

  void _toggleTheme() async {
    var pref = Aio.pref!;
    bool newTheme = !_provider.isDarkTheme;

    await _provider.setIsDarkTheme(newTheme);
    await pref.setBool('_isDarkTheme', newTheme);
    await _provider.setTheme(newTheme ? ThemeMode.dark : ThemeMode.light);
  }

  @override
  Widget build(BuildContext context) {
    var theme = Aio.theme.colorScheme;

    return Selector<ThemeProvider, bool>(
      selector: (context, provider) => provider.isDarkTheme,
      builder: (context, isDarkTheme, _) {
        return SliverAppBar(
          expandedHeight: widget.appBarHeight,
          floating: false,
          pinned: true, // Make the app bar pinned while scrolling
          snap: false,
          toolbarHeight: widget.appBarHeight,
          forceMaterialTransparency: true,
          automaticallyImplyLeading: false,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: EdgeInsets.zero,
            centerTitle: widget.centerTitle,
            title: Row(
              mainAxisAlignment: widget.centerTitle
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.start,
              children: [
                if (widget.prefixIcon != null) widget.prefixIcon!,
                const SizedBox(width: 8),
                Expanded(
                  child: TextWidget(
                    text: widget.title,
                    styleType: widget.styleType ?? TextStyleType.heading,
                    textAlign:
                        widget.centerTitle ? TextAlign.center : TextAlign.start,
                    color: !isDarkTheme
                        ? AppColors.backgroundColorDark
                        : AppColors.backgroundColorLight,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            ...widget.actions,
            IconButton(
              icon: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) {
                  return RotationTransition(
                    turns:
                        Tween<double>(begin: 0.0, end: 1.0).animate(animation),
                    child: child,
                  );
                },
                child: CustomIconWidget(
                  iconData:
                      isDarkTheme ? Icons.wb_sunny : Icons.nightlight_round,
                  color: !isDarkTheme
                      ? AppColors.backgroundColorDark
                      : AppColors.backgroundColorLight,
                ),
              ),
              onPressed: () {
                _toggleTheme();
              },
              tooltip: 'Toggle Theme',
              splashColor: theme.onPrimaryContainer.withOpacity(0.2),
              highlightColor: Colors.transparent,
            ),
          ],
        );
      },
    );
  }
}
