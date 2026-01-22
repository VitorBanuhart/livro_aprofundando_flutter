import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/drawer/drawer_bloc.dart';

class DrawerControllerWidget extends StatelessWidget {
  final AppBar? appBar;
  final Widget? body;
  final double? topBody;
  final double? leftBodyOpen;
  final double? leftBodyClose;
  final Drawer? drawer;
  final Function? callbackFunction;
  DrawerControllerWidget({
    super.key,
    this.appBar,
    this.body,
    this.leftBodyOpen,
    this.leftBodyClose,
    this.topBody,
    this.drawer,
    this.callbackFunction,
  });

  GlobalKey<DrawerControllerState> drawerKey =
      GlobalKey<DrawerControllerState>();

  void _openDrawer() {
    drawerKey.currentState!.open();
    _isDrawerOpened = true;
  }

  void _closeDrawer() {
    drawerKey.currentState!.close();
    _isDrawerOpened = false;
  }

  bool _isDrawerOpened = false;

  void _drawerCallback(bool status) {
    if (_isDrawerOpened && status) {
      status = false;
      _closeDrawer();
    }
    if (callbackFunction != null) {
      callbackFunction!(status);
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Stack(
      children: [
        Positioned(
          top: 0.0,
          left: 0.0,
          right: 0.0,
          child: (appBar == null)
              ? AppBar()
              : AppBar(
                  automaticallyImplyLeading: appBar!.automaticallyImplyLeading,
                  title: appBar!.title,
                  centerTitle: appBar!.centerTitle,
                  actions: <Widget>[
                    GestureDetector(
                      child: appBar!.actions![0],
                      onTap: () => _openDrawer(),
                    ),
                  ],
                ),
        ),
        (topBody != null)
            ? BlocBuilder<DrawerBloc, DrawerTooglePressed>(
                builder: (context, _isDrawerOpen) {
                  double left = _isDrawerOpened
                      ? leftBodyOpen!
                      : leftBodyClose!;

                  return AnimatedPositioned(
                    duration: const Duration(seconds: 1),
                    top: topBody,
                    left: left,
                    child: body ?? Container(),
                  );
                },
              )
            : body!,
        DrawerController(
          key: drawerKey,
          child: drawer != null ? drawer! : Container(),
          alignment: DrawerAlignment.end,
          drawerCallback: (status) {
            if (!_isDrawerOpened) {
              _drawerCallback(status);
            }
          },
        ),
      ],
    ),
  );
}
