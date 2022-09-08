import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../components/components.dart';
import '../../layout/Todo_app/Cubit/cubit.dart';
import '../../layout/Todo_app/Cubit/states.dart';

class  DoneTasks extends StatefulWidget {


  @override
  _DoneTasksState createState() => _DoneTasksState();
}

class _DoneTasksState extends State<DoneTasks> {
  @override


  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state){},
      builder: (context, state){
        AppCubit cubit = AppCubit.get(context);
        return ConditionalBuilder(
          condition: cubit.doneTasks.length > 0,
          builder:(context) => ListView.separated(
            itemBuilder: (context, index) => buildTaskItem(cubit.doneTasks[index] , context),
            separatorBuilder: (context, index) => Padding(
              padding: const EdgeInsetsDirectional.only(
                start: 20.0,
              ),
              child: Container(
                  width: double.infinity,
                  height: 1.0,
                  color: Colors.grey[300]
              ),
            ),
            itemCount: cubit.doneTasks.length,),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}