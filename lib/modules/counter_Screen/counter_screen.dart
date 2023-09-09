import 'package:counter/cubit/state.dart';
import 'package:counter/modules/counter_Screen/widgets/appbar.dart';
import 'package:counter/modules/counter_Screen/widgets/counter.dart';
import 'package:counter/modules/home_screen/first_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/cubit.dart';

class Count extends StatefulWidget {
  const Count({super.key});

  @override
  State<Count> createState() => _CountState();
}

class _CountState extends State<Count> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: const SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBarCW(),
                SizedBox(height: 80),
                CounterS(),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                //CounterCubit.get(context).changeColor();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Home(),
                    ));
              },
              backgroundColor: const Color(0Xff9E6F21),
              label: Icon(
                Icons.home,
                color: Theme.of(context).primaryColor,
                size: 35,
              )
              /*icon: Icon(
              Icons.add,
            color: Colors.orangeAccent,
          ),*/
              ),
        );
  }
}
