import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:halter/screens/addworkout_screen.dart';
import 'package:halter/screens/feed_screen.dart';
import 'package:halter/screens/profile_screen.dart';
import 'package:halter/screens/searchuser_screen.dart';

List<Widget> homeScreenItems = [
  const FeedScreen(),
  const SearchScreen(),
  const AddWorkoutScreen(),
  ProfileScreen(
    uid: FirebaseAuth.instance.currentUser!.uid,
  ),
];
