import 'package:flutter_bloc/flutter_bloc.dart';

class HomeNavCubit extends Cubit<int> {
  HomeNavCubit() : super(0);

  changeIndex(int newIndex) => emit(newIndex);
}
