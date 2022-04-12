import 'package:flutter/material.dart';
import 'package:henri_portier_library/models/book_model.dart';

Widget BookWidget(BookModel book, bool isInCart) {
  return ListTile(
    contentPadding: EdgeInsets.zero,
    title: Text(book.title!),
    leading: Image.network(
      book.cover!,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) return child;
        return CircularProgressIndicator(
          value: loadingProgress.expectedTotalBytes != null
              ? loadingProgress.cumulativeBytesLoaded /
                  loadingProgress.expectedTotalBytes!
              : null,
        );
      },
    ),
    subtitle: isInCart
        ? Text(
            'Price: ${book.price}',
          )
        : Container(),
  );
}
