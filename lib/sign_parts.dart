import 'package:flutter/material.dart';

import 'constrains.dart';

Widget loginAlertDialog(context, e) {
  return AlertDialog(
    title: Text(
      'エラー',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: defaultColor,
        fontWeight: FontWeight.bold,
      ),
    ),
    content: Text(
      e.toString(),
      style: TextStyle(),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              child: Text(
                "Cancel",
                style: TextStyle(
                  color: defaultColor,
                ),
              ),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              child: Text(
                "OK",
                style: TextStyle(
                  color: defaultColor,
                ),
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget mailAlertDialog(context, e) {
  return AlertDialog(
    title: Text(
      'エラー',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: defaultColor,
        fontWeight: FontWeight.bold,
      ),
    ),
    content: Text(
      'メールアドレスが既に使われています',
      style: TextStyle(),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              child: Text(
                "Cancel",
                style: TextStyle(
                  color: defaultColor,
                ),
              ),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              child: Text(
                "OK",
                style: TextStyle(
                  color: defaultColor,
                ),
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget passAlertDialog(context, e) {
  return AlertDialog(
    title: Text(
      'エラー',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: defaultColor,
        fontWeight: FontWeight.bold,
      ),
    ),
    content: Text(
      'パスワードは6文字以上にしてください',
      style: TextStyle(),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              child: Text(
                "Cancel",
                style: TextStyle(
                  color: defaultColor,
                ),
              ),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              child: Text(
                "OK",
                style: TextStyle(
                  color: defaultColor,
                ),
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget signInAlertDialog(context, e) {
  return AlertDialog(
    title: Text(
      'エラー',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: defaultColor,
        fontWeight: FontWeight.bold,
      ),
    ),
    content: alertText(e),
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              child: Text(
                "Cancel",
                style: TextStyle(
                  color: defaultColor,
                ),
              ),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              child: Text(
                "OK",
                style: TextStyle(
                  color: defaultColor,
                ),
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget alertText(e) {
  if (e.code == 'user-not-found') {
    return Text('ユーザーが見つかりませんでした');
  } else if (e.code == 'wrong-password') {
    return Text('パスワードが違います');
  }
  return Text('');
}
