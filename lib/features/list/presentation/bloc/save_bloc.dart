import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_list/features/list/domain/entities/grocery_item.dart';
import 'package:shopping_list/features/list/domain/usecases/user_save_item.dart';

part 'save_event.dart';
part 'save_state.dart';

class SaveBloc extends Bloc<ListEvent, SaveState> {
  final UserSave _userSave;
  SaveBloc({
    required UserSave userSave,
  })  : _userSave = userSave,
        super(SaveInitial()) {
    on<ListSave>((event, emit) async {
      final res = await _userSave(
        UserSaveParams(
          name: event.name,
          quantity: event.quantity,
          category: event.category,
        ),
      );

      res.fold(
        (failure) => emit(SaveFailure(failure.message)),
        (saveItem) => emit(SaveSucces(saveItem)),
      );
    });
  }
}
