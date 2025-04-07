class PackageTripModel {
  String? type;
  int? id;
  int? numberOfPersons;
  bool? addCar;
  bool? addGuide;
  String? language;
  String? description;
  String? startDate;
  String? endDate;
  String? state;
  String? price;

  PackageTripModel(
      {this.type,
      this.id,
      this.numberOfPersons,
      this.addCar,
      this.addGuide,
      this.language,
      this.description,
      this.startDate,
      this.endDate,
      this.state,
      this.price});

  PackageTripModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    numberOfPersons = json['numberOfPersons'];
    addCar = json['addCar'];
    addGuide = json['addGuide'];
    language = json['language'];
    description = json['description'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    state = json['state'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['id'] = id;
    data['numberOfPersons'] = numberOfPersons;
    data['addCar'] = addCar;
    data['addGuide'] = addGuide;
    data['language'] = language;
    data['description'] = description;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['state'] = state;
    data['price'] = price;
    return data;
  }
}
