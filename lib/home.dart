import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:mdc_101_flutter/models/product.dart';
import 'package:mdc_101_flutter/models/products_repository.dart';

class HomePage extends StatelessWidget {
  // TODO: Make a collection of cards (102)
  List<Card> _buildGridCards(BuildContext context) {
    List<Product> products = ProductsRepository.loadProducts(Category.all);

    if (products.isEmpty) {
      return const <Card>[];
    }

    final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());

    return products
        .map((product) => Card(
              clipBehavior: Clip.antiAlias,
              // TODO: Adjust card heights (103)
              child: Column(
                // TODO: Center items on the card (103)
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 18.0 / 11.0,
                    child: Image.asset(
                      product.assetName,
                      package: product.assetPackage,
                      // TODO: Adjust the box size (102)
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                      child: Column(
                        // TODO: Align labels to the bottom and center (103)
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // TODO: Change innermost Column (103)
                        children: <Widget>[
                          // TODO: Handle overflowing labels (103)
                          Text(
                            product.name,
                            style: theme.textTheme.headline6,
                            maxLines: 1,
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            formatter.format(product.price),
                            style: theme.textTheme.subtitle2,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ))
        .toList();
  }

  // TODO: Add a variable for Category (104)
  @override
  Widget build(BuildContext context) {
    // TODO: Return an AsymmetricView (104)
    // TODO: Pass Category variable to AsymmetricView (104)
    return Scaffold(
      // TODO: Add app bar (102)
      appBar: AppBar(
        // TODO: Add buttons and title (102)
        leading: IconButton(
          icon: Icon(Icons.menu, semanticLabel: 'menu'),
          onPressed: () {
            print('Menu button');
          },
        ),
        title: Text('DIAMOND'),
        // TODO: Add trailing buttons (102)
        actions: <Widget>[
          IconButton(
            onPressed: () {
              print('Search Button');
            },
            icon: Icon(
              Icons.search,
              semanticLabel: 'search',
            ),
          ),
          IconButton(
            onPressed: () {
              print('Filter Button');
            },
            icon: Icon(
              Icons.tune,
              semanticLabel: 'filter',
            ),
          ),
        ],
      ),
      // TODO: Add a grid view (102)
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16.0),
        childAspectRatio: 8.0 / 9.0,
        // TODO: Build a grid of cards (102)
        children: _buildGridCards(context), //// List from collection of cards
      ),
      // TODO: Set resizeToAvoidBottomInset (101)
      resizeToAvoidBottomInset: false,
    );
  }
}
