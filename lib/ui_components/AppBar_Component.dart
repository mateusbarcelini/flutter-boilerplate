import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import '../models/constans_colors.dart';

class AppBarComponent extends StatelessWidget implements PreferredSizeWidget {

  const AppBarComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Image.asset("src/images/logo.png"),
      centerTitle: true,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(48),
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, bottom:  16.0, right:  16.0),
          child: SizedBox(
            height: 32,
            child: TextField(
              decoration: InputDecoration(
                hintText: "Buscar por produtos",
                hintStyle: const TextStyle(fontStyle: FontStyle.italic, height: 0.5),
                suffixIcon: const Icon(Icons.search, color: Color(ConstantsColors.int_primary),),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3),
                    borderSide: BorderSide.none
                ),
                filled: true,
                fillColor: Colors.white,

              ),
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: (){},
          child: Badge(
            badgeColor: Colors.white,
            borderSide: const BorderSide(
                color: Color(ConstantsColors.int_primary),
                width: 2
            ),
            badgeContent:  const Text('0', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),)
            ,
            child: Image.asset("src/images/shopping_cart.png", width: 26, height: 26,),
          ),
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => new Size.fromHeight(100);
}
