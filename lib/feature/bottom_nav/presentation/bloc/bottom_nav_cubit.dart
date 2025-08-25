import 'package:flutter_bloc/flutter_bloc.dart';
import 'bottom_nav_state.dart';

class BottomNavCubit extends Cubit<BottomNavState> {
  BottomNavCubit() : super(const BottomNavState());

  void updateIndex(int newIndex) {
    emit(state.copyWith(selectedIndex: newIndex));
  }
}