import 'package:counter/modules/counter_Screen/counter_screen.dart';
import 'package:counter/modules/qiblah/qiblah_main.dart';
import 'package:counter/modules/quran/quran.dart';
import 'package:counter/widgets/my_scaffold.dart';
import 'package:flutter/material.dart';

import '../azkar/azkar_Screen.dart';
import 'components/cat_Widget.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      mode: true,
      title: "السلام عليكم",
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 250,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/time.jpg",
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
          ),
          const SizedBox(height: 40),
          Row(
            children: [
              const SizedBox(width: 10),
              Cat(
                  image: "assets/images/koran.png",
                  text: "القران الكريم",
                  screen: const Quran()),
              const SizedBox(width: 20),
              Cat(
                  image: "assets/images/praying.png",
                  text: "الاذكار",
                  screen: const Azkar_home()),
              const SizedBox(width: 10),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const SizedBox(width: 10),
              Cat(
                  image: "assets/images/qibla.png",
                  text: "القبله",
                  screen: const Qiblah()),
              const SizedBox(width: 20),
              Cat(
                  image: "assets/images/beads.png",
                  text: "السبحه",
                  screen: const Count()),
              const SizedBox(width: 10),
            ],
          ),
        ],
      ),
    );
  }
}
