import 'package:carros/pages/login/login_page.dart';
import 'package:carros/pages/login/usuario.dart';
import 'package:carros/utils/nav.dart';
import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget {
  const DrawerList({Key? key}) : super(key: key);

  UserAccountsDrawerHeader _header(Usuario user) {

    return UserAccountsDrawerHeader(
      accountName: Text(user.nome),
      accountEmail: Text(user.email),
      currentAccountPicture: CircleAvatar(
        backgroundImage: NetworkImage(user.urlFoto),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Future<Usuario?> future = Usuario.get();

    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            FutureBuilder<Usuario?>(
              future: future,
              builder: (context, snapshot) {
                Usuario user = snapshot.data as Usuario;

                return user != null ? _header(user) : Container();
              },
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text('Favoritos'),
              subtitle: Text('Mais informções...'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                print('Item 1');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Ajuda'),
              subtitle: Text('Mais informções...'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                print('Item 2');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () => _onClickLogout(context),
            ),
          ],
        ),
      ),
    );
  }

  _onClickLogout(BuildContext context) {
    Usuario.clear();
    Navigator.pop(context);
    push(context, LoginPage(), replace: true);
  }
}