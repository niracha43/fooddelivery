import 'package:flutter/material.dart';
import 'package:fooddelivery/core/consts.dart';
import 'package:fooddelivery/core/flutter_icons.dart';
import 'package:fooddelivery/models/food_model.dart';

class DetailPage extends StatefulWidget {
  final FoodModel data;
  DetailPage(this.data);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greenColor,
      body: Column(
        children: <Widget>[
          SizedBox(height: 25,),
          _customAppBar(),
          Container(
            height: 325, // ขนาด กรอบขาว
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: <Widget>[
                Image(
                  image: AssetImage(
                      "assets/images/bg.png",
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Image(
                    image: AssetImage(
                      "assets/images/${widget.data.imgPath}",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              padding: EdgeInsets.all(28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("${widget.data.name}",  // Title Menu
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16,),
                  Row(
                    children: <Widget>[
                      Text("\$${widget.data.price.toInt()}", // price food
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: AppColors.redColor,
                        ),
                      ),
                      SizedBox(width: 16),
                      _buildCounter(),
                    ],
                  ),
                  SizedBox(height: 16,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, // ความห่างของ weight calorise protein
                    children: <Widget>[
                      _buildInfo("Weight", "${widget.data.weight.toInt()}gm"),
                      _buildInfo("Calorise", "${widget.data.calory.toInt()}ccal"),
                      _buildInfo("Protein", "${widget.data.protein.toInt()}gm"),
                    ],
                  ),
                  SizedBox(height: 16,),
                  Text(
                    "Item",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8,),
                  Text("${widget.data.item}"),
                  Expanded(child: SizedBox(),),
                  Row(
                    children: [
                      Expanded(
                        child: RaisedButton(  //ปุ่ม กด Add to cart
                          onPressed: () {},
                          padding: EdgeInsets.symmetric(vertical: 16), //ขนาดปุ่ม
                          color: AppColors.greenColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(18),
                              ),
                          ),
                          child: Text(
                            "Add to Cart",
                            style: TextStyle(
                              fontSize: 28,
                          ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfo(String title, String val) {
    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(  // หัวข้อ weight calories protein
                          title,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(  // ปริมาณ , จำนวน
                          "$val",
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.redColor,
                          ),
                        ),
                      ],
                    );
  }

 Widget _customAppBar() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                    Radius.circular(12),
                ),
              ),
              child: Icon(
                FlutterIcons.left,
                size: 16,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            child: Icon(
              FlutterIcons.shop,
              size: 16,
            ),
          ),
        ],
      ),
    );
 }

 Widget _buildCounter() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.greenColor,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.remove,
              color: Colors.black,
            ),
            onPressed: null,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "1",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.black,
            ),
            onPressed: null,
          ),
        ],
      ),
    );
 }
}
