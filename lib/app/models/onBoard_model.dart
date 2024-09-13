import 'parents/model.dart';

class OnBoard extends Model {
  String? image;
  String? title;
  String? description;
  String? end;
  String? buttonText;
  bool? isColoredBtn;

  OnBoard(
      {this.image, this.title, this.description, this.end, this.buttonText});

  OnBoard.fromJson(Map<String, dynamic> json) {
    super.fromJson(json);
    image = stringFromJson(json, "image");
    title = stringFromJson(json, "title");
    description = stringFromJson(json, "description");
    end = stringFromJson(json, "bold_text");
    buttonText = stringFromJson(json, "button_text");
    isColoredBtn = boolFromJson(json, "isbackground");
  }

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
