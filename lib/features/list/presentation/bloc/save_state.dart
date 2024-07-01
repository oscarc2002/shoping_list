part of 'save_bloc.dart';

@immutable
sealed class SaveState {}

final class SaveInitial extends SaveState {}

final class SaveLoading extends SaveState{}

final class SaveSucces extends SaveState{
  final GroceryItem saveItem;
  SaveSucces(this.saveItem);
}

final class SaveFailure extends SaveState{
  final String message;
  SaveFailure(this.message);
}