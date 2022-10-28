import 'dart:ui';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:rate/rate.dart';

import '../models/constans_colors.dart';


class ProductBoxComponent extends StatelessWidget {

  final String name;
  final String image;
  final double price;
  final double rate;
  final int reviews;
  final int id;

  const ProductBoxComponent({Key? key, required this.name, required this.image, required this.price, required this.rate, required this.reviews, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: const Color(ConstantsColors.int_borderproductbox), width: 1),
        color: Colors.white
      ),
      child: layout(context),
    );
  }
  
  Widget layout(context){
    return
      Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  image,
                  fit: BoxFit.fitHeight,
                  height: 144,
                  width: 144,
                ),
                const SizedBox(height: 5,),
                Text(name,
                    style: const TextStyle(color: Color(ConstantsColors.int_textproductprimary), fontSize: 12),
                ),
                const SizedBox(height: 15,),
                Row(
                  children: [
                    Text("R\$ ${price.toStringAsFixed(2)}",
                      style: const TextStyle(color: Color(ConstantsColors.int_textproductprimary), fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(width: 10,),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    Rate(
                      iconSize: 14,
                      color: const Color(ConstantsColors.int_primary),
                      allowHalf: true,
                      allowClear: true,
                      initialValue: rate + .0,
                      readOnly: false,
                      onChange: (value) => print(value), //TODO - Adicionar avaliação
                    ),
                    Text("($reviews)", style: const TextStyle(color: Color(ConstantsColors.int_textproductsecundary), fontSize: 10,),)
                  ],
                ),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: (){
                        // TODO - adicionar ao carrinho
                      },
                      child: const Text("Comprar")),
                )
              ],

            ),
      );
  }
}

