import 'package:chatapp/helpers/Consts.dart';

class Message {
  final String message;
  final String? id;

  Message(this.message, {this.id = "ghafar@gmail.com"});
  factory Message.fromJson(JsonData) {
    return Message(JsonData[kMessage], id: JsonData[kID]);
  }
}
