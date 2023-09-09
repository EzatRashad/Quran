import 'package:flutter/material.dart';

class Cat extends StatelessWidget {
  Cat(
      {super.key,
      required this.screen,
      required this.text,
      required this.image});
  final Widget screen;
  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        child: Container(
          padding: const EdgeInsets.all(10),
          height: 200,
          width: 150,
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: Column(
            children: [
              Image(
                image: AssetImage(
                  image,
                ),
                fit: BoxFit.contain,
                width: 130,
              ),
              Text(
                text,
                style: Theme.of(context).textTheme.bodyText1,
              )
            ],
          ),
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => screen,
              ));
        },
      ),
    );
  }
}
