
import 'package:flutter/material.dart';

class ProductDetailsImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.38,
      child: Hero(
        tag: 22.toString(),
        child: Image.network(
          "https://www.tresemme.com/content/dam/unilever/tresemme/south_africa/pack_shot/front/hair_care/wash_and_care/tresemm%C3%A9_expert_selection_conditioner_keratin_smooth_750ml/tresemme_keratin_smooth_conditioner_750ml_fop-953090-png.png",
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
