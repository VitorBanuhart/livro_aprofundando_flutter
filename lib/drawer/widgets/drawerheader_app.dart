import 'package:flutter/material.dart';

class DrawerheaderApp extends StatelessWidget {
  const DrawerheaderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/casa.jpg'),
        ),
      ),
      child: UserAccountsDrawerHeader(
        decoration: BoxDecoration(color: Colors.transparent),
        accountName: Text(
          "Teste da Silva",
          style: TextStyle(color: Colors.black),
        ),
        accountEmail: Text(
          "teste.silva@teste.com",
          style: TextStyle(color: Colors.black),
        ),
        currentAccountPicture: CircleAvatar(
          backgroundImage: AssetImage('assets/pessoa.jpg'),
        ),
        otherAccountsPictures: <Widget>[
          CircleAvatar(backgroundImage: AssetImage('assets/gato.jpg')),
        ],
      ),
    );
  }
}
