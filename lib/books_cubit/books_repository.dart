import 'package:dio/dio.dart';
import 'package:henri_portier_library/models/book_model.dart';
import 'package:henri_portier_library/models/offer_model.dart';

import '../constants.dart';

dynamic getHttp(String url) async {
  try {
    var response = await Dio().get(
      url,
    );
    return response;
  } catch (e) {
    print(e);
    return '';
  }
}

Future<List<BookModel>> getBooks() async {
  var response = await getHttp(StringConstants.booksGetUrl);
  List<BookModel> books = [];
  if (response.data != []) {
    try {
      books = List<BookModel>.from(response.data.map((model) {
        return BookModel.fromJson(model);
      }));
    } catch (e) {
      print(e);
    }
  }

  return books;
}

Future<List<OfferModel>> getOffers(List<BookModel> books) async {
  String reqUrl = StringConstants.booksGetUrl + '/';
  try {} catch (e) {
    print(e);
  }
  for (var element in books) {
    reqUrl = reqUrl + element.isbn.toString() + ',';
  }

  var response = await getHttp(
      reqUrl.substring(0, reqUrl.length - 2) + StringConstants.offerSuffix);

  List<OfferModel> offers = [];

  if (response.data['offers'] != []) {
    try {
      offers = List<OfferModel>.from(response.data['offers'].map((model) {
        return OfferModel.fromJson(model);
      }));
    } catch (e) {
      print(e);
    }
  }

  return offers;
}
