import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Cat extends StatelessWidget {
  const Cat(
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
          height: 170.h,
          width: 150.w,
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
                width: 130.w,
              ),
              Text(
                text,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 28),
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
