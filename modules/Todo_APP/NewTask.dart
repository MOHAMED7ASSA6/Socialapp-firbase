import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/components.dart';
import '../../layout/Todo_app/Cubit/cubit.dart';
import '../../layout/Todo_app/Cubit/states.dart';


class  NewTask extends StatefulWidget {

  @override
  _NewTaskState createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  @override
  Widget build(BuildContext context)
  {

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state){},
      builder: (context, state){
        AppCubit cubit = AppCubit.get(context);
        return ListView.separated(
          itemBuilder: (context, index) => buildTaskItem(cubit.newTasks[index] , context),
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
          itemCount: cubit.newTasks.length,);
      },
    );
  }
}