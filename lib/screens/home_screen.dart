import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:henri_portier_library/books_cubit/books_cubit.dart';
import 'package:henri_portier_library/books_cubit/books_state.dart';
import 'package:henri_portier_library/home_cubit/home_nav_cubit.dart';
import 'package:henri_portier_library/screens/books_screen.dart';
import 'package:henri_portier_library/screens/cart_screen.dart';

class HomeNavScreen extends StatelessWidget {
  const HomeNavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomeNavCubit(),
        child:
            BlocBuilder<HomeNavCubit, int>(builder: (context, navigationIndex) {
          return Scaffold(
              bottomNavigationBar: BottomNavigationBar(
                onTap: context.watch<HomeNavCubit>().changeIndex,
                currentIndex: navigationIndex,
                backgroundColor: Colors.white,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.my_library_books_outlined,
                      color: Colors.grey,
                    ),
                    activeIcon: Icon(
                      Icons.my_library_books_outlined,
                      color: Colors.blueAccent,
                    ),
                    label: 'Books',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.shopping_cart,
                      color: Colors.grey,
                    ),
                    activeIcon: Icon(
                      Icons.shopping_cart,
                      color: Colors.blueAccent,
                    ),
                    label: 'Cart',
                  ),
                ],
              ),
              body: BlocProvider(
                  create: (context) => BooksCubit(BooksState(
                        books: [],
                        selectedBooks: [],
                        cartItems: [],
                        offers: [],
                      )),
                  child: BlocBuilder<BooksCubit, BooksState>(
                      builder: (context, state) {
                    return IndexedStack(
                      index: navigationIndex,
                      children: [
                        BooksScreen(homeContext: context),
                        CartScreen(homeContext: context),
                      ],
                    );
                  })));
        }));
  }
}
