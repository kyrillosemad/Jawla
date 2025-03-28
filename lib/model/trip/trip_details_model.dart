class TripDetailsModel {
  int? id;
  String? title;
  String? location;
  String? startDate;
  String? description;
  int? price;
  int? duration;
  String? mainImage; // تعديل نوع المتغير
  List<String>? images;

  TripDetailsModel({
    this.id,
    this.title,
    this.location,
    this.startDate,
    this.description,
    this.price,
    this.duration,
    this.mainImage,
    this.images,
  });

  TripDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    location = json['location'];
    startDate = json['start_date'];
    description = json['description'];
    price = json['price'];
    duration = json['duration'];
    mainImage = json['main_image'];
    if (json['images'] != null) {
      images = List<String>.from(json['images']); // تصحيح تحويل القائمة
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['location'] = location;
    data['start_date'] = startDate;
    data['description'] = description;
    data['price'] = price;
    data['duration'] = duration;
    data['main_image'] = mainImage;
    if (images != null) {
      data['images'] = images; // تصحيح تحويل القائمة
    }
    return data;
  }
}
