import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/provider/filters_provider.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});

  @override
  Widget build(context, ref) {

    // This will rebuild the widget whenever the filters change value
    final activeFilters = ref.watch(filtersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Filter',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          // 1. The gluten filter item
          SwitchListTile.adaptive(
            value: activeFilters[Filter.glutenFree]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.glutenFree, isChecked);
            },
            activeColor: Colors.green,
            title: const Text(
              'Gluten-free',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            subtitle: const Text(
              'Only include gluten-free meals.',
              style: TextStyle(fontSize: 15),
            ),
          ),
          const Divider(),

          // 2. The lactose filter item
          SwitchListTile.adaptive(
            value: activeFilters[Filter.lactoseFree]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.lactoseFree, isChecked);
            },
            activeColor: Colors.green,
            title: const Text(
              'Lactose-free',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            subtitle: const Text(
              'Only include lactose-free meals.',
              style: TextStyle(fontSize: 15),
            ),
          ),
          const Divider(),

          // 3. The vegetarian filter item
          SwitchListTile.adaptive(
            value: activeFilters[Filter.vegetarian]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegetarian, isChecked);
            },
            activeColor: Colors.green,
            title: const Text(
              'Vegetarian',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            subtitle: const Text(
              'Only include vegetarian meals.',
              style: TextStyle(fontSize: 15),
            ),
          ),
          const Divider(),

          // 4. The vegan filter item
          SwitchListTile.adaptive(
            value: activeFilters[Filter.vegan]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegan, isChecked);
            },
            activeColor: Colors.green,
            title: const Text(
              'Vegan',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            subtitle: const Text(
              'Only include vegan meals.',
              style: TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
