import 'package:flutter/material.dart';

AppBar appbar(){
  return  AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: SizedBox(
          height: 40,
          child: Image.asset('assets/logo/shopywelllogo.png'),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/images/avatar.jpg"),
            ),
          ),
        ],
      );
}