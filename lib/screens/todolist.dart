import 'package:flutter/material.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/util/dbhelper.dart';
import 'package:todo_app/screens/tododetail.dart';

class TodoList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TodoListState();
}

class TodoListState extends State {
  DbHelper helper = DbHelper();
  List<Todo> todos;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    if (todos == null) {
      todos = new List<Todo>();
      getData();
    }
    return Scaffold(
      body: todoListItems(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateToDetail(Todo('', 3, '', "Family"));
        },
        tooltip: "Add new",
        child: new Icon(Icons.add),
      ),
    );
  }

  ListView todoListItems() {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: getColor(this.todos[position].priority),
              child: Text(
                getArrow(this.todos[position].priority),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  height: 0.8,
                  fontSize: 20,
                  color: getArrowColor(this.todos[position].priority),
                ),
              ),
            ),
            title: Text(this.todos[position].title),
            subtitle: Text(getTopicIcon(this.todos[position].topic) + " " + this.todos[position].topic + " by "
                + this.todos[position].date),
            onTap: () {
              debugPrint("Tapped on " + this.todos[position].id.toString());
              navigateToDetail(this.todos[position]);
            },
          ),
        );
      },
    );
  }

  void getData() {
    final dbFuture = helper.initializeDb();
    dbFuture.then((result) {
      final todosFuture = helper.getTodos();
      todosFuture.then((result) {
        List<Todo> todoList = List<Todo>();
        count = result.length;
        for (int i = 0; i < count; i++) {
          todoList.add(Todo.fromObject(result[i]));
          debugPrint(todoList[i].title);
        }
        setState(() {
          todos = todoList;
          count = count;
        });
        debugPrint("Items " + count.toString());
      });
    });
  }

  Color getColor(int priority) {
    switch (priority) {
      case 1:
        return Colors.blue[700];
        break;
      case 2:
        return Colors.blue[500];
        break;
      case 3:
        return Colors.blue[200];
        break;

      default:
        return Colors.green;
    }
  }

  String getTopicIcon(String topic) {
    switch (topic) {
      case "Family":
        return "👨‍👩‍👦";
        break;
      case "Work":
        return "‍👩🏻‍💻";
        break;
      case "Health":
        return "👨🏾‍⚕️";
        break;
      case "Friends":
        return "💃";
        break;
      case "Home":
        return "🏠";
        break;
      default:
        return "";
    }
  }

  String getArrow(int priority) {
    switch (priority) {
      case 1:
        return "‍▲";
        break;
      case 2:
        return "△";
        break;
      case 3:
        return "△";
        break;
      default:
        return "△";
    }
  }

  Color getArrowColor(int priority) {
    switch (priority) {
      case 1:
        return Colors.amber;
        break;
      case 2:
        return Colors.amberAccent;
        break;
      case 3:
        return Colors.white;
        break;

      default:
        return Colors.white;
    }
  }

  void navigateToDetail(Todo todo) async {
    bool result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TodoDetail(todo)),
    );
    if (result == true) {
      getData();
    }
  }
}
