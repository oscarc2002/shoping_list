import 'package:shopping_list/features/list/domain/entities/category.dart';
import 'package:shopping_list/core/theme/app_pallete.dart';

const categories = {
  Categories.vegetables: Category(
    'Vegetables',
    AppPallete.vegetablesColor,
  ),
  Categories.fruit: Category(
    'Fruit',
    AppPallete.fruitsColor,
  ),
  Categories.meat: Category(
    'Meat',
    AppPallete.meatsColor,
  ),
  Categories.dairy: Category(
    'Dairy',
    AppPallete.dairyColor,
  ),
  Categories.carbs: Category(
    'Carbs',
    AppPallete.carbsColor,
  ),
  Categories.sweets: Category(
    'Sweets',
    AppPallete.sweetsColor,
  ),
  Categories.spices: Category(
    'Spices',
    AppPallete.spicesColor,
  ),
  Categories.convenience: Category(
    'Convenience',
    AppPallete.convenienceColor,
  ),
  Categories.hygiene: Category(
    'Hygiene',
    AppPallete.hygieneColor,
  ),
  Categories.other: Category(
    'Other',
    AppPallete.otherColor,
  ),
};
