import 'package:cached_network_image/cached_network_image.dart';
import 'package:drama_flix/common/widgets/common_dialog.dart';
import 'package:drama_flix/feature/login/domain/model/user.dart';
import 'package:drama_flix/feature/profile/presentation/bloc/location_cubit.dart';
import 'package:drama_flix/feature/profile/presentation/bloc/location_state.dart';
import 'package:drama_flix/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shimmer/shimmer.dart';

class ProfileHeader extends StatelessWidget {
  final User? user;

  const ProfileHeader({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);
    final topPadding = MediaQuery.of(context).padding.top;

    return Container(
      padding: EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        bottom: 20.0,
        top: topPadding + 10,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFE2C46C), Color(0xFFC78F04)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProfileHeader(appLocalizations, user),
          const SizedBox(height: 20),
          _buildVipSection(appLocalizations),
        ],
      ),
    );
  }
}

Widget _buildProfileHeader(AppLocalizations appLocalizations, User? user) {
  return Row(
    children: [
      CircleAvatar(
        radius: 20,
        backgroundColor: Colors.transparent,
        child: switch (user?.avatar) {
          final url? => CachedNetworkImage(
            imageUrl: url,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: const CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
              ),
            ),
            errorWidget: (context, url, error) {
              debugPrint("❌ Error loading avatar: $url, error: $error");
              return const Icon(Icons.perm_identity_outlined, color: Colors.red);
            },
          ),
          _ => const Icon(Icons.perm_identity_outlined, color: Colors.red),
        },
      ),

      SizedBox(width: 10),
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user?.name ?? appLocalizations.appbarTitleProfile,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            BlocListener<LocationCubit, LocationState>(
              listenWhen: (previous, current) => previous != current,
              listener: (context, state) async {
                state.mapOrNull(
                  denied: (_) {
                    showCommonDialog(
                      context: context,
                      title: appLocalizations.location_permission_title,
                      content: appLocalizations.location_permission_message,
                      negativeText: appLocalizations.location_permission_cancel,
                      positiveText: appLocalizations.location_permission_ok,
                      onPositive: () {
                        context
                            .read<LocationCubit>()
                            .requestPermissionLocation();
                      },
                    );
                  },
                  deniedForever: (_) {
                    showCommonDialog(
                      context: context,
                      title: appLocalizations
                          .location_permission_denied_forever_title,
                      content: appLocalizations
                          .location_permission_denied_forever_message,
                      negativeText: appLocalizations
                          .location_permission_denied_forever_close,
                      positiveText: appLocalizations
                          .location_permission_denied_forever_open_settings,
                      onPositive: () {
                        Geolocator.openAppSettings();
                      },
                    );
                  },
                );
              },
              child: BlocBuilder<LocationCubit, LocationState>(
                builder: (context, state) {
                  final tvLocation = state.when(
                    initial: () => appLocalizations.location_initial,
                    loading: () => appLocalizations.location_loading,
                    success: (country) => country,
                    failure: (err) => appLocalizations.location_failure(err),
                    denied: () => appLocalizations.location_denied,
                    deniedForever: () =>
                        appLocalizations.location_denied_forever,
                  );
                  return Text(
                    tvLocation,
                    style: TextStyle(color: Colors.white)
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget _buildVipSection(AppLocalizations appLocalizations) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
    decoration: BoxDecoration(
      gradient: const LinearGradient(
        colors: [Color(0xFFE2C46C), Color(0xFFC78F04)],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                appLocalizations.becomeVip,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                appLocalizations.enjoyAllThePerks,
                style: TextStyle(color: Colors.black54, fontSize: 14),
              ),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Text(appLocalizations.register),
        ),
      ],
    ),
  );
}
