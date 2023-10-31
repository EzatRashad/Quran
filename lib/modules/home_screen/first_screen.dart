import 'package:counter/modules/counter_Screen/counter_screen.dart';
import 'package:counter/modules/qiblah/qiblah_main.dart';
import 'package:counter/modules/quran/quran.dart';
import 'package:counter/widgets/my_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../azkar/azkar_Screen.dart';
import 'components/cat_Widget.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      mode: true,
      title: "السلام عليكم",
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 200.h,
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
              SizedBox(height: 40.h),
              Row(
                children: [
                  SizedBox(width: 10.w),
                  const Cat(
                      image: "assets/images/koran.png",
                      text: "القران الكريم",
                      screen: Quran()),
                  SizedBox(width: 20.w),
                  const Cat(
                      image: "assets/images/praying.png",
                      text: "الاذكار",
                      screen: Azkar_home()),
                  SizedBox(width: 10.w),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  SizedBox(width: 10.w),
                  const Cat(
                      image: "assets/images/qibla.png",
                      text: "القبله",
                      screen: Qiblah()),
                  SizedBox(width: 20.w),
                  const Cat(
                      image: "assets/images/beads.png",
                      text: "السبحه",
                      screen: Count()),
                  SizedBox(width: 10.w),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
