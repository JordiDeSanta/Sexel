import 'package:flutter/material.dart';

class AppNotification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
            backgroundColor: MaterialStateProperty.all(Colors.white),
          ),
      onPressed: () {},
      child: Container(
        child: Row(
          children: [
            Icon(
              Icons.notifications,
              color: Colors.redAccent,
            ),
            SizedBox(width: 5),
            Text(
              'A',
              style: Theme.of(context).primaryTextTheme.headline3,
            ),
          ],
        ),
      ),
    );
  }
}
