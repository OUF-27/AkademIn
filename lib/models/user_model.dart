import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String username;
  final String email;
  final String uid;
  final List followers;
  final List following;
  final String imageUrl;

  const User(
      {required this.username,
      required this.email,
      required this.uid,
      required this.followers,
      required this.following,
      required this.imageUrl});

  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "email": email,
        "followers": followers,
        "following": following,
        "imageUrl": imageUrl
      };

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      username: snapshot['username'],
      uid: snapshot['uid'],
      email: snapshot['email'],
      followers: snapshot['followers'],
      following: snapshot['following'],
      imageUrl: snapshot['imageUrl'],
    );
  }
}
