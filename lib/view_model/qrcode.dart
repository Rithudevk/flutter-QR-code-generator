import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
class Qrcode extends StatefulWidget {
const  Qrcode({super.key, required this.qrdata,required this.namecontroller,required this.upicontroller});
  final String qrdata;
 final TextEditingController namecontroller;
  final TextEditingController upicontroller;
  @override
  State<Qrcode> createState() => _QrcodeState();
}

class _QrcodeState extends State<Qrcode> {

  

  @override
  Widget build(BuildContext context) {
    var merchentName =widget.namecontroller==widget.qrdata;
    var upiId=widget.upicontroller==widget.qrdata;
    return   Container(
               height: 400,
               width: 300,
                child: Column(
                children: [
                  merchentName==true
                  ?const Text( 'MERCHENTNAME',
                  style: TextStyle(
                   fontSize: 20,
                   fontWeight: FontWeight.bold
                     ),
                     )
                     : Text(widget.namecontroller.text,
                     style:const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                     ),
                     ),

                      
                      QrImageView(
                        data:widget.qrdata,
                        size: 200,
                        backgroundColor: Colors.white,
                         semanticsLabel:widget.qrdata,
                         version: QrVersions.auto,
                                     
                      
                      ),

                      upiId==true
                     ?const Text( 'upiid',
                    
                     )
                     :Opacity(
                      opacity: 0.5,
                       child: Text(widget.upicontroller.text,
                       style:const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                       ),
                       ),
                     ),
                   
                    
                      
                     const  Text('Scan and pay with any BHIM UPI app',
                         style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500
                  ),
                       ),

                 
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                         Container(
                          height: 50,
                          width: 80,
                          decoration:const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('Assets/bhim.png'),
                              
                              )
          
                          ),
                         ),
                          Container(
                          height: 50,
                          width: 80,
                          decoration:const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('Assets/upi.png'),
                              
                              )
          
                          ),
                         )
                        ],
                       ),
                          Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                         Container(
                          height: 50,
                          width: 50,
                          decoration:const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('Assets/gpay.png'),
                              
                              )
          
                          ),
                         ),
                          Container(
                          height: 50,
                          width: 80,
                          decoration:const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('Assets/paytm.png'),
                              
                              )
          
                          ),
                         ),
                           Container(
                          height: 50,
                          width: 80,
                          decoration:const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('Assets/phonepay.png'),
                              
                              )
          
                          ),
                         )
                        ],
                       )
                    ],
                  ),
                );
  }
}