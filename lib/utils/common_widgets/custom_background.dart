import '../../app/index.dart';

class CustomBackground extends CustomPainter{
   @override
  void paint(Canvas canvas, Size size){
     final paint = Paint()..color = Colors.green;

     final path = Path();

     path.moveTo(0, 0);
     path.lineTo(size.width * 1/2, size.height * 1/6);

     canvas.drawPath(path, paint);
   }

   @override
   bool shouldRepaint(covariant oldDelegate) => false;
}