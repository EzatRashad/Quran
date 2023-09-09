import 'package:flutter/material.dart';

import '../../../cubit/mood_cubit.dart';


AppBar appbarw(context) {
  return AppBar(
    leading: const Text(
      "",
    ),
    title: const Text(
      "السلام عليكم",
    ),
    centerTitle: true,
    actions: [
      IconButton(
        onPressed: () {
          MoodCubit.get(context).changeMood();
        },
        icon: const Icon(
          Icons.brightness_4_outlined,
          size: 45,
        ),
      ),
      const SizedBox(
        width: 15,
      )
    ],
  );
}
