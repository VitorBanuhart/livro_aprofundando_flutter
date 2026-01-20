import 'package:flutter/material.dart';
import 'package:new_project/widgets/listtile_app_widget.dart';

class DrawerbodycontentApp extends StatelessWidget {
  const DrawerbodycontentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTileTheme(
          contentPadding: const EdgeInsets.only(left: 6.0),
          child: ExpansionTile(
            leading: const CircleAvatar(
              backgroundImage: AssetImage('assets/palavras.png'),
            ),
            title: const Text(
              'Base de palavras',
              style: TextStyle(color: Colors.black, fontSize: 16.0),
            ),
            onExpansionChanged: null,
            children: <Widget>[
              ListtileAppWidget(
                titleText: 'Novas Palavras',
                subtitleText: 'Vamos inserir palavras?',
              ),
              ListtileAppWidget(
                titleText: 'Palavras existentes',
                subtitleText: 'Vamos ver as que já temos',
              ),
            ],
          ),
        ),
        _createListTile(
          contentPadding: const EdgeInsets.only(left: 6.0),
          titleText: 'Jogar',
          subtitleText: 'Começar a diversão',
          avatarImage: AssetImage('assets/jogar.jpg'),
        ),
        _createListTile(
          contentPadding: const EdgeInsets.only(left: 6.0),
          titleText: 'Score',
          subtitleText: 'Relação dos top 10',
          avatarImage: const AssetImage('assets/top10.png'),
        ),
      ],
    );
  }
}

ListTile _createListTile({
  required EdgeInsets contentPadding,
  ImageProvider? avatarImage,
  required String titleText,
  required String subtitleText,
}) {
  return ListTile(
    contentPadding: contentPadding,
    leading: avatarImage != null
        ? CircleAvatar(backgroundImage: avatarImage)
        : null,
    trailing: Icon(Icons.arrow_forward),
    title: Text(titleText),
    subtitle: Text(subtitleText),
  );
}
