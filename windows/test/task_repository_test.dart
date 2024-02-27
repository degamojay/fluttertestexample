import "package:flutter_test/flutter_test.dart";
import "package:fluttertestexample/task_repository.dart";
import "package:http/http.dart";
import "package:mocktail/mocktail.dart";

class MockHttpClient extends Mock implements Client {}

void main() {
  late MockHttpClient mockClient;
  late TaskRepository taskRepository;

  setUp(() {
    mockClient = MockHttpClient();
    taskRepository = TaskRepository(mockClient);
  });

  test(
      //arrange
      "Given Task Repository is instantiated, when fetchTasks is called andreturn is 200, then a tasks object should be returned.",
      () async {
    when(
      () => mockClient.get(
        Uri.parse('https://jsonplaceholder.typicode.com/todos'),
      ),
    ).thenAnswer((_) => Future.delayed(Duration.zero, () => Response('''

      [
        {
          "userId": 1,
          "id": 1,
          "title": "delectus aut autem",
          "completed": false
        }
      ]

    ''', 200)));

    Tasks tasks = await taskRepository.fetchTasks(); //act
    expect(tasks, isA<Tasks>()); //assert
    verify(() => mockClient.get(
        Uri.parse('https://jsonplaceholder.typicode.com/todos'))).called(1);
  });

  test(
      "Given Task Repository is instantiated, when fetchTasks is called and return is 404, then an Exception should be thrown.",
      () async {
    when(
      () => mockClient.get(
        Uri.parse('https://jsonplaceholder.typicode.com/todos'),
      ),
    ).thenAnswer((_) => Future.delayed(Duration.zero, () => Response('''

      [
        {
          "userId": 1,
          "id": 1,
          "title": "delectus aut autem",
          "completed": false
        }
      ]

    ''', 404)));

    expect(taskRepository.fetchTasks(), throwsException); //assert
  });
}
