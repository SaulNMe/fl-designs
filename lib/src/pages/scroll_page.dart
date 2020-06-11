import 'package:flutter/material.dart';

class ScrollPage extends StatelessWidget {

  final pageController = new PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        scrollDirection: Axis.vertical,
        children: <Widget>[
          _pagina1(),
          _pagina2(),
        ],
      ),
    );
  }

  Widget _pagina1() {
    return Stack(
      children: <Widget>[
        _colorFondo(),
        _imagenFondo(),
        _textos(),
      ],
    );
  }

  Widget _colorFondo() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(108, 192, 218, 1.0),
    );
  }

  Widget _imagenFondo() {
    var container = Container(
          width: double.infinity,
          height: double.infinity,
          child: Image(
            image: AssetImage('assets/scroll.png'),
            fit: BoxFit.cover,
          ),
        );
        return container;
  }

  Widget _textos() {

    final estiloTexto = TextStyle(color: Colors.white, fontSize: 50.0);

    return SafeArea(
      child: Column(
        children: <Widget>[
          Text('40°', style: estiloTexto,),
          Text('Miércoles', style: estiloTexto,),
          Expanded(
            child: Container(),
          ),
          IconButton(
            color: Colors.white,
            iconSize: 70.0,
            icon: Icon(
              Icons.keyboard_arrow_down, 
            ),
            onPressed: (){
              pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.bounceOut);
            })
        ],
      ),
    );
  }
  
  Widget _pagina2() {
      return Container(
        height: double.infinity,
        width: double.infinity,
        color: Color.fromRGBO(108, 192, 218, 1.0),

        child: Center(
          child: RaisedButton(
            shape: StadiumBorder(),
            color: Colors.pink[600],
            textColor: Colors.white,
            elevation: 5.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
              child: Text('Bienvenidos', style: TextStyle(fontSize: 20.0),),
            ),
            onPressed: (){},
          ),
        ),
    );
  }

}