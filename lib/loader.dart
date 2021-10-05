import 'package:flutter/material.dart';

class MyLoader extends StatefulWidget {
  final Widget child;
  final bool isLoading;
  const MyLoader({ Key? key, required this.child, required this.isLoading }) : super(key: key);

  @override
  _MyLoaderState createState() => _MyLoaderState();
}

class _MyLoaderState extends State<MyLoader> {

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: widget.isLoading,
      child: Stack(
        children: [
          widget.child,
          if (widget.isLoading) _buildLoader(),
        ],
      ),
    );
  }

  Widget _buildLoader() {
    return Container(
      color: Colors.black.withAlpha(100),
      height: double.infinity,
      width: double.infinity,
      child: Center(child: Container(
        height: 150,
        width: 300,
        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(12)), color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.sensors_rounded, color: Colors.green, size: 60,),
            Text('Put the phone close to the reader', textAlign: TextAlign.center,),
          ],
        ),
      )),
    );
  }
}