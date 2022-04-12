import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:henri_portier_library/books_cubit/books_cubit.dart';
import 'package:henri_portier_library/books_cubit/books_state.dart';

import '../models/book_model.dart';

class BooksScreen extends StatelessWidget {
  final BuildContext homeContext;

  const BooksScreen({Key? key, required this.homeContext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BooksState booksState = homeContext.read<BooksCubit>().state;
    if (!booksState.fetchedData) {
      context.read<BooksCubit>().fetchData();
    }
    return Scaffold(
      body: booksState.books.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: booksState.books.length,
                      itemBuilder: (context, index) {
                        BookModel book = booksState.books[index];
                        bool isSelected = booksState.selectedBooks
                            .where((element) => element.isbn == book.isbn)
                            .isNotEmpty;

                        return Padding(
                          padding: EdgeInsets.symmetric(
                              vertical:
                                  MediaQuery.of(context).size.height * 0.01),
                          child: GestureDetector(
                            onTap: () {
                              context.read<BooksCubit>().onTapBook(book);
                            },
                            child: Container(
                              color: isSelected
                                  ? Colors.blueAccent.withOpacity(0.5)
                                  : Colors.grey[50],
                              padding: EdgeInsets.all(8),
                              child: ListTile(
                                contentPadding: EdgeInsets.zero,
                                title: Text(book.title!),
                                leading: Image.network(book.cover!),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                Visibility(
                  visible: booksState.selectedBooks.isNotEmpty,
                  child: Card(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width - 16,
                      child: TextButton(
                        onPressed: () {
                          context.read<BooksCubit>().addItemsToCart();
                        },
                        child: Text(
                          'Add ${booksState.selectedBooks.length} ' +
                              (booksState.selectedBooks.length > 1
                                  ? 'books'
                                  : 'book') +
                              ' to the cart',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    color: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.005,
                ),
              ],
            ),
    );
  }
}
