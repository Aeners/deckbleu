import 'package:flutter/material.dart';

class Choice {
  const Choice(
      {@required this.title,
      @required this.itemType,
      this.icon,
      this.enabled = true,
      this.goTo});

  final String itemType;
  final String title;
  final IconData icon;
  final bool enabled;
  final String goTo;
}

const List<Choice> defaultElements = const <Choice>[
  Choice(itemType: "Header", title: "Options de outs"),
  Choice(
    itemType: "Item",
    title: "Menu principal",
    icon: Icons.panorama_wide_angle,
    goTo: "/",
  ),
  Choice(
      itemType: "Item",
      title: "Créer un joueur",
      icon: Icons.add,
      goTo: "/users/create"),
  Choice(
      itemType: "Item",
      title: "Paramètres",
      icon: Icons.settings,
      goTo: "/settings")
];

class BurgerMenu extends StatelessWidget {
  final List<Choice> _optionalMenuChoices;

  BurgerMenu({List<Choice> choices})
      : this._optionalMenuChoices =
            defaultElements + (choices is List ? choices : []);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: _optionalMenuChoices.length,
        itemBuilder: (BuildContext ctx, int index) {
          return _constructItem(_optionalMenuChoices[index], context);
        },
      ),
    );
  }

  Widget _constructHeader(Choice choice) {
    return Container(
        height: 100,
        child: DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text(
            choice.title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ));
  }

  Widget _constructItem(Choice choice, BuildContext context) {
    switch (choice.itemType) {
      case "Header":
        return _constructHeader(choice);
      case "Item":
        return ListTile(
            leading: Icon(choice.icon),
            title: Text(choice.title),
            onTap: () => Navigator.pushNamedAndRemoveUntil(
                context, choice.goTo, ModalRoute.withName('/')),
            enabled: choice.enabled);
      case "Divider":
        return Divider(thickness: 2.0);
      default:
        throw 'Not a valid choice type';
    }
  }
}
