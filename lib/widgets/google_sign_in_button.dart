import 'package:flutter/material.dart';

class GoogleSignInButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isLoading;
  final String text;
  final double? width;
  final double height;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final GoogleButtonStyle style;

  const GoogleSignInButton({
    super.key,
    required this.onPressed,
    this.isLoading = false,
    this.text = 'Continuar con Google',
    this.width,
    this.height = 48,
    this.borderRadius = 24, // Esquinas muy redondeadas como en la imagen
    this.padding,
    this.style = GoogleButtonStyle.light, // Estilo por defecto
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height,
      decoration: BoxDecoration(
        color: _getBackgroundColor(),
        borderRadius: BorderRadius.circular(borderRadius),
        border: _getBorder(),
        boxShadow: _getBoxShadow(),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius),
          onTap: isLoading ? null : onPressed,
          child: Padding(
            padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (isLoading) ...[
                  SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        _getTextColor(),
                      ),
                    ),
                  ),
                ] else ...[
                  // Logo de Google "G" multicolor
                  SizedBox(width: 18, height: 18, child: _buildGoogleLogo()),
                ],
                const SizedBox(width: 12),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: _getTextColor(),
                    letterSpacing: 0.25,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color _getBackgroundColor() {
    switch (style) {
      case GoogleButtonStyle.light:
        return Colors.white;
      case GoogleButtonStyle.dark:
        return Colors.black;
      case GoogleButtonStyle.lightNoBorder:
        return const Color(0xFFF8F9FA); // Gris muy claro
    }
  }

  Border? _getBorder() {
    switch (style) {
      case GoogleButtonStyle.light:
        return Border.all(
          color: const Color(0xFFB0B0B0), // Gris claro como en la imagen
          width: 1,
        );
      case GoogleButtonStyle.dark:
      case GoogleButtonStyle.lightNoBorder:
        return null;
    }
  }

  List<BoxShadow>? _getBoxShadow() {
    switch (style) {
      case GoogleButtonStyle.light:
      case GoogleButtonStyle.dark:
      case GoogleButtonStyle.lightNoBorder:
        return null;
    }
  }

  Color _getTextColor() {
    switch (style) {
      case GoogleButtonStyle.light:
      case GoogleButtonStyle.lightNoBorder:
        return Colors.black;
      case GoogleButtonStyle.dark:
        return Colors.white;
    }
  }

  Widget _buildGoogleLogo() {
    return CustomPaint(size: const Size(18, 18), painter: GoogleLogoPainter());
  }
}

// Estilos disponibles para el botón de Google
enum GoogleButtonStyle {
  light, // Blanco con borde gris (como el superior en la imagen)
  dark, // Negro sin borde (como el del medio en la imagen)
  lightNoBorder, // Gris claro sin borde (como el inferior en la imagen)
}

// Pintor para el logo de Google "G" más preciso
class GoogleLogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 1;

    // Colores oficiales de Google
    const red = Color(0xFFEA4335);
    const blue = Color(0xFF4285F4);
    const green = Color(0xFF34A853);
    const yellow = Color(0xFFFBBC05);

    final paint =
        Paint()
          ..style = PaintingStyle.fill
          ..strokeWidth = 1;

    // Crear el logo de Google "G" usando un enfoque más preciso
    // Dibujar el círculo exterior con colores segmentados

    // Segmento superior izquierdo (rojo)
    paint.color = red;
    _drawArcSegment(canvas, center, radius, -0.75, 0.5, paint);

    // Segmento superior derecho (amarillo)
    paint.color = yellow;
    _drawArcSegment(canvas, center, radius, -0.25, 0.5, paint);

    // Segmento inferior derecho (verde)
    paint.color = green;
    _drawArcSegment(canvas, center, radius, 0.25, 0.5, paint);

    // Segmento inferior izquierdo (azul)
    paint.color = blue;
    _drawArcSegment(canvas, center, radius, 0.75, 0.5, paint);

    // Círculo central blanco para crear el efecto "G"
    paint.color = Colors.white;
    canvas.drawCircle(center, radius * 0.6, paint);

    // Agregar el "G" central en negro
    paint.color = Colors.black;
    _drawGoogleG(canvas, center, radius * 0.4);
  }

  void _drawArcSegment(
    Canvas canvas,
    Offset center,
    double radius,
    double startAngle,
    double sweepAngle,
    Paint paint,
  ) {
    final rect = Rect.fromCircle(center: center, radius: radius);
    canvas.drawArc(
      rect,
      startAngle * 3.14159,
      sweepAngle * 3.14159,
      true,
      paint,
    );
  }

  void _drawGoogleG(Canvas canvas, Offset center, double size) {
    final paint =
        Paint()
          ..style = PaintingStyle.fill
          ..color = Colors.black;

    // Dibujar un "G" estilizado
    final path = Path();

    // Empezar desde la parte superior derecha
    path.moveTo(center.dx + size * 0.3, center.dy - size * 0.2);

    // Curva superior
    path.arcTo(
      Rect.fromCircle(center: center, radius: size * 0.3),
      -0.3, // startAngle
      1.2, // sweepAngle
      false,
    );

    // Línea inferior derecha
    path.lineTo(center.dx + size * 0.3, center.dy + size * 0.2);

    // Curva inferior
    path.arcTo(
      Rect.fromCircle(center: center, radius: size * 0.3),
      1.2, // startAngle
      1.2, // sweepAngle
      false,
    );

    // Línea inferior izquierda
    path.lineTo(center.dx - size * 0.3, center.dy + size * 0.2);

    // Curva izquierda
    path.arcTo(
      Rect.fromCircle(center: center, radius: size * 0.3),
      2.7, // startAngle
      1.2, // sweepAngle
      false,
    );

    // Línea superior izquierda
    path.lineTo(center.dx - size * 0.3, center.dy - size * 0.2);

    // Curva superior
    path.arcTo(
      Rect.fromCircle(center: center, radius: size * 0.3),
      3.9, // startAngle
      0.6, // sweepAngle
      false,
    );

    // Cerrar el path
    path.close();

    // Dibujar el path
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
