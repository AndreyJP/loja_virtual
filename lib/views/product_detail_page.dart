import 'package:flutter/material.dart';
import 'package:loja_virtual/models/product.dart';

class ProductDetail extends StatefulWidget {
  final Product product;

  const ProductDetail({super.key, required this.product});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.title),
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView(
        children: [
          Image.network(
            widget.product.thumbnail,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.product.title,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '\$ ${widget.product.price.toString()},00',
                  style: const TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.product.description,
                  style: const TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Outras fotos:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                  itemCount: widget.product.images.length,
                  itemBuilder: (context, index) {
                    return AspectRatio(
                      aspectRatio: 16 / 8,
                      child: Image.network(
                        widget.product.images[index],
                        fit: BoxFit.fitWidth,
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
