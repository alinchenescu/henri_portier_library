import 'package:henri_portier_library/models/book_model.dart';
import 'package:henri_portier_library/models/offer_model.dart';

class BooksState {
  final List<BookModel> books;
  final List<BookModel> selectedBooks;
  final List<BookModel> cartItems;
  final bool fetchedData;
  final bool fetchedOffers;
  final List<OfferModel> offers;

  BooksState({
    required this.books,
    required this.selectedBooks,
    required this.cartItems,
    required this.offers,
    this.fetchedData = false,
    this.fetchedOffers = false,
  });
  BooksState copyWith({
    List<BookModel>? books,
    List<BookModel>? selectedBooks,
    List<BookModel>? cartItems,
    List<OfferModel>? offers,
    bool? fetchedData,
    bool? fetchedOffers,
  }) =>
      BooksState(
        books: books ?? this.books,
        selectedBooks: selectedBooks ?? this.selectedBooks,
        offers: offers ?? this.offers,
        cartItems: cartItems ?? this.cartItems,
        fetchedData: fetchedData ?? this.fetchedData,
        fetchedOffers: fetchedOffers ?? this.fetchedOffers,
      );
}
