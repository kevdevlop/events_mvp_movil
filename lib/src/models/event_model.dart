import 'package:intl/intl.dart';

class Events {
  List<Event> items = new List();

  Events();

  Events.fromJsonList(dynamic jsonList) {
    // for (var i = 0; i < 10; i++) {
    //   Event event = new Event();
    //   event.title = "Webinar $i";
    //   event.description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas at nisi a dolor suscipit imperdiet. In sit amet libero commodo, tincidunt neque eget, pretium tortor. Integer ac urna et nisi ullamcorper vulputate. Nulla vestibulum elit sed neque porta, non semper sapien tincidunt. Mauris ac nunc nec nisi gravida dictum. Vivamus malesuada porta tortor laoreet blandit. In nec ultricies nunc. Vivamus non vulputate odio.Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Vestibulum nunc arcu, suscipit sed augue non, pretium lobortis urna. Sed ultrices elit vel elit vestibulum ornare. Mauris tincidunt ipsum sed metus gravida, vel condimentum purus faucibus. Morbi tempus, ante quis ornare efficitur, turpis eros ullamcorper nulla, ac lobortis arcu risus sed sapien. Vivamus in hendrerit nunc. Pellentesque id porttitor ex. Vivamus porta ultrices nibh, sed tempus nibh pellentesque nec. Etiam ac bibendum orci, non vulputate felis."+"Vestibulum consequat turpis velit, id rhoncus nisi elementum interdum. Aenean vel facilisis sapien, et tincidunt sem. Integer molestie magna iaculis turpis porttitor, non dapibus urna sagittis. Nam vel nisl scelerisque, vestibulum velit a, eleifend nisi. Integer maximus nisi eget nunc dapibus, egestas commodo dui rutrum. Phasellus sodales tortor ac neque varius, a faucibus dui commodo. Nulla eleifend libero ut viverra sollicitudin. Nunc accumsan vitae ex eu porttitor." + "Mauris sed ante dolor. Vestibulum vulputate metus laoreet nibh rhoncus tempor. Nunc accumsan vel tellus ac consectetur. Donec quis leo sed est sodales egestas vel et odio. Nam maximus lacus quis quam ornare, ac pretium sapien accumsan. Curabitur porttitor nulla sit amet porta tempor. Etiam cursus, enim sit amet suscipit scelerisque, turpis erat mattis diam, in auctor leo sem et diam. Cras iaculis augue eget aliquam luctus. Donec ornare risus eu ipsum pulvinar, non tempus dolor blandit. In imperdiet finibus felis, sed efficitur lectus pharetra non." + "Aenean mattis congue lorem, sit amet molestie diam dictum sed. Donec pretium fringilla orci, molestie aliquet dolor vehicula vel. Fusce eu commodo odio. Mauris mattis porttitor finibus. Donec consequat convallis iaculis. Phasellus tempor interdum rutrum. Morbi sagittis ultricies mauris, eu convallis lacus porttitor ut. Nam felis sapien, placerat euismod neque consequat, tempor tristique lorem. Duis rhoncus tortor a fermentum posuere. Quisque ac mollis tellus, rhoncus congue velit. Duis fringilla tempus lectus id cursus. Etiam eleifend nulla purus, quis consequat felis vulputate id. Pellentesque ultrices, magna nec aliquet lobortis, mi orci luctus nibh, molestie tempus metus leo congue est. In eget neque lacus. Nullam sit amet sagittis nunc. Donec tortor est, condimentum quis condimentum volutpat, placerat in ligula.";

    //   event.topPhoto = "https://asfonseca.com/wp-content/uploads/2018/07/crear-webinars-de-ventas-1200x600.jpg";
    //   event.owner = "Qualtop $i";

    //   items.add(event);
    // }
    if (jsonList == null) return;

    for (var item in jsonList) {
      final event = new Event.fromJsonMap(item);
      items.add(event);
    }
  }
}

class Event {
  String id;
  String title;
  String description;
  String topPhoto;
  String owner;
  String date;

  Event({
    this.id,
    this.title,
    this.description,
    this.topPhoto,
    this.owner
  });

  Event.fromJsonMap(Map<String, dynamic> json) {
    id              = json['id'];
    title           = json['title'];
    description     = json['description'];
    date            = DateFormat('d MMMM - h:mm a', 'ES').format(DateTime.parse(json['date']));
    topPhoto        = json['topPhoto'];
    owner           = json['ownerId'];
  }
}