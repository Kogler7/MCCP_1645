import 'package:flutter/material.dart';

class FlatListTile extends StatelessWidget {
  final double height;
  final String text;
  final bool hasDetail;
  final Function()? onTap;

  const FlatListTile({
    Key? key,
    this.height = 32,
    this.text = '',
    this.hasDetail = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: SizedBox(
          height: height,
          child: Row(
            children: [
              Expanded(
                child: Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
              hasDetail
                  ? const Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.grey,
                      size: 20,
                    )
                  : const Text(''),
            ],
          ),
        ),
      ),
    );
  }
}
