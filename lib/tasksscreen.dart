import 'package:endurance_fitness/endurance_animations.dart';
import 'package:endurance_fitness/endurance_theme.dart';
import 'package:endurance_fitness/endurance_util.dart';
import 'package:endurance_fitness/endurance_widgets.dart';

//import '../auth/auth_util.dart';
//import '../backend/backend.dart';

import 'package:endurance_fitness/create_task_new_widget.dart';
import 'package:endurance_fitness/custom_toggle_icon.dart';
import 'package:endurance_fitness/empty_list_tasks_widget.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:endurance_fitness/loginscreen.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class MyTasksWidget extends StatefulWidget {
  const MyTasksWidget({Key? key}) : super(key: key);

  @override
  _MyTasksWidgetState createState() => _MyTasksWidgetState();
}

class _MyTasksWidgetState extends State<MyTasksWidget>
    with TickerProviderStateMixin {
  /*
  PagingController<DocumentSnapshot?, ToDoListRecord>? _pagingController;
  Query? _pagingQuery;
  List<StreamSubscription?> _streamSubscriptions = [];
  */

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      //hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 70),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
  };

  @override
  void initState() {
    super.initState();
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );
  }

  @override
  void dispose() {
    /*
    _streamSubscriptions.forEach((s) => s?.cancel());
    */
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Color(0xFF171717),
          automaticallyImplyLeading: false,
          flexibleSpace: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(3, 3, 3, 3),
            child: Text(
              '', //'ENDURANCE',
              textAlign: TextAlign.center,
              style: EnduranceTheme.of(context).subtitle1.override(
                    fontFamily: 'Outfit',
                    color: EnduranceTheme.of(context).primaryColor,
                    fontWeight: FontWeight.w300,
                  ),
            ),
          ),
          actions: [],
          elevation: 2,
        ),
      ),
      backgroundColor: EnduranceTheme.of(context).primaryBackground,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            barrierColor: Color(0x230E151B),
            context: context,
            builder: (context) {
              return Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: Container(
                  height: MediaQuery.of(context).size.height * 1,
                  child: CreateTaskNewWidget(),
                ),
              );
            },
          ).then((value) => setState(() {}));
        },
        backgroundColor: EnduranceTheme.of(context).darkBG,
        elevation: 8,
        child: Icon(
          Icons.add_rounded,
          color: EnduranceTheme.of(context).primaryWhite,
          size: 28,
        ),
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: EnduranceTheme.of(context).secondaryBackground,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                'assets/page__bg.jpg',
              ).image,
            ),
            shape: BoxShape.rectangle,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Scheduled Tasks',
                      style: EnduranceTheme.of(context).subtitle2.override(
                            fontFamily: 'Outfit',
                            fontSize: 24,
                          ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 400,
                width: 300,
                color: Colors.red,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LoginWidget()));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      // Change button text when light changes state.
                      child: Text('Empty'),
                    ),
                  ),
                ),
              ),
              /*
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                  child:
                      PagedListView<DocumentSnapshot<Object?>?, ToDoListRecord>(
                    pagingController: () {
                      final Query<Object?> Function(Query<Object?>)
                          queryBuilder = (toDoListRecord) => toDoListRecord
                              .where('user', isEqualTo: currentUserReference)
                              .where('toDoState', isEqualTo: false)
                              .orderBy('toDoDate');
                      if (_pagingController != null) {
                        final query = queryBuilder(ToDoListRecord.collection);
                        if (query != _pagingQuery) {
                          // The query has changed
                          _pagingQuery = query;
                          _streamSubscriptions.forEach((s) => s?.cancel());
                          _streamSubscriptions.clear();
                          _pagingController!.refresh();
                        }
                        return _pagingController!;
                      }

                      _pagingController = PagingController(firstPageKey: null);
                      _pagingQuery = queryBuilder(ToDoListRecord.collection);
                      _pagingController!
                          .addPageRequestListener((nextPageMarker) {
                        queryToDoListRecordPage(
                          queryBuilder: (toDoListRecord) => toDoListRecord
                              .where('user', isEqualTo: currentUserReference)
                              .where('toDoState', isEqualTo: false)
                              .orderBy('toDoDate'),
                          nextPageMarker: nextPageMarker,
                          pageSize: 25,
                          isStream: true,
                        ).then((page) {
                          _pagingController!.appendPage(
                            page.data,
                            page.nextPageMarker,
                          );
                          final streamSubscription =
                              page.dataStream?.listen((data) {
                            final itemIndexes = _pagingController!.itemList!
                                .asMap()
                                .map((k, v) => MapEntry(v.reference.id, k));
                            data.forEach((item) {
                              final index = itemIndexes[item.reference.id];
                              final items = _pagingController!.itemList!;
                              if (index != null) {
                                items.replaceRange(index, index + 1, [item]);
                                _pagingController!.itemList = {
                                  for (var item in items) item.reference: item
                                }.values.toList();
                              }
                            });
                            setState(() {});
                          });
                          _streamSubscriptions.add(streamSubscription);
                        });
                      });
                      return _pagingController!;
                    }(),
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    builderDelegate: PagedChildBuilderDelegate<ToDoListRecord>(
                      // Customize what your widget looks like when it's loading the first page.
                      firstPageProgressIndicatorBuilder: (_) => Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(
                            color: EnduranceTheme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      noItemsFoundIndicatorBuilder: (_) => Center(
                        child: EmptyListTasksWidget(),
                      ),
                      itemBuilder: (context, _, listViewIndex) {
                        final listViewToDoListRecord =
                            _pagingController!.itemList![listViewIndex];
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
                          child: InkWell(
                            onTap: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TaskDetailsWidget(
                                    toDoNote: listViewToDoListRecord.reference,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Color(0xA7131619),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 5,
                                    color: Color(0x230E151B),
                                    offset: Offset(0, 2),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 12, 0, 12),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            listViewToDoListRecord.toDoName!,
                                            style: EnduranceTheme.of(context)
                                                .title2
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color:
                                                      EnduranceTheme.of(context)
                                                          .lineColor,
                                                ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 4, 0, 0),
                                                child: Text(
                                                  dateTimeFormat(
                                                      'MMMEd',
                                                      listViewToDoListRecord
                                                          .toDoDate!),
                                                  style:
                                                      EnduranceTheme.of(context)
                                                          .subtitle2,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(4, 4, 0, 0),
                                                child: Text(
                                                  dateTimeFormat(
                                                      'jm',
                                                      listViewToDoListRecord
                                                          .toDoDate!),
                                                  style:
                                                      EnduranceTheme.of(context)
                                                          .subtitle2,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 12, 0),
                                        child: ToggleIcon(
                                          onPressed: () async {
                                            final toDoListUpdateData = {
                                              'toDoState':
                                                  !listViewToDoListRecord
                                                      .toDoState!,
                                            };
                                            await listViewToDoListRecord
                                                .reference
                                                .update(toDoListUpdateData);
                                          },
                                          value:
                                              listViewToDoListRecord.toDoState!,
                                          onIcon: Icon(
                                            Icons.check_circle,
                                            color: EnduranceTheme.of(context)
                                                .primaryColor,
                                            size: 25,
                                          ),
                                          offIcon: Icon(
                                            Icons.radio_button_off,
                                            color: EnduranceTheme.of(context)
                                                .secondaryText,
                                            size: 25,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ).animated(
                              [animationsMap['containerOnPageLoadAnimation']!]),
                        );
                      },
                    ),
                  ),
                ),
              ),*/
            ],
          ),
        ),
      ),
      /*
        body: FutureBuilder<List<User>>(
          future: readUsers().first,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong! ${snapshot.error}');
            } else if (snapshot.hasData) {
              final users = snapshot.data!;

              return ListView(
                children: users.map(buildUser).toList(),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ) */ /*
      body: FutureBuilder<List<Task>>(
        future: readTasks().first,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong! ${snapshot.error}');
          } else if (snapshot.hasData) {
            final tasks = snapshot.data!;

            return ListView(
              children: tasks.map(buildTask).toList(),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),*/
    );
  }
}

