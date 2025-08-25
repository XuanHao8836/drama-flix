import 'package:cached_network_image/cached_network_image.dart';
import 'package:drama_flix/feature/language/presentation/pages/language_page.dart';
import 'package:drama_flix/feature/login/domain/model/user.dart';
import 'package:drama_flix/feature/login/presentation/bloc/auth_cubit.dart';
import 'package:drama_flix/feature/login/presentation/bloc/auth_state.dart';
import 'package:drama_flix/feature/profile/presentation/bloc/location_cubit.dart';
import 'package:drama_flix/feature/profile/presentation/widget/menu_item.dart';
import 'package:drama_flix/feature/profile/presentation/widget/profile_header.dart';
import 'package:drama_flix/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, authState) {
              return BlocProvider(
                create: (_) => LocationCubit()..checkPermissionLocation(),
                child: ProfileHeader(user: authState.user),
              );
            },
          ),
          const SizedBox(height: 20),
          MenuItem(
            icon: Icons.history,
            title: appLocalizations.watchHistory ,
            onTap: () {},
          ),
          MenuItem(
            icon: Icons.favorite_border,
            title: appLocalizations.myFavorite ,
            onTap: () {},
          ),
          MenuItem(
            icon: Icons.language,
            title: appLocalizations.displayLanguage ,
            trailingText: appLocalizations.english ,
            onTap: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => LanguagePage()));
            },
          ),
          MenuItem(
            icon: Icons.settings,
            title: appLocalizations.settings,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
