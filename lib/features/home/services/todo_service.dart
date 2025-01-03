// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:define_todo_app/features/home/model/todo_model.dart';
// import 'package:define_todo_app/features/home/model/user_model.dart';

// class TodoServices {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   static final userCollection = FirebaseFirestore.instance
//       .collection('users')
//       .withConverter(
//           fromFirestore: (snapshot, options) =>
//               UserModel.fromJson(snapshot.data()!),
//           toFirestore: (value, options) => value.toJson());

//   static Future<void> createUser(UserModel user) async {
//     await userCollection.doc(user.id).set(user);
//   }

//   Future<void> addTodo(String userId, TodoModel todo) async {
//     await _firestore
//         .collection('users')
//         .doc(userId)
//         .collection('todos')
//         .doc(todo.id)
//         .set(todo.toJson());
//   }

//   Stream<List<TodoModel>> getTodos(String userId) {
//     return _firestore
//         .collection('users')
//         .doc(userId)
//         .collection("todos")
//         .withConverter(
//           fromFirestore: (snapshot, _) =>
//               TodoModel.fromJson({'id': snapshot.id, ...snapshot.data()!}),
//           toFirestore: (todo, _) => todo.toJson(),
//         )
//         .snapshots()
//         .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
//   }

//   // Future<void> deleteTask(String id) async {
//   //   await _firestore
//   //       .collection('users')
//   //       .doc(id)
//   //       .collection('todos')
//   //       .doc()
//   //       .delete();
//   // }
// }
