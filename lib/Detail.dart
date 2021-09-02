import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class Detail extends StatefulWidget {
  final String? title;
  final String? contenido;
  const Detail({Key? key, this.title, this.contenido}) : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.title}'),
      ),
      body: ListView(
        children: [Padding(
          padding: EdgeInsets.all(10),
          child: HtmlWidget('${widget.contenido}',customStylesBuilder: (element) {
            if (element.classes.contains('hljs-string')) {
              return {'color': '#42b983'};
            }
            if (element.classes.contains('hljs-name')) {
              return {'color': '#2973b7'};
            }
            if (element.classes.contains('hljs-tag')) {
              return {'color': '#2973b7'};
            }
            if (element.classes.contains('hljs-comment')) {
              return {'color': '#b3b3b3'};
            }

            return null;
          },),
        )],
      )
    );
  }
}
