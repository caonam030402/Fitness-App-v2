import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({
    super.key,
    required this.child,
  });

  final StatefulNavigationShell child;

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  final _selectedIndex = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    // can be wrapped in the SafeArea:
    // body: SafeArea(
    //   child: widget.child,
    // ),

    return Scaffold(
      body: widget.child,
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          NavigationBar(
            selectedIndex: _selectedIndex.value,
            onDestinationSelected: (index) {
              widget.child.goBranch(
                index,
                initialLocation: index == widget.child.currentIndex,
              );
              setState(() {
                _selectedIndex.value = index;
              });
            },
            destinations: [
              NavigationDestination(
                icon: const Icon(FluentIcons.home_24_regular),
                selectedIcon: const Icon(FluentIcons.home_24_filled),
                label: 'Home',
              ),
              NavigationDestination(
                icon: const Icon(FluentIcons.search_24_regular),
                selectedIcon: const Icon(FluentIcons.search_24_filled),
                label: 'Search',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
