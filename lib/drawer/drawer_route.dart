import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/drawer/drawer_bloc.dart';
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

  double _leftBodyOpen() {
    return 5;
  }

  double _leftBodyClose() {
    return MediaQuery.of(context).size.width - 105;
  }

  void _drawerCallback(bool status) {
    context.read<DrawerBloc>().add(ToogleDrawer(isOpen: !status));
  }

  @override
  Widget build(BuildContext context) {
    return DrawerControllerWidget(
      callbackFunction: _drawerCallback,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Jogo da Forca'),
        centerTitle: true,
        actions: const <Widget>[Icon(Icons.menu, size: 40)],
      ),
      topBody: _topBody(),
      leftBodyOpen: _leftBodyOpen(),
      leftBodyClose: _leftBodyClose(),
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
