import 'package:drama_flix/feature/home/data/model/filter_model.dart';
import 'package:drama_flix/feature/home/presentation/bloc/home_cubit.dart';
import 'package:drama_flix/feature/home/presentation/bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterChipsBar extends StatelessWidget {
  const FilterChipsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeCubit, HomeState, (List<FilterModel>, FilterModel)>(
      selector: (state) => state.maybeMap(
        loaded:
            (s) => (s.filterList, s.selectedFilter),
        orElse: () => ([], FilterModel(id: '', name: '')),
      ),
      builder: (context, data) {
        final (filterList, selectedFilter) = data;
        return SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 10.0,
            ),
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
                        backgroundColor: isSelected
                            ? Colors.deepPurple
                            : Colors.grey[700],
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
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
      },
    );
  }
}
