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
  final ValueNotifier<int> _selectedIndex = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          BottomNavigationBar(
            showUnselectedLabels: true,
            showSelectedLabels: true,
            selectedItemColor: Colors.blueAccent,
            unselectedItemColor: Colors.grey,
            backgroundColor: Colors.black,
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex.value,
            onTap: (index) {
              widget.child.goBranch(
                index,
                initialLocation: index == widget.child.currentIndex,
              );

              setState(() {
                _selectedIndex.value = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: Icon(
                  FluentIcons.timer_24_filled,
                ),
                label: 'Classic',
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: Icon(FluentIcons.compass_northwest_24_filled),
                label: 'Discover',
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: Icon(FluentIcons.document_text_24_filled),
                label: 'Personal',
              ),
              BottomNavigationBarItem(
                icon: Icon(FluentIcons.calendar_24_filled),
                label: 'Daily',
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: Icon(FluentIcons.person_24_filled),
                label: 'Me',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
