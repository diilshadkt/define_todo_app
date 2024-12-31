import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:define_todo_app/features/auth/controller/auth_service.dart';
import 'package:define_todo_app/features/auth/model/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserService {
  final CollectionReference<UserModel> userCollection =
      FirebaseFirestore.instance.collection("users").withConverter(
          fromFirestore: UserModel.fromFirebase,
          toFirestore: (UserModel value, options) => value.toFirestore());


  //get a user
  Future<DocumentSnapshot<UserModel>> getuser(String uid) {
    return userCollection.doc(uid).get();
  }

   Future<void> addUser(
    String name,
    String email,
    String id,
  ) {
    return userCollection.doc(id).set(
          UserModel(
            name: name,
            email: email,
          ),
        );
  }
}
final userServiceProvider = Provider<UserService>((ref) {
  return UserService();
});

final getUserProvider = FutureProvider<DocumentSnapshot<UserModel>?>((ref) {
  var authState = ref.watch(authStateProvider);
  var userservice = ref.read(userServiceProvider);
  return authState.value == null
      ? null
      : userservice.getuser(authState.value!.uid);
});
