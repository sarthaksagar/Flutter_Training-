import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: size.height * 0.22,
      child: Stack(
        children: [
          Image.asset(
            'assets/icons/searchBanner.jpeg',
            width: size.width,
            height: size.height * 0.22,
            fit: BoxFit.cover,
          ),

          Positioned(
            left: size.width * 0.12,
            top: size.height * 0.08,
            child: SizedBox(
              width: size.width * 0.65,
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter a text',
                  hintStyle: const TextStyle(
                    fontSize: 14,
                    color: Colors.blueGrey,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 16,
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assets/icons/searc1.png'),
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assets/icons/cam.png'),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            right: size.width * 0.05,
            top: size.height * 0.09,
            child: InkWell(
              onTap: () {},
              child: Image.asset(
                "assets/icons/bell.png",
                width: 30,
                height: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
