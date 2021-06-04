import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  CircleButton({this.iconRoute = '', this.name = ''});

  final String iconRoute;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              CircleBorder(side: BorderSide.none),
            ),
            backgroundColor: MaterialStateProperty.all(Colors.redAccent[100]),
          ),
          onPressed: () {},
          child: Stack(
            children: [
              Image(
                height: 60,
                image: AssetImage(iconRoute),
              ),
            ],
          ),
        ),
        Text(
          name,
          style: Theme.of(context)
              .primaryTextTheme
              .headline2
              ?.copyWith(color: Colors.redAccent),
        ),
      ],
    );
  }
}
