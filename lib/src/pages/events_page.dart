import 'package:eventos_mvp/src/providers/events_provider.dart';
import 'package:eventos_mvp/src/search/search_delegate.dart';
import 'package:eventos_mvp/src/widgets/card_event_list_widget.dart';
import 'package:flutter/material.dart';

class EventsPage extends StatelessWidget {
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Próximos eventos'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context, 
                delegate: DataSearch()
              );
            },
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: <Widget>[
          _getEventsWidget()
        ],
      ),
    );
  }

  Widget _getEventsWidget() {
    return FutureBuilder(
      future: EventsProvider().getAllEvents(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return CardEventListWidget(
            items: snapshot.data,
          );
        }else {
          return Container(
            height: 400,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        
      },
    );
  }

  // Widget _createCard(BuildContext context) {
  //   return Card(
  //     elevation: 10.0,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(20.0)
  //     ),
  //     child: Column(
  //       children: <Widget>[
  //         ListTile(
  //           leading: Icon(Icons.photo_album, color: Colors.blue,),
  //           title: Text('Webinar wordpress tec de monterrey'),
  //           subtitle: Text("Bienvenidos al webinar para wordpress"),
  //         ),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.end,
  //           children: <Widget>[
  //             FlatButton(
  //               child: Text("Ver info."),
  //               onPressed: () {},
  //             )
  //           ],
  //         )
  //       ],
  //     ),
  //   );
  // }
}