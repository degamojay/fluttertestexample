import 'package:http/http.dart' as http;

class TaskRepository{
  final http.Client client;

  TaskRepository(this.client);

  Future<Tasks> fetchTasks() async{
    final response = await client.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
    if(response.statusCode == 200){
      //Create Task Object
      return Tasks();
    }else{
      throw Exception();
    }
  }
}

class Tasks {
}