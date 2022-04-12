import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:henri_portier_library/books_cubit/books_repository.dart';
import 'package:henri_portier_library/books_cubit/books_state.dart';
import 'package:henri_portier_library/models/book_model.dart';
import 'package:henri_portier_library/models/offer_model.dart';

class BooksCubit extends Cubit<BooksState> {
  BooksCubit(BooksState state) : super(state);

  Future<void> fetchData() async {
    emit(state.copyWith(
      fetchedData: true,
    ));
    List<BookModel> books = await getBooks();
    emit(state.copyWith(
      books: books,
    ));
  }

  Future<void> fetchOffers() async {
    emit(state.copyWith(
      fetchedOffers: true,
    ));
    List<OfferModel> offers = await getOffers(state.cartItems);
    emit(state.copyWith(offers: offers));
  }

  void onTapBook(BookModel book) {
    List<BookModel> books = state.selectedBooks;
    bool isSelected = state.selectedBooks
        .where((element) => element.isbn == book.isbn)
        .isNotEmpty;
    if (isSelected) {
      books.removeWhere(
        (element) => element.isbn == book.isbn,
      );
    } else {
      books.add(book);
    }
    emit(state.copyWith(selectedBooks: books));
  }

  void addItemsToCart() {
    List<BookModel> books = state.selectedBooks;

    emit(state.copyWith(
      cartItems: books,
      selectedBooks: [],
      fetchedOffers: false,
    ));
  }
}
