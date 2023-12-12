import 'package:auto_route/auto_route.dart';
import 'package:crypto_app/router/router.dart';
import 'package:flutter/material.dart';

class SearchListTile extends StatelessWidget {
  const SearchListTile({
    super.key,
    required this.image,
    required this.name,
    required this.symbol,
    required this.marketCapRank,
    required this.id,
  });
  final String image;
  final String name;
  final String symbol;
  final int? marketCapRank;
  final String id;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      onTap: () {
        AutoRouter.of(context).push(CryptoCoinDetailsRoute(id: id));
      },
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
      trailing: marketCapRank != null
          ? Text(
              '$marketCapRank#',
              style: theme.textTheme.bodySmall?.copyWith(fontSize: 12),
            )
          : const SizedBox.shrink(),
    );
  }
}
