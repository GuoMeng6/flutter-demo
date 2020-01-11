package com.example.flutter_demo4;

import android.util.Log;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;


public class FlutterPluginTestNewPlugin implements MethodChannel.MethodCallHandler, FlutterPlugin {
    private static MethodChannel channel;

    @Override
    public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
        Log.d("============", "onMethodCall: "+methodCall.method);
    }

    @Override
    public void onAttachedToEngine(FlutterPluginBinding flutterPluginBinding) {
        Log.d("=============", "onAttachedToEngine: ");
        channel = new MethodChannel(flutterPluginBinding.getFlutterEngine().getDartExecutor(), "samples.flutter.io/battery");
        channel.setMethodCallHandler(new FlutterPluginTestNewPlugin());
    }

    @Override
    public void onDetachedFromEngine(FlutterPluginBinding flutterPluginBinding) {

    }
}

