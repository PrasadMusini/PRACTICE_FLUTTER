import 'package:flutter/material.dart';

// class Page4 extends StatelessWidget {
//   const Page4({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(
//         child: Text('Page 4'),
//       ),
//     );
//   }
// }

class User {
  final String userName;
  final int age;
  final String gender;
  final String state;

  User({
    required this.userName,
    required this.age,
    required this.gender,
    required this.state,
  });
}

class Page4 extends StatelessWidget {
  final List<User> users = [
    User(userName: 'Alice', age: 25, gender: 'Female', state: 'New York'),
    User(userName: 'Bob', age: 30, gender: 'Male', state: 'California'),
    User(userName: 'Charlie', age: 35, gender: 'Male', state: 'Texas'),
    User(userName: 'Diana', age: 28, gender: 'Female', state: 'Florida'),
    User(userName: 'Eve', age: 40, gender: 'Female', state: 'Washington'),
  ];

  Page4({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('User Filter'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                onChanged: (value) {
                  filterUsers(value);
                },
                decoration: const InputDecoration(
                  labelText: 'Enter filter text',
                ),
              ),
              const SizedBox(height: 16.0),
              Expanded(
                child: ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final user = users[index];
                    return ListTile(
                      title: Text(user.userName),
                      subtitle: Text(
                          'Age: ${user.age}, Gender: ${user.gender}, State: ${user.state}'),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void filterUsers(String input) {
    List<User> filteredUsers = users
        .where((user) =>
            user.userName.toLowerCase().contains(input.toLowerCase()) ||
            user.age.toString().contains(input) ||
            user.gender.toLowerCase().contains(input.toLowerCase()) ||
            user.state.toLowerCase().contains(input.toLowerCase()))
        .toList();

    print(filteredUsers);
  }
}
