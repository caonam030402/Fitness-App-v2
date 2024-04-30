import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_ness/components/atoms/button.dart';
import 'package:fit_ness/components/organisms/card_setting_item.dart';
import 'package:fit_ness/constants/path_routes.dart';
import 'package:fit_ness/services/auth_service.dart';
import 'package:fit_ness/themes/app_colors.dart';
import 'package:fit_ness/themes/app_styles.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ListItem {
  final String title;
  final List<Item> items;

  ListItem({required this.title, required this.items});
}

class Item {
  final String name;
  final IconData icon;
  final Color color;

  Item({required this.name, required this.icon, required this.color});
}

final List<ListItem> listSetting = [
  ListItem(
    title: "",
    items: [
      Item(
          name: "My Profile",
          icon: Icons.person,
          color: AppColors.primaryColor),
      Item(
          name: "My Favorite",
          icon: Icons.favorite,
          color: AppColors.primaryColor),
    ],
  ),
  ListItem(
    title: "Setting",
    items: [
      Item(
          name: "Workout Setting",
          icon: FluentIcons.heart_12_filled,
          color: AppColors.secondaryColor),
      Item(
          name: "General Setting",
          icon: FluentIcons.heart_12_filled,
          color: AppColors.secondaryColor),
    ],
  ),
  ListItem(
    title: "Support us",
    items: [
      Item(
          name: "More App",
          icon: FluentIcons.heart_12_filled,
          color: Colors.grey),
      Item(
          name: "Remove Ads",
          icon: FluentIcons.heart_12_filled,
          color: Colors.grey),
      Item(
          name: "Rate us",
          icon: FluentIcons.heart_12_filled,
          color: Colors.grey),
      Item(
          name: "Feedback",
          icon: FluentIcons.heart_12_filled,
          color: Colors.grey),
    ],
  ),
];

class MeScreen extends StatelessWidget {
  const MeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: StreamBuilder(
          stream: AuthService.userStream,
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return const SizedBox();
            }

            final user = snapshot.data;

            return Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 80,
                  height: 80,
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: Image.network(fit: BoxFit.cover, '${user?.photoURL}'),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Wellcome, ${user?.displayName ?? 'Your Name'}!",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Column(
                  children: List.generate(listSetting.length, (index) {
                    var setting = listSetting[index];

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: setting.title == '' ? 0 : 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppStyles.paddingBothSides),
                          child: Text(
                            setting.title,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                        SizedBox(
                          height: setting.title == '' ? 0 : 10,
                        ),
                        Column(
                          children:
                              List.generate(setting.items.length, (index) {
                            final item = setting.items[index];
                            return CardSettingItem(
                              icon: item.icon,
                              name: item.name,
                              color: item.color,
                            );
                          }),
                        )
                      ],
                    );
                  }),
                ),
                SizedBox(
                  height: 20,
                ),
                Button(
                  title: 'Log out',
                  size: SizeButton.large,
                  onTap: () {
                    AuthService.logout();
                    context.push(PathRoute.splash);
                  },
                ),
                Text(
                  "Vision 1.21.1",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            );
          }),
    );
  }
}
