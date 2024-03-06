// Importing necessary Flutter material widgets.
import 'package:flutter/material.dart';

// Creating a custom widget 'AnimatedExpansionTile' which extends StatefulWidget.
class AnimatedExpansionTile extends StatefulWidget {
  // Defining properties for the widget.
  final Widget title; // The title widget displayed in the ListTile.
  final Widget subtitle; // The subtitle widget displayed in the ListTile.
  final List<Widget> children; // The list of children widgets to display when expanded.
  final AnimatedIconData animatedIcon; // The icon to animate when expanding/collapsing.

  // Constructor for AnimatedExpansionTile with required properties.
  const AnimatedExpansionTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.children,
    required this.animatedIcon,
  }) : super(key: key);

  @override
  // Creating the state for this widget.
  State<AnimatedExpansionTile> createState() => _AnimatedExpansionTileState();
}

// Defining the state class for AnimatedExpansionTile.
class _AnimatedExpansionTileState extends State<AnimatedExpansionTile>
    with SingleTickerProviderStateMixin { // Using SingleTickerProviderStateMixin for animation.
  late AnimationController _controller; // Controller for the animation.
  late Animation<double> _heightFactor; // Animation for the height factor.
  bool _isExpanded = false; // State to track if the tile is expanded.

  @override
  void initState() {
    super.initState();
    // Initializing the animation controller with a duration of 200 milliseconds.
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    // Defining the height factor animation from 0.0 to 1.0.
    _heightFactor = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    // Disposing the animation controller when the widget is removed from the tree.
    _controller.dispose();
    super.dispose();
  }

  // Function to handle tap events on the ListTile.
  void _handleTap() {
    setState(() {
      // Toggling the expanded state.
      _isExpanded = !_isExpanded;
    });

    // Playing the animation forward or reverse based on the expanded state.
    if (_isExpanded) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    // Building the widget layout.
    return Card(
      child: Column(
        children: [
          ListTile(
            title: widget.title, // Displaying the title widget.
            subtitle: widget.subtitle, // Displaying the subtitle widget.
            trailing: AnimatedIcon(
              icon: widget.animatedIcon, // Displaying the animated icon.
              progress: _controller, // Binding the animation controller to the icon.
            ),
            onTap: _handleTap, // Handling tap events.
          ),
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              // Clipping the child widget based on the height factor animation.
              return ClipRect(
                child: Align(
                  heightFactor: _heightFactor.value, // Setting the height factor.
                  child: child, // The child widget to display when expanded.
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12.0, left: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: widget.children, // Displaying the list of children widgets.
              ),
            ),
          ),
        ],
      ),
    );
  }
}
