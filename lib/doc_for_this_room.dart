/*
in pubspec.yaml use these:
[
  stream_video_flutter: 
  uuid: ^4.3.3
  permission_handler: ^11.3.1  
  camera: ^0.10.0+1
]
---------***********************
then : add this permessinons in AndroidManifest.xml
[
    <uses-permission android:name="android.permission.CAMERA" />
    <uses-permission android:name="android.permission.RECORD_AUDIO" />
    <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS" />
    <uses-permission android:name="android.permission.INTERNET" />
    
    <!-- Required for Android 12+ -->
    <uses-permission android:name="android.permission.BLUETOOTH_CONNECT" />
]
-----------***********************
1-create acount on getstream.io and get your key.
2-[No login screen required ] to make this go to app you created and (disable Auth checks).
3- Add your (API key) in your code In =>StreameVedio.
4- generate =>Rundom (userId) For each user enter the room.
5- use this (userId) to generate a (userToken) for each user.
6- make function to ask permeision   // طلب صلاحيات الكاميرا والميكروفون
 */