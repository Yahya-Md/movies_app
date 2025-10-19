import 'package:flutter/material.dart';
import 'package:movies_app/core/style/app_colors.dart';
import 'package:movies_app/widgets/section_header_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SectionHeaderWidget(
                  rightTitle: 'View all',
                  leftTitle: 'Popular',
                  onTapRightButton: () {
                    // TODO: Add as dependency
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SectionHeaderWidget(
                  rightTitle: 'View all',
                  leftTitle: 'New',
                  onTapRightButton: () {
                    // TODO: Add as dependency
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
