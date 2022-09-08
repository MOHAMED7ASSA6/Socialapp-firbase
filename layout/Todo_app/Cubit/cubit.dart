import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

import 'package:untitled/layout/Todo_app/Cubit/states.dart';

import '../../../Network/local/Cache_helper.dart';
import '../../../modules/Todo_APP/NewTask.dart';
import '../../../modules/Todo_APP/New_archives.dart';
import '../../../modules/Todo_APP/done_tasks.dart';

class AppCubit extends Cubit<AppStates>
{
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  bool isBottomSheetShown = false;
  late Database database;
  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archivedTasks = [];
  IconData fabIcon = Icons.edit;
  // IconData? suffixIcon = Icons.visibility;
  int currentIndex = 0;
  // bool isPassword =true;
  List <Widget> Screens = [
    NewTask(),
    DoneTasks(),
    NewArchives(),
  ];

  List <String> Titles = [
    'NewTasks',
    'DoneTasks',
    'Archives',
  ];
  void changeIndex (int index)
  {
    currentIndex = index;
    emit(AppChangeBottomNabBarState());
  }

// void PassonPress(bool x)
// {
//   // isPassword = x;
//   isPassword = !isPassword;
//   suffixIcon = isPassword ?Icons.visibility:Icons.visibility_off;
//   emit(ShopIsPasswordState());
//
// }


  void IconChange({required IconData icon , required bool isShow,}) {
    fabIcon = icon;
    isBottomSheetShown = isShow;

    emit(AppChangeBottomNaBarIcon());
  }


  void createDatabase()
  {
    openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) {
        print('database created');
        database.execute(
            'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT )')
            .then((value) {
          print('table created');
        }).catchError((error) {
          print('Error When Creating Table: ${error.toString()}');
        });
      },
      onOpen: (database) {
        getDataFromDatabase(database);
        print('database opened');
      },
    ).then((value) {
      database = value;
      emit(AppCreateDatabaseState());
    });
  }

  insertToDatabase({
    required String title,
    required String time,
    required String date,
  }) async
  {
    await database.transaction((txn) async
    {
      txn.rawInsert('INSERT INTO tasks (title, time, date, status) VALUES("$title", "$time", "$date", "NEW")')
          .then((value) {
        print('$value inserted successfully');
        emit(AppInsertDatabaseState());

        getDataFromDatabase(database);
      }).catchError((error) {
        print('Error when inserting new record ${error.toString()}');
      });
    });
  }
  void getDataFromDatabase(database)
  {
    newTasks = [];
    doneTasks = [];
    archivedTasks = [];

    database.rawQuery('SELECT * FROM tasks').then((value)
    {


      value.forEach((element) {
        if(element['status'] == 'NEW')
          newTasks.add(element);
        else if (element['status'] == 'done')
          doneTasks.add(element);
        else if (element['status'] == 'archive')
          archivedTasks.add(element);
      });
      emit(AppGetDatabaseState());
    }
    );
  }
  void updateData({
    required String status,
    required int id,
  }) async {
    return await database.rawUpdate(
      'UPDATE tasks SET status = ? WHERE id = ?',
      ['$status', '$id'],
    ).then((value) {
      getDataFromDatabase(database);
      emit(AppUpdatetDatabaseState());
    });

  }
  void DeleteFromData({
    required int id,
  }) async
  {
    return await database
        .rawDelete('DELETE FROM tasks WHERE id = ?',  ['$id']
    ).then((value) {
      getDataFromDatabase(database);
      emit(AppUpdatetDatabaseState());
    });
  }


  bool isDark = false;

  void changeAppMode({bool? fromShared})
  {
    if(fromShared != null)
      isDark = fromShared;
    else
      isDark = !isDark;
    cacheHelper.putData(key: 'isDark', value: isDark).then((value) => emit(AppChangeModeState()));
  }

}
