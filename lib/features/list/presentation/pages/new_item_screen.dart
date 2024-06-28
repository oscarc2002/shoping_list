import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_list/features/list/data/categories.dart';
import 'package:shopping_list/features/list/presentation/bloc/save_bloc.dart';
import 'package:shopping_list/features/list/presentation/widgets/auth_quantity_field.dart';
import 'package:shopping_list/features/list/presentation/widgets/auth_name_field.dart';
import 'package:shopping_list/features/list/presentation/widgets/save_button.dart';
import 'package:shopping_list/features/list/domain/entities/models/category.dart';
import 'package:shopping_list/features/list/domain/entities/models/grocery_item.dart';

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<NewItem> createState() {
    return _NewItemState();
  }
}

class _NewItemState extends State<NewItem> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final quantityController = TextEditingController();
  var _selectedCategory = categories[Categories.vegetables]!;
  var _isSending = false;

  @override
  void dispose() {
    nameController.dispose();
    quantityController.dispose();
    super.dispose();
  }

  /*void _saveItem() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _isSending = true;
      //saveItem();

      if (!context.mounted) {
        return;
      }

      Navigator.of(context).pop(
        GroceryItem(
          id: resData['name'],
          name: _enteredName,
          quantity: _enteredQuantity,
          category: _selectedCategory,
        ),
      );
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              AuthNameField(
                hintText: 'Name',
                controller: nameController,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: AuthQuantityField(
                      hintText: 'Quantity',
                      controller: quantityController,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: DropdownButtonFormField(
                      value: _selectedCategory,
                      items: [
                        for (final category in categories.entries)
                          DropdownMenuItem(
                            value: category.value,
                            child: Row(
                              children: [
                                Container(
                                  width: 16,
                                  height: 16,
                                  color: category.value.color,
                                ),
                                const SizedBox(width: 6),
                                Text(category.value.title),
                              ],
                            ),
                          ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _selectedCategory = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: _isSending
                        ? null
                        : () {
                            _formKey.currentState!.reset();
                          },
                    child: const Text('Reset'),
                  ),
                  SaveButton(
                    buttonText: 'Add Item',
                    isSending: _isSending,
                    onPressed: () {
                      _isSending
                          ? null
                          : {
                              if (_formKey.currentState!.validate())
                                {
                                  context.read<SaveBloc>().add(
                                   ListSave(
                                          name: nameController.text,
                                          quantity: int.parse(
                                              quantityController.text),
                                          category: _selectedCategory.title,
                                        ),
                                      ),
                                  Navigator.of(context).pop(
                                    GroceryItem(
                                      id: '1',
                                      name: nameController.text,
                                      quantity:
                                          int.parse(quantityController.text),
                                      category: _selectedCategory,
                                    ),
                                  )
                                }
                            };
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
