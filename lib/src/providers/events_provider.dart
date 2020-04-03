import 'package:eventos_mvp/src/models/event_model.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class EventsProvider {
  String _urlBase = 'eventos-mvp-backend.syesoftware.com';

  Future<Event> getEvent(String id) async {
    final url = Uri.http(_urlBase, 'events/$id');

    final response = await http.get(url);

    final decodedData = json.decode(response.body);

    final event = new Event.fromJsonMap(decodedData);

    return event;
  }

  Future<List<Event>> getAllEvents() async{
    final url = Uri.http(_urlBase, 'events', {});

    return await processRequest(url);
  }

  Future<List<Event>> searchEvents(String query) async{
    var params = json.encode({
        'where' : {
          'title' : {
            'ilike' : query
          } 
        }
    });

    final url = Uri.http(_urlBase, 'events', {'query': params});

    return await processRequest(url);
  }

  Future<List<Event>> processRequest(Uri url) async{
    final response = await http.get(url);
    print(response);
    final decodedData = json.decode(response.body);

    final movies = new Events.fromJsonList(decodedData);

    return movies.items;
  }
}