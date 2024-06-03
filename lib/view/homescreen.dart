import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_code_genarator/provider/qr_provider.dart';


import 'package:qr_code_genarator/view_model/qrcode.dart';


class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
 ConsumerState <Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {

 
 
      
  @override
  Widget build(BuildContext context) {
         
  var _namecontroller=TextEditingController();
  var _upicontroller=TextEditingController();
   
   
    return Scaffold(
        body: SingleChildScrollView(
          child: Consumer(
            builder: (context, ref, child) {
            final data= ref.watch(qrProvider);

            return   Container(
                padding:const EdgeInsets.symmetric(vertical: 50),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('UPI QR CODE ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      fontFamily: GoogleFonts.epilogue().fontFamily,
                    ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                   const Opacity(
                      opacity: 0.6,
                      child: Text('Create dynamic UPI QR Codes  with custom amount',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500
                      ),
                      ),
                    ),
                  const  Opacity(
                      opacity: 0.6,
                      child: Text('Customer can scan and pay with',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500
                      ),
                      ),
                    ),
                 const  Opacity(opacity: 0.6,
                   child:  Text('WhatsApp, Google Pay, Paytm, PhonePe ',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500
                    ),),
                   ),
                      const  Opacity(opacity: 0.6,
                   child:  Text(' or any BHIM UPI app',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500
                    ),),
                   ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                   Qrcode(qrdata: data,
                   namecontroller: _namecontroller,
                   upicontroller: _upicontroller,),
                    Padding(
                   padding: const EdgeInsets.only(left: 20,right: 20),
                   child: Column(
            
                    children: [
                      TextField(
                         controller: _namecontroller,
                        decoration:const InputDecoration(
                          hintText: 'Merchant / Payee Name',
                          border: OutlineInputBorder(
                            
                          )
                        ),
                        onChanged: (value) {
                          ref.read(qrProvider.notifier).state =value;
                        },
            
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                       TextField(
                        controller: _upicontroller,
                        onChanged: (value) {
                            ref.read(qrProvider.notifier).state =value; 
                        },
                        decoration:const InputDecoration(
                          hintText: 'UPI ID',
                          border: OutlineInputBorder(
                            
                          )
                        ),
                        
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                       TextField(
                      
                        onChanged: (value) {
                            ref.read(qrProvider.notifier).state =value;
                        },
                        decoration:const InputDecoration(
                          hintText: 'Amount',
                          border: OutlineInputBorder(
                            
                          )
                        ),
                        
                      )
                    ],
                   ),
                 )
                  ],
                ),
              ),
            );
            },
            
          ),
        ),
      );
    
  }
}