import 'dart:async';
import 'package:cma_admin/app/constant.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

class StompWS {
  String topic;
  Function(StompFrame) callback;
  StompWS(this.topic,this.callback);

  late StompClient stompClient = StompClient(
    config: StompConfig(
      url: Constant.baseUrlWs,
      onConnect: onConnect,
      beforeConnect: () async {
        print('waiting to connect...');
        await Future.delayed(Duration(milliseconds: 200));
        print('connecting...');
      },
      onWebSocketError: (dynamic error) => print("error : "+error.toString()),     
    ),
  );

  onConnect(StompFrame frame) {
    print("is Connected");
    stompClient.subscribe(
      destination: topic,
      callback: (frame) {
        callback.call(frame);
      },
    );
  }

  init(){
    stompClient.activate();
  }

  dispose(){
    stompClient.deactivate();
  }
}
