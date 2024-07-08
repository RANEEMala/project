
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/core/constant/style_string.dart';
import 'package:project/core/resources/color_palete.dart';
import 'package:project/feature/create_project/view/project_page.dart';
import 'package:project/feature/task_project/bloc/task_bloc.dart';
import 'package:project/feature/task_project/bloc/task_event.dart';
import 'package:project/feature/task_project/bloc/task_state.dart';

class TaskPage extends StatefulWidget {
 const  TaskPage({super.key});

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final List<String> tasks = [];
  final TextEditingController tasknamecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => taskBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
      backgroundColor: primary,
      body:  Column(
          children: [
             Padding(
            padding: const EdgeInsets.only(right: 450),
            child: Image.asset('assets/images/image3.png'),),
              
                 Padding(
                        padding: const EdgeInsets.only(right: 450),
                        child: Text(
                         'Tasks',style: header,
                          ),
                      ),
                    
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: tasknamecontroller,
                      decoration: InputDecoration(
                        hintText: 'Add Task',
                        fillColor: third,
                        filled: true,
                         enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.white,width: 8.0 )
                  
                ),
                
                      ),
                    ),
                  ),
                  
                
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(onTap: () {
                       if (tasknamecontroller.text.isNotEmpty) {
                                setState(() {
                               tasks.add(tasknamecontroller.text);
                               tasknamecontroller.clear();
                          });
                        }
                    },
                      child: Icon(Icons.add_circle, color: Colors.white,size: 40,)),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      decoration: BoxDecoration(
                         color: third,
                         borderRadius: BorderRadius.circular(10.0),
                         border: Border.all(color: Colors.white, width: 8.0),
                      ),
                      child:  Dismissible(
            background: Container(
              alignment: Alignment.centerLeft,
              child: const Icon(Icons.delete,color: Colors.white,),
              color: Colors.red,
            ),
           secondaryBackground: Container(
                        alignment: Alignment.centerRight,
                        child: const Icon(Icons.delete, color: Colors.white),
                        color: Colors.red,
                      ),
                      key: ValueKey(tasks[index]),
                      onDismissed: (direction) {
                        setState(() {
                          tasks.removeAt(index);
                        });
                      }, 
                      child: ListTile(
                        title: Text(tasks[index]),
                      ),
                    ),
                  ),
                );
              },
              
            ),
          ),
            SizedBox(height: 10), 
            BlocConsumer<taskBloc, taskState>(
                  listener: (context, state) {
                    if(state is ErrorState){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)),);
                    }else if (state is SuccessState){
                      Navigator.push(context, MaterialPageRoute(builder:(context) => MyWidget(),),);
                    }
                  },
                  builder: (context, state) {
                      if (state is InitialState) {
                        return InkWell(onTap: () {
                           context.read<taskBloc>().add(createTasks(
                                        tasks: tasks,
                                      ));
                        },
                          child: Container(
                          alignment: Alignment.center,
                          child: Text("Create",
                            style: TextStyle(fontSize: 30, color: primary),
                          ),
                          width: 508,
                          height: 58,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10), 
                            color: Color(0xFFECDAC4),
                          ),
                          ),);
                        }else if(state is ErrorState){
                          return Text(
                              state.message,
                              style: error,
                            );
                        }else if (state is ExceptionState){
                          return Text(
                              state.wrong,
                              style: error,
                            );
                        }else {
                        return const CircularProgressIndicator();
                        }}
                        ),
                      SizedBox(height: 20),
          ],
        ),
    );
      }
      ),
    );
  }
}


class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text("data"),
        ),
      ),
    );
  }
}