import 'package:flutter/material.dart';
import 'package:new_project/drawer/widgets/drawer_controller_widget.dart';
import 'package:new_project/drawer/widgets/drawerbody_app.dart';
import 'package:new_project/drawer/widgets/drawerbodycontent_app.dart';
import 'package:new_project/drawer/widgets/drawerheader_app.dart';
import 'package:new_project/widgets/circular_image_widget.dart';

class DrawerRoute extends StatefulWidget {
  const DrawerRoute({super.key});

  @override
  State<DrawerRoute> createState() => _DrawerRouteState();
}

class _DrawerRouteState extends State<DrawerRoute> {
  bool _drawerIsOpen = false;

  double _topBody() {
    return MediaQuery.of(context).size.height - 105;
  }

  double _leftBody() {
    if (!_drawerIsOpen) {
      return MediaQuery.of(context).size.width - 105;
    } else {
      return 5;
    }
  }

  _handleDrawer(bool drawerIsOpen) {
    setState(() {
      _drawerIsOpen = drawerIsOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DrawerControllerWidget(
      callbackFunction: _handleDrawer,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Jogo da Forca'),
        centerTitle: true,
        actions: const <Widget>[Icon(Icons.menu, size: 40)],
      ),
      topBody: _topBody(),
      leftBody: _leftBody(),
      drawer: Drawer(
        child: Column(
          children: const <Widget>[
            DrawerheaderApp(),
            DrawerbodyApp(child: DrawerbodycontentApp()),
          ],
        ),
      ),
      body: const CircularImageWidget(
        imageProvider: AssetImage('assets/casa.jpg'),
        width: 100,
        heigth: 100,
      ),
    );
  }
}
