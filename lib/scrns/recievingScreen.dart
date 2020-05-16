import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:parcelir/reuse/mediaData.dart';
import 'package:parcelir/serveGlobal/serveglobal.dart';

class RecievingScreen extends StatefulWidget {
  @override
  _RecievingScreenState createState() => _RecievingScreenState();
}

class _RecievingScreenState extends State<RecievingScreen> {
TextEditingController nameController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime =TimeOfDay.now();

  //File imageFile;
  bool imageFile;
  bool payOndeliver = false;
  bool itemIsdeliver = false;

  String fdate(){
      String formatedDate = DateFormat("EEE MMM d, yyyy").format(selectedDate);
    return formatedDate;
  }

  String ftime(){
//    "h:mm a"
    String formatedTime =" ${selectedTime.format(context)}";
     return formatedTime;
  }
    Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }


Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked_s = await showTimePicker(
        context: context,
        initialTime: selectedTime, builder: (BuildContext context, Widget child) {
           return MediaQuery(
             data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: child,
          );});

    if (picked_s != null && picked_s != selectedTime )
      setState(() {
        selectedTime = picked_s;
      });
  }
  



  Widget inputItem(BuildContext context,
  {String hintword,String label,TextEditingController controllerOf,
  Color topTolor,TextInputType keyboard}){
    return Padding(
            padding: 
            EdgeInsets.symmetric(horizontal: MediaQueryDataR(context).mdw(.05),vertical: 5),
             child:Column(
              children: <Widget>[
               ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                 child: Container(
                  width: MediaQuery.of(context).size.width*.9,
                  //height: MediaQuery.of(context).size.height*.3,                  
                  color: topTolor ==null?Colors.red:topTolor,
                  child: ListTile(
                    title: Text("  ${label==null?"Data Filed":label}",
                    style: TextStyle(color: Colors.white),),

                    trailing: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: 50,
                        height: 30,
                        color: Colors.black.withOpacity(.5),
                        child: Icon(Icons.done,color: Colors.green,),
                      ),
                    ),
                  ),
                ),
              ),                      
                      ClipRRect(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
                child: Container(
                      width: MediaQuery.of(context).size.width*.9,
                      //height: MediaQuery.of(context).size.height*.3,                  
                      color: Colors.green,
                      child: ListTile(

                        title: TextField(
                             controller: controllerOf,
                              maxLines: null,
                              keyboardType:keyboard==null?TextInputType.multiline:keyboard,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "  ${hintword==null?"Enter data":hintword}",
                                hintStyle: TextStyle(color: Colors.white)
                              ),
                            ),
                      ),
                ),
              ),
                    ],
                  ),
                );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Recieving Items"),
        actions: <Widget>[
          Icon(Icons.business_center),
          SizedBox(width: 10,)],
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[

        SizedBox(height: 20,),
          Padding(
            padding: 
            EdgeInsets.symmetric(horizontal: MediaQueryDataR(context).mdw(.05),),
             child:Column(
              children: <Widget>[
               ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                 child: Container(
                  width: MediaQuery.of(context).size.width*.9,
                  //height: MediaQuery.of(context).size.height*.3,                  
                  color:Colors.red,
                  child: ListTile(
                    title: Text("  Reciepient Id",
                    style: TextStyle(color: Colors.white),),

                    trailing: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: 50,
                        height: 30,
                        color: Colors.black.withOpacity(.5),
                        child: Icon(Icons.done,color: Colors.green,),
                      ),
                    ),
                  ),
                ),
              ),                      

                    ],
                  ),
                ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQueryDataR(context).mdw(.05),),
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: MediaQueryDataR(context).mdh(.3),
                      color:imageFile ==null? Colors.green.withOpacity(.4):null,
                      decoration: imageFile ==null?null:
                      BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(ServeGlobal.imgUrl)
                        )
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        SizedBox(height: MediaQueryDataR(context).mdh(.1),),
                        Center(
                          child: GestureDetector(
                            onTap: (){
                              print("picture tapped");
                              setState(() {
                                imageFile = true;
                              });
                            },
                            child: CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.red.withOpacity(.3),
                              child: 
                              //IconButton(
                                //icon: 
                                Icon(Icons.add_a_photo,color: Colors.white,
                                size: 50,
                                ),
                              //   onPressed: (){},
                              // ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                ),
                                  ),                 
                     inputItem(context, label:"Recepient name", 
                     controllerOf:nameController,keyboard: TextInputType.text),
                     inputItem(context, label:"Recepient Number",
                     controllerOf:nameController,keyboard: TextInputType.number),
                                     
                // inputItem(context, label:"Sender Name", controllerOf:nameController,keyboard: TextInputType.text),
                //  inputItem(context, label:"Mobile Number", controllerOf:nameController,keyboard: TextInputType.number),
                 inputItem(context, label:"Pick Up Destination", controllerOf:nameController,keyboard: TextInputType.text),
                 SizedBox(height: 10,),
            ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                      width: MediaQuery.of(context).size.width*.9,
                      //height: MediaQuery.of(context).size.height*.3,                  
                      color: Colors.red.withOpacity(.6),
                      child: Column(
                        children: <Widget>[
                      SizedBox(height: 30,),
                      Table(children: [
                      TableRow(children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: RaisedButton(onPressed: null,child: 
                        Text(fdate(),style: TextStyle(color: Colors.white),),),
                      ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: RaisedButton(onPressed: null,child: Text(
                              //selectedTime.toString(),
                              ftime(),
                              style: TextStyle(color: Colors.white),),),
                          ),
                      ]),
                    ]),



  Table(children: [
  TableRow(children: [
    Padding(
      padding: EdgeInsets.all(8.0),
      child: RaisedButton(onPressed: (){_selectDate(context);},child: Text("Date",style: TextStyle(color: Colors.red),),),
    ),
       Padding(
         padding: EdgeInsets.all(8.0),
         child: RaisedButton(onPressed: (){_selectTime(context);},child: Text("Time",style: TextStyle(color: Colors.red),),),
       ),
  ]),

]),

SizedBox(height: 30,),

            ],
          ),
    ),
  ),

SizedBox(height: 10,),


  inputItem(context, label:"Item(s) name and Quantity", controllerOf:nameController,),
  inputItem(context, label:"Estimated Value of Items", controllerOf:nameController,
  keyboard: TextInputType.number),
               
                     
/// todo implememnt  the hidden form field for payments made when not paid on delivery

SizedBox(height: 10,), 
payOndeliver == true?Table(children: [
  TableRow(children: [
    Checkbox(value: payOndeliver,checkColor: Colors.red,activeColor: Colors.white, onChanged: (retVal){
      setState(() {
        payOndeliver = retVal;
      });
    }),
    Text("\nPay On Delivery",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
  ]),

]):Container(),
                    
payOndeliver == true?inputItem(context, label:"Enter Amount", 
controllerOf:nameController,keyboard: TextInputType.number):Container(),
Padding(
  padding: EdgeInsets.symmetric(horizontal:MediaQueryDataR(context).mdw(.1)),
  child:   Table(
    children: [  
    TableRow(children: [  
      Text("\nItem Delivered",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),  
          Checkbox(value: itemIsdeliver,checkColor: Colors.red,
          activeColor: Colors.white, onChanged: (retVal){
        setState(() {  
          itemIsdeliver = retVal;  
        });  
      }),  
    ]),
  ]),
),
    MediaQueryDataR(context).rbutn(
        action: (){},
        txt: "Check "                        
        ),

        SizedBox(height: 30),
              ],
            )
          ],
        ),
      ),
    );
  }
}