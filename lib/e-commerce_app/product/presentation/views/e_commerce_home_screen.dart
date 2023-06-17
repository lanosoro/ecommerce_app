import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../account/presentation/views/account_page.dart';
import '../../../cart/presentation/views/e_commerce_history_screen.dart';
import '../../../favorite/presentation/views/favorite_page.dart';
import '../../../util/e_commerce_colors.dart';
import '../blocs/product_bloc.dart';
import '../widgets/ec_homescreen_widget.dart';

class ECommerceHomeScreen extends StatefulWidget {
  const ECommerceHomeScreen({Key? key}) : super(key: key);

  @override
  State<ECommerceHomeScreen> createState() => _ECommerceHomeScreenState();
}

class _ECommerceHomeScreenState extends State<ECommerceHomeScreen> {
  @override
  void initState() {
    //gives access to the bloc
    context.read<ProductBloc>().add(FetchProductEvent());
    super.initState();
  }

  int _selectedIndex = 0;
  static final List<Widget> _screenOptions = <Widget>[
    const ECommerceHomeScreenWidget(),
    const FavoritePage(),
    const ECHistoryScreen(),
    const AdminAuth()
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final deviceH = MediaQuery.of(context).size.height;
    return Scaffold(
      body: _screenOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        alignment: Alignment.center,
        height: deviceH / 11,
        width: double.infinity,
        child: BottomNavigationBar(
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: const TextStyle(
              fontFamily: "Inter",
              fontWeight: FontWeight.w400,
              color: EcommerceColors.black,
              fontSize: 10),
          unselectedLabelStyle: const TextStyle(
              fontFamily: "Inter",
              fontWeight: FontWeight.w400,
              color: EcommerceColors.black,
              fontSize: 10),
          selectedItemColor: EcommerceColors.green,
          unselectedItemColor: EcommerceColors.grayText,
          items:[
            BottomNavigationBarItem( icon: Image.asset(
              'assets/icons/category.png',
              width: 30, // set the width of the icon
              height: 30,

            ), label: "Home"),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/account.png',
                width: 30, // set the width of the icon
                height: 30, // set the height of the icon
              ),
              label: 'account',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/messages.png',
                width: 30, // set the width of the icon
                height: 30,

              ),
              label: 'messages',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/video.png',
                width: 30, // set the width of the icon
                height: 30,

              ),
              label: 'Video',
            ),
          ],
        ),
      ),
    );
  }
}
