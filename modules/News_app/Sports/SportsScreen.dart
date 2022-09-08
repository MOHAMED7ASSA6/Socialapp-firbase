import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../components/components.dart';
import '../../../layout/New_app/Cubit/cubit.dart';
import '../../../layout/New_app/Cubit/states.dart';


class SportsScreen extends StatelessWidget {
  const SportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubitt, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var list = NewsCubitt.get(context).sports;
          return ConditionalBuilder(
              condition: list.length > 0,
              builder: (context) {
                return ListView.separated(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, indx) {
                      return buildArticleItem(list[indx],context);
                    },
                    separatorBuilder: (contex, index) {
                      return myDivider();
                    },
                    itemCount: 10);
              },
              fallback: (context) =>
                  Center(child: CircularProgressIndicator()));
        });
  }
}