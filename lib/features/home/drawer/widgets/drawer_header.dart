import 'package:flutter/material.dart';
import 'package:live_tracking/core/utils/assets.dart';
import 'package:live_tracking/features/auth/models/user_model.dart';
import 'package:live_tracking/features/data/services/user_services.dart';

class DrawerHeaderInfo extends StatefulWidget {
  const DrawerHeaderInfo({super.key});

  @override
  State<DrawerHeaderInfo> createState() => _DrawerHeaderInfoState();
}

class _DrawerHeaderInfoState extends State<DrawerHeaderInfo> {
  UserModel? user;
  bool isLoading = true; // هنا بنستخدم loading

  @override
  void initState() {
    super.initState();
    _fetchUserProfile();
  }

  Future<void> _fetchUserProfile() async {
    try {
      final profile = await UserService().getUserProfile();
      if (!mounted) return; // مهم جداً قبل أي setState
      setState(() {
        user = profile;
        isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() => isLoading = false);
      print('Failed to load profile: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      height: 300,
      padding: const EdgeInsets.only(top: 40),
      decoration: BoxDecoration(
        color: theme.brightness == Brightness.dark
            ? const Color(0XFF7B7B7B)
            : const Color(0XFFE2F2FF),
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(40),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black.withOpacity(0.2), width: 1),
              image: const DecorationImage(
                image: AssetImage(AssetsData.profilephoto),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          isLoading
              ? const CircularProgressIndicator() // عرض loading أثناء التحميل
              : Column(
                  children: [
                    Text(
                      user?.name ?? 'No Name',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.brightness == Brightness.dark
                            ? Colors.white
                            : const Color.fromARGB(255, 53, 53, 53),
                      ),
                    ),
                    Text(
                      user?.email ?? 'No Email',
                      style: TextStyle(
                        fontSize: 14,
                        color: theme.brightness == Brightness.dark
                            ? Colors.white
                            : const Color(0xFF7B7B7B),
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
