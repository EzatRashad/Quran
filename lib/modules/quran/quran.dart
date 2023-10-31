import 'package:counter/widgets/loading.dart';
import 'package:counter/widgets/my_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../cubit/get_Quran/get_quran_cubit.dart';
import '../../cubit/get_Quran/get_quran_state.dart';
import '../../cubit/mood_cubit.dart';
import '../../widgets/error.dart';
import '../verses/verses.dart';

class Quran extends StatefulWidget {
  const Quran({super.key});

  @override
  State<Quran> createState() => _QuranState();
}

class _QuranState extends State<Quran> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetQuranCubit()..getChapterData(),
      child: BlocConsumer<GetQuranCubit, GetQuranState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = GetQuranCubit.get(context);

          return MyScaffold(
            title: "القران الكريم",
            body: state is QuranLoadingStates
                ? const Loading()
                : state is QuranGetErrorDataStates
                    ? const ErrorW()
                    : Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: MoodCubit.get(context).isdark
                                ? const AssetImage(
                                    "assets/images/bdark-web.png")
                                : const AssetImage(
                                    "assets/images/blight-web.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          child: ListView.builder(
                            controller: _scrollController,
                            cacheExtent: 200.0,
                            physics: const BouncingScrollPhysics(),
                            itemCount: cubit.cm!.chapters!.length,
                            itemBuilder: (context, index) => Container(
                              padding: const EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text(
                                        cubit.cm!.chapters![index].nameArabic
                                            .toString(),
                                        textAlign: TextAlign.end,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(fontSize: 28),
                                      ),
                                    ),
                                    trailing: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Text(cubit.cm!.chapters![index].id
                                            .toString()),
                                        Image(
                                          image: const AssetImage(
                                              'assets/images/star.png'),
                                          height: 40.h,
                                          width: 40.w,
                                          fit: BoxFit.contain,
                                        ),
                                      ],
                                    ),
                                    leading: Text(
                                      cubit.cm!.chapters![index].revelationPlace
                                                  .toString() ==
                                              "madinah"
                                          ? "مدنيه"
                                          : "مكيه",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(fontSize: 28),
                                    ),
                                    onTap: () {
                                      final res = cubit.cm?.chapters?[index];
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  VersesScreen(
                                                    notftha: res!.id ==
                                                                1 ||res.id ==
                                                                9
                                                        ? false
                                                        : true,
                                                    title: res.nameArabic?.toString() ??
                                                        '', count: res.versesCount??0, id: res.id??0,
                                                  )));
                                    },
                                  ),
                                  const Divider(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
          );
        },
      ),
    );
  }
}
