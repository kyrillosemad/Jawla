class BookingsTripModel {
  String? type;
  int? id;
  String? types;
  String? title;
  String? location;
  String? startDate;
  String? endDate;
  int? price;
  int? persons;
  int? duration;
  String? description;
  Images? images; // يجب أن تتأكد أن `images` غير null في JSON
  int? paymentAmount;

  BookingsTripModel(
      {this.type,
      this.id,
      this.types,
      this.title,
      this.location,
      this.startDate,
      this.endDate,
      this.price,
      this.persons,
      this.duration,
      this.description,
      this.images,
      this.paymentAmount});

  BookingsTripModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    types = json['types'];
    title = json['title'];
    location = json['location'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    price = json['price'];
    persons = json['persons'];
    duration = json['duration'];
    description = json['description'];
    // تأكد من وجود قيمة images في JSON قبل محاولة تحويلها
    images = json['images'] != null ? Images.fromJson(json['images']) : null;
    paymentAmount = json['paymentAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['id'] = id;
    data['types'] = types;
    data['title'] = title;
    data['location'] = location;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['price'] = price;
    data['persons'] = persons;
    data['duration'] = duration;
    data['description'] = description;
    if (images != null) {
      data['images'] = images!.toJson();
    }
    data['paymentAmount'] = paymentAmount;
    return data;
  }
}

class Images {
  int? id;
  String? mainImage;
  List<String>? images; // تأكد من أن هذا هو التنسيق الصحيح للـ JSON
  int? tribId;

  Images({this.id, this.mainImage, this.images, this.tribId});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mainImage = json['main_image'];
    // تأكد من أن الـ JSON يحتوي على قائمة images
    images = json['images'] != null ? List<String>.from(json['images']) : [];
    tribId = json['trib_Id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['main_image'] = mainImage;
    data['images'] = images;
    data['trib_Id'] = tribId;
    return data;
  }
}
