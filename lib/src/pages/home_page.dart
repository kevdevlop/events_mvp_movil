import 'package:eventos_mvp/src/utils/icons_string_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bienvenidos"),
      ),
      body: _createMenu(context),
    );
  }

  Widget _createMenu(BuildContext context) {
    return ListView(
      children: _createListItems(context),
    );
  }

  List<Widget> _createListItems(BuildContext context) {
    final List<Map> itemsMenu = new List();
    itemsMenu.add(
      {'title': "Eventos", 'route': 'events', 'icon': 'event'}
    );
    
    List<Widget> temp = [];

    itemsMenu.forEach((item) => {
      temp.add(
        Column(
          children: <Widget>[
            ListTile(
              title: Text(item['title']),
              leading: getIcon(item['icon']),
              trailing: Icon(
                Icons.keyboard_arrow_right,
                color: Colors.cyanAccent,
              ),
              onTap: () {
                Navigator.pushNamed(context, item['route']);
              },
            ),
            Divider()
          ],
        )
      )
    });

    return temp;

  }
}