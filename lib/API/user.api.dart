import 'dart:convert';

import 'package:fit_ness/constants/configs.dart';
import 'package:fit_ness/models/user.model.dart';
import 'package:fit_ness/utilities/remove_null_fields.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';

updateUserAPI({
  required User body,
  required String id,
  required BuildContext context,
}) async {
  try {
    Response res = await put(
      Uri.parse('${config.baseUrl}user/$id'),
      body: jsonEncode(removeNullFields(body.toJson())),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (res.statusCode == 200) {
      print("success");
    }
  } catch (e) {
    print(e);
  }
}
