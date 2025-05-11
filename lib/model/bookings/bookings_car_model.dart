class CarTripModel {
  String? type;
  int? id;
  String? carType;
  String? startDate;
  String? endDate;
  int? numberOfPersons;
  String? receivePlace;
  String? returnPlace;
  String? state;
  var price;

  CarTripModel(
      {this.type,
      this.id,
      this.carType,
      this.startDate,
      this.endDate,
      this.numberOfPersons,
      this.receivePlace,
      this.returnPlace,
      this.state,
      this.price});

  CarTripModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    carType = json['carType'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    numberOfPersons = json['numberOfPersons'];
    receivePlace = json['receivePlace'];
    returnPlace = json['returnPlace'];
    state = json['state'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['id'] = id;
    data['carType'] = carType;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['numberOfPersons'] = numberOfPersons;
    data['receivePlace'] = receivePlace;
    data['returnPlace'] = returnPlace;
    data['state'] = state;
    data['price'] = price;
    return data;
  }
}
