import 'package:flutter/material.dart';

class SearchListTile extends StatelessWidget {
  const SearchListTile({
    super.key,
    required this.image,
    required this.name,
    required this.symbol,
    required this.marketCapRank,
  });
  final String image;
  final String name;
  final String symbol;
  final int marketCapRank;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: AspectRatio(
        aspectRatio: 0.45,
        child: Image.network(
          image,
        ),
      ),
      title: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                symbol,
                style: theme.textTheme.bodySmall,
                textAlign: TextAlign.start,
              ),
              Text(
                name,
                style: theme.textTheme.bodySmall,
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ],
      ),
      trailing: Text('$marketCapRank#'),
    );
  }
}