Widget buildUser(User user) => ListTile(
      leading: CircleAvatar(child: Text('o')),
      title: Text(user.name),
      subtitle: Text(user.email),
    );

Stream<List<User>> readUsers() => FirebaseFirestore.instance
    .collection('appUsers')
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());

Future<User?> readUser(String sID) async {
  final docUser = FirebaseFirestore.instance.collection('users').doc(sID);
  final snapshot = await docUser.get();

  if (snapshot.exists) {
    return User.fromJson(snapshot.data()!);
  }
}

//---------------------end list users
class User {
  String id;
  final String email;
  final String name;
  final String password;

  User({
    this.id = '',
    required this.email,
    required this.name,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'name': name,
        'password': password,
      };

  static User fromJson(Map<String, dynamic> json) => User(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      password: json['password']);
}

Widget buildTask(Task taskname) => ListTile(
      leading: CircleAvatar(child: Text('o')),
      title: Text(taskname.task),
      subtitle: Text(taskname.email),
    );

Stream<List<Task>> readTasks() =>
    FirebaseFirestore.instance.collection('tasks').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Task.fromJson(doc.data())).toList());

Future<Task?> readTask(String sID) async {
  final docUser = FirebaseFirestore.instance.collection('tasks').doc(sID);
  final snapshot = await docUser.get();

  if (snapshot.exists) {
    return Task.fromJson(snapshot.data()!);
  }
}

class Task {
  String id;
  final String email;
  final String task;
  final String taskNum;

  Task({
    this.id = '',
    required this.email,
    required this.task,
    required this.taskNum,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'task': task,
        'taskNum': taskNum,
      };

  static Task fromJson(Map<String, dynamic> json) => Task(
      id: json['id'] ?? '',
      email: json['email'] ?? '',
      task: json['task'] ?? '',
      taskNum: json['taskNum'] ?? '');
}
