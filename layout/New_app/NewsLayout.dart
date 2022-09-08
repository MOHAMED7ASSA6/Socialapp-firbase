import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/components.dart';
import '../../modules/News_app/Search/Search.dart';
import '../Todo_app/Cubit/cubit.dart';
import 'Cubit/cubit.dart';
import 'Cubit/states.dart';


class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubitt, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubitt.get(context);
          return Scaffold(
            body: cubit.screens[cubit.selectedIndex],
            appBar: AppBar(
              title: Text("News App"),
              actions: [
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    navigateTo(context, SearchScreen());
                  },
                ),
                IconButton(
                  icon: Icon(Icons.brightness_4_outlined),
                  onPressed: () {
                 //   AppCubit.get(context).changebottomnavbar();
                  },
                )
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.selectedIndex,
              items: cubit.bottomItems,
              onTap: (index) {
                cubit.changebottomnavbar(index);
              },
            ),
          );
        });
  }
}