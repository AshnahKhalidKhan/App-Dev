import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'model/product.dart';
import 'model/products_repository.dart';
import 'list_api.dart';


class HomePage extends StatelessWidget
{
  const HomePage({Key? key}) : super(key: key);

  // List<Card> _buildGridCards(int count)
  // {
  //   List<Card> cards = List.generate
  //   (
  //     count,
  //     (int index)
  //     {
  //       return Card
  //       (
  //         clipBehavior: Clip.antiAlias,
  //         child: Column
  //         (
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: <Widget>
  //           [
  //             AspectRatio
  //             (
  //               aspectRatio: 18.0 / 11.0,
  //               child: Image.asset('android/assets/unnamed.png'),
  //             ),
  //             Padding
  //             (
  //               padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
  //               child: Column
  //               (
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: const <Widget>
  //                 [
  //                   Text('Title'),
  //                   SizedBox(height: 8.0),
  //                   Text('Secondary text'),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  //   return cards;
  // } 
  
  List<Card> _buildGridCards(BuildContext context)
  {
    List<Product> products = ProductsRepository.loadProducts(Category.all);
    if (products.isEmpty)
    {
      return const <Card>[];
    }
    final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = NumberFormat.simpleCurrency
    (
      locale: Localizations.localeOf(context).toString());
      return products.map((product)
      {
        return Card
        (
          clipBehavior: Clip.antiAlias,
          child: Column
          (
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>
            [
              AspectRatio
              (
                aspectRatio: 18 / 11,
                child: Image.asset
                (
                  product.assetName,
                  package: product.assetPackage,
                ),
              ),
              Expanded
              (
                child: Padding
                (
                  padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                  child: Column
                  (
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>
                    [
                      Text
                      (
                        product.name,
                        style: theme.textTheme.titleLarge,
                        maxLines: 1,
                      ),
                      const SizedBox(height: 8.0),
                      Text
                      (
                        formatter.format(product.price),
                        style: theme.textTheme.titleSmall,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }
    ).toList();
  }

  // List<Users>_buildGridCards(BuildContext context)
  // {
  //   Future<List<Users>> products = fetchUsers();
  //   List<Users> a = FutureBuilder<List<Users>>
  //       (
  //         future: fetchUsers(),
  //         builder: (context, snapshot)
  //         {
  //           if (snapshot.hasData)
  //           {
  //             return ListView.builder
  //             (
  //               itemCount: snapshot.data?.length,
  //               itemBuilder: (context, i)
  //               {
  //                 var item = snapshot.data![i];
  //                 // return Text(item.title);
  //                 return Card
  //                 (
  //                   child: ListTile
  //                   (
  //                     title: Text
  //                     (
  //                       item.title,
  //                     ),
  //                   ),
  //                 );
  //               },
  //             );
  //           }
  //           else if (snapshot.hasError)
  //           {
  //             return Text('${snapshot.error}');
  //           }
  //           else
  //           {
  //             return const CircularProgressIndicator();
  //           }
  //         }
  //       ) as List<Users>;

  //   return a;
  // }



  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      appBar: AppBar
      (
        leading: IconButton
        (
          icon: const Icon
          (
            Icons.menu,
            semanticLabel: 'menu',
          ),
          onPressed: ()
          {
            print('Menu Bitton');
          },
        ),
        title: const Text('SHRINE'),
        actions: <Widget>
        [
          IconButton
          (
            icon: const Icon
            (
              Icons.search,
              semanticLabel: 'seearch',
            ),
            onPressed: ()
            {
              print('Search Button');
            },
          ),
          IconButton
          (
            icon: const Icon
            (
              Icons.tune,
              semanticLabel: 'filter',
            ),
            onPressed: ()
            {
              print('Filter Button');
            },
          ),
        ],
      ),
      body: GridView.count
      (
        // crossAxisCount: 2,
        // padding: const EdgeInsets.all(16.0),
        // childAspectRatio: 8.0 / 9.0,
        // children: <Widget>
        // [
        //   Card
        //   (
        //     clipBehavior: Clip.antiAlias,
        //     child: Column
        //     (
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: <Widget>
        //       [
        //         AspectRatio
        //         (
        //           aspectRatio: 18.0 / 11.0,
        //           child: Image.asset('android/assets/unnamed.png')
        //         ),
        //         Padding
        //         (
        //           padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
        //           child: Column
        //           (
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: <Widget>
        //             [
        //               Text('Title'),
        //               const SizedBox(height: 8.0),
        //               Text('Secondary Text'),
        //             ],
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ],
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16.0),
        childAspectRatio: 8.0 / 9.0,
        children: _buildGridCards(context),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}


