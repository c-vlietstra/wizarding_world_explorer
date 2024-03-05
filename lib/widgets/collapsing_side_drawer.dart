import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wizarding_world_explorer/models/navigation.dart';
import 'package:wizarding_world_explorer/providers/current_screen_provider.dart';
import 'package:wizarding_world_explorer/services/navigator_services.dart';
import 'package:wizarding_world_explorer/widgets/collapsing_list_tile.dart';

// A custom widget that creates a collapsible navigation drawer.
class CollapsingNavigationDrawer extends ConsumerStatefulWidget {
  const CollapsingNavigationDrawer({super.key});

  @override
  ConsumerState<CollapsingNavigationDrawer> createState() =>
      _CollapsingNavigationDrawerState();
}

class _CollapsingNavigationDrawerState
    extends ConsumerState<CollapsingNavigationDrawer>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> widthAnimation;
  final double maxWidth = 60; // The width of the drawer when collapsed.
  final double minWidth = 210; // The width of the drawer when expanded.

  @override
  void initState() {
    super.initState();
    // Initialize the animation controller and the width animation.
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    widthAnimation = Tween<double>(begin: maxWidth, end: minWidth)
        .animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    // Watch the isCollapsedProvider to determine the state of the drawer.
    final isCollapsed = ref.watch(isCollapsedProvider);

    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, widget) => Material(
        elevation: 8.0,
        child: Container(
          color: Theme.of(context).colorScheme.primaryContainer,
          width: widthAnimation.value, // The width is determined by the width animation.
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              // The user profile section at the top of the drawer.
              CollapsingListTile(
                onTap: () {},
                title: 'User',
                icon: FontAwesomeIcons.solidCircleUser,
                animationController: _animationController,
                isSelected: false,
              ),
              Divider(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                height: 40.0,
              ),
              // The list of navigation items.
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, counter) {
                    return Divider(
                      height: 12.0,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    );
                  },
                  itemBuilder: (context, counter) {
                    return CollapsingListTile(
                      onTap: () {
                        // Update the selected index and the current screen when a navigation item is tapped.
                        ref.read(selectedIndexProvider.notifier).state =
                            counter;
                        
                        ref.read(currentScreenProvider.notifier).state = navigationItems[counter].screen;
                      },
                      title: navigationItems[counter].title,
                      icon: navigationItems[counter].icon,
                      animationController: _animationController,
                      isSelected: ref.watch(selectedIndexProvider) == counter, // Highlight the selected item.
                    );
                  },
                  itemCount: navigationItems.length, // The number of navigation items.
                ),
              ),
              // The collapse/expand button at the bottom of the drawer.
              InkWell(
                onTap: () {
                  // Toggle the isCollapsed state and play the appropriate animation.
                  ref.read(isCollapsedProvider.notifier).state = !isCollapsed;
                  isCollapsed
                      ? _animationController.forward()
                      : _animationController.reverse();
                },
                child: AnimatedIcon(
                  progress: _animationController,
                  icon: AnimatedIcons.close_menu,
                  size: 42,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
              const SizedBox(
                height: 50.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}