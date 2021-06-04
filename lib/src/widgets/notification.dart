import 'package:flutter/material.dart';

class AppNotification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      clipBehavior: Clip.antiAlias,
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
              'Sigue con tu curso',
              style: Theme.of(context)
                  .primaryTextTheme
                  .headline2
                  ?.copyWith(color: Colors.redAccent, fontSize: 20),
              overflow: TextOverflow.fade,
            ),
          ],
        ),
      ),
    );
  }
}
