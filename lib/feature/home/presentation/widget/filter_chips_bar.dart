import 'package:drama_flix/feature/home/data/model/filter_model.dart';
import 'package:drama_flix/feature/home/presentation/bloc/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterChipsBar extends StatelessWidget {
  final List<FilterModel> filterList;
  final FilterModel selectedFilter;

  const FilterChipsBar({
    super.key,
    required this.filterList,
    required this.selectedFilter,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: SizedBox(
          height: 35,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: filterList.length,
            itemBuilder: (context, index) {
              final filter = filterList[index];
              final isSelected = filter == selectedFilter;
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: ElevatedButton(
                  onPressed: () {
                    context.read<HomeCubit>().updateSelectedFilter(filter);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isSelected ? Colors.deepPurple : Colors.grey[700],
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    minimumSize: Size.zero,
                  ),
                  child: Text(filter.name),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}