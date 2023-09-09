import 'package:flutter/material.dart';

import '../../../cubit/cubit.dart';

class AppBarCW extends StatefulWidget {
  const AppBarCW({super.key});

  @override
  State<AppBarCW> createState() => _AppBarCWState();
}

class _AppBarCWState extends State<AppBarCW> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: AlignmentDirectional.center,
          height: 200,
          decoration: const BoxDecoration(
            color: Color(0Xff9E6F21),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
            ),
          ),
          child: const Text(
            "''فَسَبِّحْ بِحَمْدِ رَبِّكَ''",
            style: TextStyle(
              color: Colors.white,
              fontSize: 50,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {
                CounterCubit.get(context).zero();
              },
              icon: const Icon(
                Icons.restart_alt,
                size: 50,
                color: Color(0Xff9E6F21),
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                CounterCubit.get(context).changev();
                CounterCubit.get(context).vibrate =
                    !CounterCubit.get(context).vibrate;
              },
              icon: const Icon(
                Icons.vibration,
                size: 50,
                color: Color(0Xff9E6F21),
              ),
            ),
            const SizedBox(
              width: 25,
            )
          ],
        ),
      ],
    );
  }
}
