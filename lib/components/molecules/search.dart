import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Row(
        children: [
          Icon(FluentIcons.search_12_regular),
          Expanded(
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide(width: 0)),
                labelText: 'Password',
              ),
            ),
          )
        ],
      ),
    );
  }
}
