import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/pages/frontFoot_page.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Stack(
          children: [
            ClipRRect(
              child: Image.asset(
                'assets/images/musclesbgrfb.png',
                color: Colors.purple[300],
                colorBlendMode: BlendMode.modulate,
              ),
            ),
            Positioned(
              left: 145,
              top: 500,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context){
                      return FrontFootPage();
                    })
                  );
                },
                child: Container(width: 30, height: 30, color: Colors.amber.withAlpha(0))
              ),
            ),
            Positioned(
              left: 105,
              top: 500,
              child: GestureDetector(
                onTap: () => print("rear foot"),
                child: Container(width: 30, height: 30, color: Colors.amber.withAlpha(0))
              ),
            ),
            Positioned(
              left: 0,
              top: 240,
              child: GestureDetector(
                onTap: () => print("rear hand"),
                child: Container(width: 40, height: 55, color: Colors.amber.withAlpha(0))
              ),
            ),
            Positioned(
              left: 240,
              top: 240,
              child: GestureDetector(
                onTap: () => print("front hand"),
                child: Container(width: 40, height: 55, color: Colors.amber.withAlpha(0))
              ),
            ),
            Positioned(
              left: 145,
              top: 385,
              child: GestureDetector(
                onTap: () => print("front calf"),
                child: Container(width: 35, height: 90, color: Colors.amber.withAlpha(0))
              ),
            ),
            Positioned(
              left: 100,
              top: 385,
              child: GestureDetector(
                onTap: () => print("rear calf"),
                child: Container(width: 35, height: 90, color: Colors.amber.withAlpha(0))
              ),
            ),
            Positioned(
              left: 90,
              top: 285,
              child: GestureDetector(
                onTap: () => print("hamstrings"),
                child: Container(width: 45, height: 60, color: Colors.amber.withAlpha(0))
              ),
            ),
            Positioned(
              left: 145,
              top: 285,
              child: GestureDetector(
                onTap: () => print("quads"),
                child: Container(width: 45, height: 60, color: Colors.amber.withAlpha(0))
              ),
            ),
            Positioned(
              left: 90,
              top: 350,
              child: GestureDetector(
                onTap: () => print("knee"),
                child: Container(width: 100, height: 30, color: Colors.amber.withAlpha(0))
              ),
            ),
            Positioned(
              left: 95,
              top: 230,
              child: GestureDetector(
                onTap: () => print("glutes"),
                child: Container(width: 40, height: 45, color: Colors.amber.withAlpha(0))
              ),
            ),
            Positioned(
              left: 145,
              top: 230,
              child: GestureDetector(
                onTap: () => print("pelvis"),
                child: Container(width: 40, height: 45, color: Colors.amber.withAlpha(0))
              ),
            ),
            Positioned(
              left: 140,
              top: 140,
              child: GestureDetector(
                onTap: () => print("core"),
                child: Container(width: 45, height: 80, color: Colors.amber.withAlpha(0))
              ),
            ),
            Positioned(
              left: 100,
              top: 110,
              child: GestureDetector(
                onTap: () => print("back"),
                child: Container(width: 35, height: 110, color: Colors.amber.withAlpha(0))
              ),
            ),
            Positioned(
              left: 70,
              top: 85,
              child: GestureDetector(
                onTap: () => print("shoulders"),
                child: Container(width: 30, height: 40, color: Colors.amber.withAlpha(0))
              ),
            ),
            Positioned(
              left: 180,
              top: 85,
              child: GestureDetector(
                onTap: () => print("shoulders"),
                child: Container(width: 30, height: 40, color: Colors.amber.withAlpha(0))
              ),
            ),
            Positioned(
              left: 140,
              top: 95,
              child: GestureDetector(
                onTap: () => print("chest"),
                child: Container(width: 35, height: 40, color: Colors.amber.withAlpha(0))
              ),
            ), 
            Positioned(
              left: 187.5,
              top: 130,
              child: GestureDetector(
                onTap: () => print("bicep"),
                child: Container(width: 30, height: 40, color: Colors.amber.withAlpha(0))
              ),
            ),
            Positioned(
              left: 60,
              top: 130,
              child: GestureDetector(
                onTap: () => print("tricep"),
                child: Container(width: 30, height: 40, color: Colors.amber.withAlpha(0))
              ),
            ),
            Positioned(
              left: 120,
              top: 45,
              child: GestureDetector(
                onTap: () => print("neck"),
                child: Container(width: 40, height: 30, color: Colors.amber.withAlpha(0))
              ),
            ),
          ],
        ),
      )
    );
  }
}