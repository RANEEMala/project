import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/core/constant/style_string.dart';
import 'package:project/core/resources/color_palete.dart';
import 'package:project/feature/create_project/bloc/project_bloc.dart';
import 'package:project/feature/create_project/bloc/project_event.dart';
import 'package:project/feature/create_project/bloc/project_state.dart';
import 'package:project/feature/task_project/view/task_page.dart';
import 'package:project/model/project_model.dart';


class projectPage extends StatelessWidget {
   projectPage({super.key});

  final TextEditingController projectnameController = TextEditingController();
  final TextEditingController projectscriptController = TextEditingController();
  @override
   Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProjectBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
            backgroundColor: primary,
            body: Column(
                  children: [
                     Padding(
                        padding: const EdgeInsets.only(right: 450),
                        child: Image.asset(
                          'assets/images/image3.png', 
                        ),),
              
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 350),
                        child: Text(
                         'Project name',style: header,
                          ),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: TextField(
                          controller: projectnameController,
                          maxLines: 2,
                            decoration: InputDecoration(
                                 filled: true,
                                 fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    )),       
                          ),
                      ),
                    ),
                     Flexible(
                       child: Padding(
                        padding: const EdgeInsets.only(right: 350),
                        child: Text(
                         'Project script',style: header,
                          ),
                    ),
                     ),
                    Flexible(
                      flex: 6,
                      child: Padding(
                        padding: const EdgeInsets.all(30),
                        child: TextField(
                          controller: projectscriptController,
                          maxLines: 12,
                         decoration: InputDecoration(
                                       filled: true,
                                       fillColor: Colors.white,
                                      enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                        )),
                        ),
                      ),
                    ),
                  BlocConsumer<ProjectBloc, ProjectState>(
                  listener: (context, state) {
                    if(state is ErrorState){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)),);
                    }else if (state is SuccessState){
                      Navigator.push(context, MaterialPageRoute(builder:(context) => TaskPage(),),);
                    }
                  },
                  builder: (context, state) {
                    if (state is InitialState) {
                    return  InkWell(onTap: () {
                         context.read<ProjectBloc>().add(createProject(
                          project: ProjectModel(
                          projectName:projectnameController.text,
                          projectDescription:projectscriptController.text,
                          projectStatus:"NEW"),),);
                          },
                          child: Container(
                        alignment: Alignment.center,
                        child: Text("Create",
                       style: TextStyle(fontSize: 30, color: primary),
                        ),
                        width: 308,
                        height: 58,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10), 
                          color: Color(0xFFECDAC4),
                        ),
                      ),
                    ); 
                        }else if(state is ErrorState){
                          return Text(
                              state.message,
                              style:error,
                            );
                        }else if (state is ExceptionState){
                          return Text(
                              state.wrong,
                              style: error,
                            );
                        }else {
                        return const CircularProgressIndicator();
                        }
                       },
                    ),
                  ],
                ),
          );
        }
      ),
    );
  }
}

