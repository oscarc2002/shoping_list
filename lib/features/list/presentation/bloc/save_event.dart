part of 'save_bloc.dart';

@immutable
sealed class ListEvent {}

final class ListSave extends ListEvent {
  final String name;
  final int quantity;
  final String category;

  ListSave({
    required this.name,
    required this.quantity,
    required this.category,
  });
}
