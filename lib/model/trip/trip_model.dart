// ignore_for_file: prefer_typing_uninitialized_variables

class TripModel {
  int? id;
  String? title;
  String? location;
  int? price;
  int? duration;
  String? mainImage;
  String? type;

  TripModel(
      {this.id,
      this.title,
      this.location,
      this.price,
      this.duration,
      this.mainImage,
      this.type});

  TripModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    title = json['title'] as String?;
    location = json['location'] as String?;
    price = json['price'] as int?;
    duration = json['duration'] as int?;
    mainImage = json['main_Image'] as String?;
    type = json['types'] as String?;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'location': location,
      'price': price,
      'duration': duration,
      'main_Image': mainImage,
      'types': type,
    };
  }
}
