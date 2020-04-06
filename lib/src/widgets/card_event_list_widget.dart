import 'package:eventos_mvp/src/models/event_model.dart';
import 'package:flutter/material.dart';

class CardEventListWidget extends StatelessWidget {
  final List<Event> items;

  CardEventListWidget({@required this.items});

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = new List();

    items.forEach((event) => {
      widgets.add(
        _getItemsWidget(event, context)
      )
    });

    return Column(
      children: widgets,
    );
  }

  Widget _getItemsWidget(Event event, BuildContext context) {
    final card = Container(
      child: Column(
        children: <Widget>[
          FadeInImage(
            placeholder: AssetImage('assets/img/loading.gif'),
            image: NetworkImage(event.topPhoto),
            height: 300.0,
            fit: BoxFit.cover,
          ),
          Container(
            padding: EdgeInsets.only(top: 8.0),
            child: Column(
              children: <Widget>[
                Container(
                  child: Text(event.title, style: Theme.of(context).textTheme.title,)
                ),
                Divider(),
                Text(event.date, style: Theme.of(context).textTheme.subhead,),
                Container(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Text("Auditorio BBVA - Ciudad de México"),
                ),
                
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  child: Text("Ver más", style: TextStyle(color: Colors.blueAccent,fontSize: 15),),
                  onPressed: () {
                    Navigator.pushNamed(context, 'event', arguments: event);
                  },
                )
              ],
            ),
          )
        ],
      ),
    );

    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 10.0)
          )
        ]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: card,
      ),
    );
  }
}