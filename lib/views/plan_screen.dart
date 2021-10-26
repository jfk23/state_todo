import '../models/data_layer.dart';
import 'package:flutter/material.dart';

class PlanScreen extends StatefulWidget {
  final Plan plan;
  const PlanScreen({Key? key, required this.plan}) : super(key: key);

  @override
  _PlanScreenState createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  late ScrollController scrollController;
  Plan get plan => widget.plan;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()
      ..addListener(() {
        FocusScope.of(context).requestFocus(FocusNode());
      });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('To do list'),
      ),
      body: Column(
        children: [
          Expanded(child: _buildList()),
          SafeArea(child: Text(plan.completenessMessage))
        ],
      ),
      floatingActionButton: _buildAddTaskButton(),
    );
  }

  Widget _buildAddTaskButton() {
    
    return FloatingActionButton(
      onPressed: () {
        setState(() {
          plan.tasks.add(Task());
        });
      },
      child: const Icon(Icons.add),
    );
  }

  Widget _buildList() {
    
    return ListView.builder(
      // controller: scrollController,
      itemBuilder: (context, index) => _buildTaskTile(plan.tasks[index]),
      itemCount: plan.tasks.length,
    );
  }

  Widget _buildTaskTile(Task task) {
    return ListTile(
      leading: Checkbox(
        value: task.complete,
        onChanged: (selected) {
          setState(() {
            task.complete = selected!;
          });
        },
      ),
      title: TextField(
        
        onChanged: (text) {
          setState(() {
            task.description = text;
          });
        },
      ),
    );
  }
}
