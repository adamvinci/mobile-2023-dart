import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/click_view_model.dart';


class ListScreen extends StatelessWidget {
  const ListScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
 // TODO F07 get state from view model
    return Consumer<ClickViewModel>(
      builder: (context, viewModel, child) =>
    Scaffold(
      appBar: AppBar(
        title: const Text("Articles"),
        actions: [
          IconButton(
            icon: viewModel.afficherLu
                ? const Icon(Icons.check_box)
                : const Icon(Icons.check_box_outline_blank),
            onPressed: () {
              viewModel.changeAfficherLue(viewModel.afficherLu);
            }, // TODO F07 show/hide read articles
          ),
          IconButton(icon: const Icon(Icons.abc), onPressed: () {}),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, "/form"),
        // TODO F06 go to create screen
        child: const Icon(Icons.add),
      ),

      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: viewModel.items.isEmpty
            ? const Center(
          child: Text("There are no articles yet. Create one!"),
        )
            : ListView.builder(
          itemCount: viewModel.items.length,
          itemBuilder: (context, index) {
            var article = viewModel.items[index];
            return Column(
                children: [
            ListTile(
            leading: IconButton(
            icon: article.read
                ? const Icon(Icons.
                check_box): const Icon(Icons.check_box_outline_blank),
            onPressed: () {

            viewModel.markAsRead(article);

            },// TODO F07 mark as read
            ),
            title: Text(article.title),
            subtitle: Text(article.author),
            onTap: ()=>Navigator.pushNamed(context, "/article",arguments: viewModel.items[index]), // TODO F06 go to article
            trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {

            viewModel.remove(article);
            },
          // TODO F07 delete article
        ),
      ),
      const Divider(),
      ],
    );
  }

  ,

  )

  ,

  )

  ,
    ),
  );
}
}
