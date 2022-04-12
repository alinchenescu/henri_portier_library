import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:henri_portier_library/books_cubit/books_cubit.dart';
import 'package:henri_portier_library/books_cubit/books_state.dart';
import 'package:henri_portier_library/models/book_model.dart';
import 'package:henri_portier_library/models/offer_model.dart';

class CartScreen extends StatelessWidget {
  final BuildContext homeContext;

  const CartScreen({Key? key, required this.homeContext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BooksState booksState = homeContext.read<BooksCubit>().state;
    if (!booksState.fetchedOffers && booksState.cartItems.isNotEmpty) {
      context.read<BooksCubit>().fetchOffers();
    }
    return Scaffold(
      body: booksState.cartItems.isEmpty
          ? const Center(
              child: Text('Cart is empty'),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: booksState.cartItems.length,
                      itemBuilder: (context, index) {
                        BookModel book = booksState.cartItems[index];
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              vertical:
                                  MediaQuery.of(context).size.height * 0.01),
                          child: Container(
                            color: Colors.grey[50],
                            padding: EdgeInsets.all(8),
                            child: ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Text(book.title!),
                              leading: Image.network(book.cover!),
                              subtitle: Text(
                                'Price: ${book.price}',
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: StatefulBuilder(
                    builder: (context, setState) {
                      num discount = 0;
                      num currentDiscount = -1;
                      num total = 0;
                      OfferModel bestOffer = booksState.offers.first;

                      booksState.cartItems.forEach((element) {
                        total = total + element.price!;
                      });

                      booksState.offers.forEach((offer) {
                        if (offer.type == OfferType.percentage.name) {
                          currentDiscount = total / 100 * offer.value!;
                          if (currentDiscount > discount) {
                            discount = currentDiscount;
                            bestOffer = offer;
                          }
                        }
                        if (offer.type == OfferType.minus.name) {
                          currentDiscount = total - offer.value!;
                          if (currentDiscount > discount) {
                            discount = currentDiscount;
                            bestOffer = offer;
                          }
                        }
                        if (offer.type == OfferType.slice.name) {
                          bestOffer = offer;

                          discount = total -
                              (total ~/ offer.sliceValue! * offer.value!);
                        }
                      });

                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Total:${total.toString()}'
                            '\nDiscount : ${discount.toString()} +  (${bestOffer.type})'
                            '\nFinal Price : ${(total - discount).toString()}',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      );
                    },
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
