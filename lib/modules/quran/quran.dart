import 'package:counter/widgets/loading.dart';
import 'package:counter/widgets/my_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                            itemBuilder: (context, index) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Container(
                                padding: const EdgeInsets.all(7),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  children: [
                                    ListTile(
                                      title: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Text(
                                          cubit.cm!.chapters![index].nameArabic
                                              .toString(),
                                          textAlign: TextAlign.end,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge,
                                        ),
                                      ),
                                      trailing: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Text(cubit.cm!.chapters![index].id
                                              .toString()),
                                          const Image(
                                            image: AssetImage(
                                                'assets/images/star.png'),
                                            height: 40,
                                            width: 40,
                                            fit: BoxFit.contain,
                                          ),
                                        ],
                                      ),
                                      leading: Text(
                                        cubit.cm!.chapters![index]
                                            .revelationPlace
                                            .toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                      ),
                                      subtitle: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          const Text(
                                            'ايه',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.grey),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            cubit.cm!.chapters![index]
                                                .versesCount
                                                .toString(),
                                            style: const TextStyle(
                                                fontSize: 20,
                                                color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    VersesScreen(
                                                      notftha: cubit
                                                                      .cm!
                                                                      .chapters![
                                                                          index]
                                                                      .id ==
                                                                  1 ||
                                                              cubit
                                                                      .cm!
                                                                      .chapters![
                                                                          index]
                                                                      .id ==
                                                                  9
                                                          ? false
                                                          : true,
                                                      title: cubit
                                                          .cm!
                                                          .chapters![index]
                                                          .nameArabic
                                                          .toString(),
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
                      ),
          );
        },
      ),
    );
  }
}
