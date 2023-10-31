import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/get_Quran/get_quran_cubit.dart';
import '../../cubit/get_Quran/get_quran_state.dart';
import '../../widgets/error.dart';
import '../../widgets/loading.dart';
import '../../widgets/my_scaffold.dart';

class VersesScreen extends StatefulWidget {
  const VersesScreen({
    super.key,
    required this.title,
    required this.id,
    required this.count,
    required this.notftha,
  });
  final String title;
  final int id;
  final int count;
  final bool notftha;

  @override
  State<VersesScreen> createState() => _VersesScreenState();
}

class _VersesScreenState extends State<VersesScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => GetQuranCubit()..getVersesData(
          chapterId: widget.id,     versesCount: widget.count   ),
        child: BlocBuilder<GetQuranCubit, GetQuranState>(
          builder: (context, state) {
            var cubit = GetQuranCubit.get(context);

            return MyScaffold(
              title: widget.title,
              body: state is VersesLoadingStates
                  ? const Loading()
                  : state is VersesGetErrorDataStates
                      ? const ErrorW()
                      : Container(
                          padding: const EdgeInsets.all(8),
                          width: double.infinity,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                widget.notftha
                                    ? const Stack(
                                        alignment: Alignment.topCenter,
                                        children: [
                                          Text(
                                            "بِسۡمِ اللهِ الرَّحۡمٰنِ الرَّحِيۡمِ",
                                            style: TextStyle(
                                                fontSize: 35,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Image(
                                            image: AssetImage(
                                                'assets/images/bsm.png'),
                                            height: 85,
                                            width: 330,
                                            fit: BoxFit.cover,
                                          ),
                                        ],
                                      )
                                    : const Text(''),
                                Text(
                                  cubit.t!,
                                  textAlign: TextAlign.start,
                                  textDirection: TextDirection.rtl,
                                  style: const TextStyle(
                                      fontSize: 23, wordSpacing: 2.3),
                                ),
                              ],
                            ),
                          )),
            );
          },
        ));
  }
}
