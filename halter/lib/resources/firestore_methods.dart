import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //upload post




//follow user
  Future<void> followUser(String uid, String followId) async {
    try {
      DocumentSnapshot snap =
          await _firestore.collection('users').doc(uid).get();
          List following = (snap.data()! as dynamic)['following'];

          if(following.contains(followId)) {
            //remove follower if already
            await _firestore.collection('users').doc(followId).update({
              'followers' : FieldValue.arrayRemove([uid])
            });
            await _firestore.collection('users').doc(uid).update({
              'following' : FieldValue.arrayRemove([followId])
            });
          }else {
            await _firestore.collection('users').doc(followId).update({
              'followers' : FieldValue.arrayUnion([uid])
            });
            await _firestore.collection('users').doc(uid).update({
              'following' : FieldValue.arrayUnion([followId])
            });
          }

    } catch (e) {
      print(e.toString());
    }
  }
}
