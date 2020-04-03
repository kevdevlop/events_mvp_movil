import 'package:eventos_mvp/src/models/event_model.dart';
import 'package:eventos_mvp/src/providers/events_provider.dart';
import 'package:flutter/material.dart';

class EventPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Event event = ModalRoute.of(context).settings.arguments;
    final title = event.title;

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.edit),
          tooltip: "Registrarse",
        ),
        body: FutureBuilder(
          future: EventsProvider().getEvent(event.id),
          builder: (BuildContext context, AsyncSnapshot<Event> snapshot) {
            if (snapshot.data == null)
              return Container(
                height: 400,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );

            return _chargeWidget(context, snapshot.data);
          },
        ),
    );
  }

  Widget _chargeWidget(BuildContext context, Event event) {
    final owner = event.owner;

    return ListView(
      children: <Widget>[
        FadeInImage(
          placeholder: AssetImage('assets/img/loading.gif'),
          image: NetworkImage(event.topPhoto),
          height: 400.0,
          fit: BoxFit.cover,
        ),
        Container(
          height: 70.0,
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Impartido por: $owner',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.title,
                  overflow: TextOverflow.fade,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    event.date,
                    style: Theme.of(context).textTheme.subhead,
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(),
        _createBody(context, event)
      ],
    );
  }

  Widget _createBody(BuildContext context, Event event) {
    final _description = event.description;

    return Container(
      margin: EdgeInsets.all(5),
      child: Center(
        child: Text(
          _description,
          style: Theme.of(context).textTheme.body2,
        ),
      ),
    );
  }

}
