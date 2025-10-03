import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).primaryColor.withOpacity(0.8),
              Theme.of(context).primaryColor.withOpacity(0.5),
            ]
          )
        ),
        child: Stack(
          children: [
            Positioned.fill(
                child: Opacity(
                  opacity: 0.05,
                  child: GridPattern(
                    color: Colors.white
                  ),
                )
            )
          ],
        ),
      )
    );
  }
}

class GridPattern extends StatelessWidget {
  final Color color;

  const GridPattern ({
    Key? key,
    required this.color
  }): super(key : key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: GridPainter(color: color),
    );
  }
}

class GridPainter extends CustomPainter {
  final Color color;

  GridPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
        ..color = color
        ..strokeWidth = 0.5;

    final spacing = 20.0;

    for( var i = 0.0; i < size.width; i += spacing ) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }

    for( var i = 0.0; i < size.height; i += spacing ) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDeletate) => false;
}