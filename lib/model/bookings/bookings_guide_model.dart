  class GuideTripModel {
    String? type;
    int? id;
    String? language;
    String? startPlace;
    String? endPlace;
    String? destinations;
    String? startDate;
    String? endDate;
    String? state;
    var price;

    GuideTripModel(
        {this.type,
        this.id,
        this.language,
        this.startPlace,
        this.endPlace,
        this.destinations,
        this.startDate,
        this.endDate,
        this.state,
        this.price});

    GuideTripModel.fromJson(Map<String, dynamic> json) {
      type = json['type'];
      id = json['id'];
      language = json['language'];
      startPlace = json['startPlace'];
      endPlace = json['endPlace'];
      destinations = json['destinations'];
      startDate = json['startDate'];
      endDate = json['endDate'];
      state = json['state'];
      price = json['price'];
    }

    Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = <String, dynamic>{};
      data['type'] = type;
      data['id'] = id;
      data['language'] = language;
      data['startPlace'] = startPlace;
      data['endPlace'] = endPlace;
      data['destinations'] = destinations;
      data['startDate'] = startDate;
      data['endDate'] = endDate;
      data['state'] = state;
      data['price'] = price;
      return data;
    }
  }
