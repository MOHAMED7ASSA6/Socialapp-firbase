import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../components/components.dart';
import '../../../layout/New_app/Cubit/cubit.dart';
import '../../../layout/New_app/Cubit/states.dart';


class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context, {isearch = false}) {
    return BlocConsumer<NewsCubitt, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubitt.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(children: [
            Padding(
              padding: EdgeInsets.all(18),
              child: TextFormField(
                controller: searchController,
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  NewsCubitt.get(context).getSearch(value);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "search must not be empty";
                  } else {
                    isearch = true;
                    return null;
                  }
                },
                decoration: InputDecoration(
                    label: Text("Search"),
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder()),
              ),
            ),
            Expanded(
              child: ConditionalBuilder(
                  condition: list.length > 0,
                  builder: (context) {
                    return ListView.separated(
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, indx) {
                          return buildArticleItem(list[indx], context);
                        },
                        separatorBuilder: (contex, index) {
                          return myDivider();
                        },
                        itemCount: 10);
                  },
                  fallback: (context) => Center(
                      child: isearch == false
                          ? Container()
                          : CircularProgressIndicator())),
            ),
          ]),
        );
      },
    );
  }
}