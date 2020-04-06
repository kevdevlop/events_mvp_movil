import 'package:eventos_mvp/src/models/event_model.dart';
import 'package:eventos_mvp/src/providers/events_provider.dart';
import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate{
  //final List<Event> events;
  final EventsProvider _eventsProvider = new EventsProvider();

  //DataSearch({this.events});

  @override
  List<Widget> buildActions(BuildContext context) {
    // AppBar actions
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) return Container();
    
    return FutureBuilder(
      future: _eventsProvider.searchEvents(query),
      builder: (BuildContext context, AsyncSnapshot<List<Event>> snapshot) {
        if (snapshot.hasData) {
          final eventos = snapshot.data;
          List<Widget> temp = [];

          eventos.forEach((event) => {
            temp.add(
              ListTile(
                leading: FadeInImage(
                  image: NetworkImage(event.topPhoto),
                  placeholder: AssetImage('assets/img/no-image.jpg'),
                  width: 50.0,
                  fit: BoxFit.contain,
                ),
                title: Text(event.title),
                subtitle: Text(event.owner),
                onTap: () {},
              )
            )
          });

          return ListView(
            children: temp,
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

}