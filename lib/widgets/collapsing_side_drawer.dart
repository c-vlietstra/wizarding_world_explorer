import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wizarding_world_explorer/models/navigation.dart';
import 'package:wizarding_world_explorer/providers/current_screen_provider.dart';
import 'package:wizarding_world_explorer/services/navigator_services.dart';
import 'package:wizarding_world_explorer/widgets/collapsing_list_tile.dart';

class CollapsingNavigationDrawer extends ConsumerStatefulWidget {
  final WidgetRef ref;

  const CollapsingNavigationDrawer({required this.ref, super.key});

  @override
  ConsumerState<CollapsingNavigationDrawer> createState() =>
      _CollapsingNavigationDrawerState();
}

class _CollapsingNavigationDrawerState
    extends ConsumerState<CollapsingNavigationDrawer>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> widthAnimation;
  final double maxWidth = 210;
  final double minWidth = 60;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    widthAnimation = Tween<double>(begin: maxWidth, end: minWidth)
        .animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    final isCollapsed = ref.watch(isCollapsedProvider);

    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, widget) => Material(
        elevation: 8.0,
        child: Container(
          color: Theme.of(context).colorScheme.primaryContainer,
          width: widthAnimation.value,
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
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
                        ref.read(selectedIndexProvider.notifier).state =
                            counter;
                        
                        ref.read(currentScreenProvider.notifier).state = navigationItems[counter].screen;
                      },
                      title: navigationItems[counter].title,
                      icon: navigationItems[counter].icon,
                      animationController: _animationController,
                      isSelected: ref.watch(selectedIndexProvider) == counter,
                    );
                  },
                  itemCount: navigationItems.length,
                ),
              ),
              InkWell(
                onTap: () {
                  ref.read(isCollapsedProvider.notifier).state = !isCollapsed;
                  isCollapsed
                      ? _animationController.reverse()
                      : _animationController.forward();
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
