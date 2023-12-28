

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppExceptions implements Exception {

  final _message ;
  final _prefix ;

  AppExceptions([this._message , this._prefix]) ;

  String toString(){
    return '$_prefix$_message';
  }

}


class InternetException extends AppExceptions {
  InternetException([String? message]) : super(message, 'No internet') ;
}


class RequestTimeOut extends AppExceptions {

  RequestTimeOut([String? message]) : super(message, 'Request Time out') ;

}

class ServerException extends AppExceptions {

  ServerException([String? message]) : super(message, 'Internal server error') ;

}

class InvalidUrlException extends AppExceptions {

  InvalidUrlException([String? message]) : super(message, 'Invalid Url') ;

}

class FetchDataException extends AppExceptions {

  FetchDataException([String? message]) : super(message, '') ;

}






class GeneralExceptionWidget extends StatefulWidget {
  final VoidCallback onPress ;
  const GeneralExceptionWidget({Key? key , required this.onPress}) : super(key: key);

  @override
  State<GeneralExceptionWidget> createState() => _GeneralExceptionWidgetState();
}

class _GeneralExceptionWidgetState extends State<GeneralExceptionWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height ;
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: height * .3 ,),
          // Icon(Icons.cloud_off , color: AppColor.redColor,size: 50,),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Center(child: Text('Something Went Wrong',style: TextStyle(color: Colors.black),)),
          ),
          SizedBox(height: height * .15 ,),
          InkWell(
            onTap: widget.onPress,
            child: Container(
              height: 44,
              width: 160,
              decoration: BoxDecoration(
                  color:Colors.white,
                  borderRadius: BorderRadius.circular(50)
              ),
              child: Center(child: Text('Retry' , style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),)),
            ),
          )
        ],
      ),
    );
  }
}
