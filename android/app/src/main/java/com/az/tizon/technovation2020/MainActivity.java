package com.az.tizon.technovation2020;

import android.os.Bundle;
import android.content.Intent;
import android.net.Uri;
import android.Manifest;
import android.content.pm.PackageManager;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;

import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugins.GeneratedPluginRegistrant;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;



public class MainActivity extends FlutterActivity {
  private static final String CHANNEL = "com.az.tizon.technovation2020";
  private static final int GET_PHONE_PERMISSION_REQUEST_ID = 2246;
  private String number;

  @Override
  public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
    GeneratedPluginRegistrant.registerWith(flutterEngine);

    new MethodChannel(flutterEngine.getDartExecutor(), CHANNEL).setMethodCallHandler(new MethodChannel.MethodCallHandler(){
      @Override
      public void onMethodCall(MethodCall methodCall, Result result){
        if(methodCall.method.equals("callIntent")){
          number = methodCall.argument("number");
          if(ContextCompat.checkSelfPermission(MainActivity.this,
            Manifest.permission.CALL_PHONE) != PackageManager.PERMISSION_GRANTED){
              ActivityCompat.requestPermissions(MainActivity.this, new String[]{Manifest.permission.CALL_PHONE}, GET_PHONE_PERMISSION_REQUEST_ID);
          }else {
            Uri uri = Uri.parse("tel:"+number);
            Intent intent = new Intent(Intent.ACTION_CALL, uri);
            if (intent.resolveActivity(getPackageManager()) != null) {
              startActivity(Intent.createChooser(intent, "Call using..."));
            }
          }
        } else if(methodCall.method.equals("webIntent")){
          String url = methodCall.argument("url");
          Uri uri = Uri.parse("https://"+url);
          Intent intent = new Intent(Intent.ACTION_VIEW, uri);
          if (intent.resolveActivity(getPackageManager()) != null) {
            startActivity(Intent.createChooser(intent, "Open using..."));
          }
        }
      }
    });
  }
  @Override
  public void onRequestPermissionsResult(int requestCode, String[] permissions, int[] grantResults) {
    if(requestCode == GET_PHONE_PERMISSION_REQUEST_ID){
      if(grantResults.length > 0 && grantResults[0] == PackageManager.PERMISSION_GRANTED){
        Uri uri = Uri.parse("tel:"+number);
        Intent intent = new Intent(Intent.ACTION_CALL, uri);
        if (intent.resolveActivity(getPackageManager()) != null) {
          startActivity(Intent.createChooser(intent, "Call using..."));
        }
      }
    }
  }
}
