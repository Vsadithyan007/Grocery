import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery/components/g_item.dart';
import 'package:grocery/model/cart_model.dart';
import 'package:grocery/pages/c_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () =>Navigator.push(context, MaterialPageRoute(builder: (context){
          return CartPage();
        },)),
      backgroundColor: Colors.white,
      child: Icon(Icons.shopping_bag),),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 48,),
            const Padding(padding: EdgeInsets.symmetric(horizontal: 24.0),
            ),
            const SizedBox(height: 4,),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text("Let's order fresh items for you",
            style: GoogleFonts.notoSerif(
                fontSize: 36, 
                fontWeight: FontWeight.bold,
              ),
              ),
            ),
            const SizedBox(height: 24),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Divider(),
            ),

            const SizedBox(height: 24),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text("Fresh Items",
              style: TextStyle(fontSize: 16),),
            ),

            Expanded(
              child: Consumer<CartModel>(builder: (context, value, child) {
                return GridView.builder(
                  itemCount: value.shopItems.length,
                  padding: EdgeInsets.all(12),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1/1.3,
                    ), 
              itemBuilder: (context,index){
                return GroceryItemTile(
                  iName: value.shopItems[index][0],
                  iPrice: value.shopItems[index][1],
                  imgPath: value.shopItems[index][2],
                  clr: value.shopItems[index][3],
                  onPressed: (){
                    Provider.of<CartModel>(context,listen: false).
                    addItemtoCart(index);
                  },
                  
                );
            },
            );
              },),
            ),
          ],
        ),
      ),
    );
  }
}