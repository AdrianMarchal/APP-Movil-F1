
import 'package:f1_app_final/models/noticias_model.dart';
import 'package:f1_app_final/providers/noticias_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class NoticiaSearchDelegate extends SearchDelegate {
  String? get searchFieldLabel => 'Buscar Noticia';
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    final noticiasProvider = Provider.of<NoticiasProvider>(context);
    return FutureBuilder(
      future: noticiasProvider.buscarNoticias(query),
      builder: (BuildContext context, AsyncSnapshot<List<Noticia>> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            final noticia = snapshot.data![index];

            return _SuggestionItem(noticia: noticia);
          },
        );
      },
    );
  }
}

class _SuggestionItem extends StatelessWidget {
  final Noticia noticia;
  _SuggestionItem({super.key, required this.noticia});

  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      onTap: () async {
      
        context.push(
            "/detailNoticia",
            extra: {
              'noticia': noticia,
            },
        );
      },
      child: Hero(
        tag: noticia.id.toString() + "noticiaSearch",
        child: ListTile(
          leading: SizedBox(
            height: 75,
            width: 75,
            child: FadeInImage(
              placeholder: AssetImage('assets/images/loading.gif'),
              image: (noticia.img == null)
                  ? AssetImage('assets/images/no-image.jpg')
                  : NetworkImage(noticia.img),
              width: 50,
              fit: BoxFit.contain,
            ),
          ),
          title: Text(noticia.titulo),
        ),
      ),
    );
  }
}
