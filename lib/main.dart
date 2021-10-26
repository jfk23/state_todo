import 'package:flutter/material.dart';
import 'package:state_todo/plan_provider.dart';
import 'package:state_todo/views/plan_creator_screen.dart';
import 'views/plan_screen.dart';

void main() => runApp(const TodoApp());

class TodoApp extends StatelessWidget {
  const TodoApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlanProvider(
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.purple),
        home: const PlanCreatorScreen(),
        
      ),
    );
  }
}
