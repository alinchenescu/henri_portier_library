enum OfferType {
  slice,
  percentage,
  minus,
}

class OfferModel {
  String? type;
  num? value;
  num? sliceValue;

  OfferModel({
    required this.type,
    required this.value,
    this.sliceValue = -1,
  });

  OfferModel copyWith({
    String? type,
    num? value,
    num? sliceValue,
  }) =>
      OfferModel(
        type: type ?? this.type,
        value: value ?? this.value,
        sliceValue: sliceValue ?? this.sliceValue,
      );

  OfferModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    value = json['value'];
    sliceValue = json['sliceValue'] ?? -1;
  }
}
