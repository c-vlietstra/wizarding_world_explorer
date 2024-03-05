import 'package:flutter/material.dart';

// A custom widget that creates a collapsible list tile.
class CollapsingListTile extends StatefulWidget {
  final String title; // The title of the list tile.
  final IconData icon; // The icon to display in the list tile.
  final AnimationController animationController; // The animation controller to control the collapse and expand animations.
  final Function()? onTap; // The function to execute when the tile is tapped.
  final bool isSelected; // A boolean to indicate if the tile is currently selected.

  // Constructor for the CollapsingListTile widget.
  const CollapsingListTile({
    required this.icon,
    required this.title,
    required this.animationController,
    required this.onTap,
    required this.isSelected,
    super.key,
  });

  @override
  State<CollapsingListTile> createState() => _CollapsingListTileState();
}

// The state class for the CollapsingListTile widget.
class _CollapsingListTileState extends State<CollapsingListTile> {
  late Animation<double> _widthAnimation, _sizedBoxAnimation; // Animations for the width of the tile and the space between the icon and the title.

  @override
  void initState() {
    super.initState();
    // Initialize the animations with the provided animation controller.
    _widthAnimation = Tween<double>(begin: 60, end: 200).animate(widget.animationController);
    _sizedBoxAnimation = Tween<double>(begin: 0, end: 10).animate(widget.animationController);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap, // Execute the onTap function when the tile is tapped.
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16.0)), // Rounded corners for the tile.
          color: widget.isSelected
              ? Colors.transparent.withOpacity(0.3) // Slightly opaque background if the tile is selected.
              : Colors.transparent, // Transparent background if the tile is not selected.
        ),
        width: _widthAnimation.value, // The width of the tile is determined by the width animation.
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: Row(
          children: [
            Icon(
              widget.icon, // Display the provided icon.
              color: Theme.of(context).colorScheme.onPrimaryContainer,
              size: 28,
            ),
            SizedBox(
              width: _sizedBoxAnimation.value, // The space between the icon and the title is determined by the sized box animation.
            ),
            (_widthAnimation.value >= 190)
                ? Text(
                    widget.title, // Display the title if the width is greater than or equal to 190.
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      fontSize: 20,
                    ),
                  )
                : Container(), // Do not display the title if the width is less than 190.
          ],
        ),
      ),
    );
  }
}
