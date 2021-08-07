import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/product.dart';

import '../screens/edit_product_screen.dart';
import '../providers/products.dart';

class UserProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  UserProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    return ListTile(
        title: Text(title),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(imageUrl),
        ),
        trailing: Container(
          width: 100,
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(EditProductScreen.routeName, arguments: id);
                },
                color: Theme.of(context).primaryColor,
              ),
              IconButton(
                  icon: Icon(Icons.delete),
<<<<<<< HEAD
                  onPressed: () async {
                    try {
                      Provider.of<Products>(context, listen: false)
                          .deleteProduct(id);
                    } catch (error) {
                      scaffold.showSnackBar(SnackBar(content: Text('Deleting failed!', textAlign: TextAlign.center,)));
                    }
=======
                  onPressed: () {
                    Provider.of<Products>(context).deleteProduct(id);
>>>>>>> parent of cd0e298 (fixed edit bug and finished till 253)
                  },
                  color: Theme.of(context).errorColor),
            ],
          ),
        ));
  }
}
