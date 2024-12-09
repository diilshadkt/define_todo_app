import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:define_todo_app/features/overview_page/model/overview_model.dart';

class OverviewService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addDetail(
      String userId, String todoId, OverviewModel detail) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('todos')
        .doc(todoId)
        .collection('detail')
        .doc(detail.id)
        .set(detail.toJson());
  }

  Stream<List<OverviewModel>> getDetails(String userId, String todoId) {
    return _firestore
        .collection('users')
        .doc(userId)
        .collection('todos')
        .doc(todoId)
        .collection('detail')
        .withConverter<OverviewModel>(
          fromFirestore: (snapshot, _) =>
              OverviewModel.fromJson({'id': snapshot.id, ...snapshot.data()!}),
          toFirestore: (detail, _) => detail.toJson(),
        )
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
  }


}
