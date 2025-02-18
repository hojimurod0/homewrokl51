import 'package:flutter/material.dart';
import 'package:settings_page/models/todo_model.dart';

class TodosWidget extends StatefulWidget {
  final Function() onTogglePressed;
  final Function() onDeletePressed;
  final Function() onEditPressed;
  final List<Todo> todos;
  final int index;

  const TodosWidget({
    super.key,
    required this.onTogglePressed,
    required this.onDeletePressed,
    required this.onEditPressed,
    required this.todos,
    required this.index,
  });

  @override
  State<TodosWidget> createState() => _TodosWidgetState();
}

class _TodosWidgetState extends State<TodosWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10, top: widget.index == 0 ? 15 : 0),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xff041955),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              IconButton(
                onPressed: widget.onTogglePressed,
                icon: Icon(widget.todos[widget.index].isDone
                    ? Icons.check_circle
                    : Icons.circle),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Title: ${widget.todos[widget.index].todoTitle}',
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(
                    'Date: ${widget.todos[widget.index].todoCreatedDate.split(' ')[0]}',
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            width: 50,
            child: Text(widget.todos[widget.index].todoDescription),
          ),
          Row(
            children: <Widget>[
              IconButton(
                onPressed: widget.onEditPressed,
                icon: const Icon(Icons.edit),
              ),
              IconButton(
                onPressed: widget.onDeletePressed,
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
