import 'package:flutter/material.dart';

class CollapsingListTile extends StatefulWidget {
  final String title;
  final IconData icon;
  final AnimationController animationController;
  final Function()? onTap;
  final bool isSelected;

  const CollapsingListTile(
      {required this.icon,
      required this.title,
      required this.animationController,
      required this.onTap,
      required this.isSelected,
      super.key});

  @override
  State<CollapsingListTile> createState() => _CollapsingListTileState();
}

class _CollapsingListTileState extends State<CollapsingListTile> {
  late Animation<double> _widthAnimation, _sizedBoxAnimation;

  @override
  void initState() {
    super.initState();
    _widthAnimation =
        Tween<double>(begin: 200, end: 60).animate(widget.animationController);
    _sizedBoxAnimation =
        Tween<double>(begin: 10, end: 0).animate(widget.animationController);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          color: widget.isSelected
              ? Colors.transparent.withOpacity(0.3)
              : Colors.transparent,
        ),
        width: _widthAnimation.value,
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: Row(
          children: [
            Icon(
              widget.icon,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
              size: 28,
            ),
            SizedBox(
              width: _sizedBoxAnimation.value,
            ),
            (_widthAnimation.value >= 190)
                ? Text(
                    widget.title,
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      fontSize: 20,
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
