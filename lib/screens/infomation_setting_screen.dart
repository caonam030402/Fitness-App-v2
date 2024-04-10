import 'package:fit_ness/components/templates_/infomation_user/choose_birth_year.dart';
import 'package:fit_ness/components/templates_/infomation_user/choose_gender.dart';
import 'package:fit_ness/components/templates_/infomation_user/choose_weight.dart';
import 'package:flutter/material.dart';

class InfomationSetting extends StatelessWidget {
  const InfomationSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text("1"),
          ),
      body: PageView(
        children: [ChooseWeight()],
      ),
    );
  }
}
