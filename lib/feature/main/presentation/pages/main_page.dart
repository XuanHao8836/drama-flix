import 'package:drama_flix/feature/bottom_nav/presentation/bloc/bottom_nav_cubit.dart';
import 'package:drama_flix/feature/bottom_nav/presentation/bloc/bottom_nav_state.dart';
import 'package:drama_flix/feature/home/presentation/pages/home_page.dart';
import 'package:drama_flix/feature/profile/presentation/pages/profile_page.dart';
import 'package:drama_flix/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  static final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    const Center(child: Text('Movies Page', style: TextStyle(fontSize: 30))),
    const Center(child: Text('TV Shows Page', style: TextStyle(fontSize: 30))),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return BlocBuilder<BottomNavCubit, BottomNavState>(
      builder: (context, state) {
        final selectedIndex = state.selectedIndex;

        return Scaffold(
          extendBody: true,
          body: _widgetOptions.elementAt(selectedIndex),
          bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: const Icon(Icons.home),
                label: AppLocalizations.of(context).bottomNavHome ,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.movie),
                label:
                    AppLocalizations.of(context).bottomNavTheater ,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.tv),
                label:
                    AppLocalizations.of(context).bottomNavHistory,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label:
                    AppLocalizations.of(context).bottomNavProfile,
              ),
            ],
            currentIndex: selectedIndex,
            selectedItemColor: Colors.amber[800],
            unselectedItemColor: Colors.grey,
            onTap: (index) {
              context.read<BottomNavCubit>().updateIndex(index);
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.black,
          ),
        );
      },
    );
  }
}
