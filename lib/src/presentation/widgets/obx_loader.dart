import 'package:flutter/cupertino.dart';

class ObxLoader extends StatelessWidget {
  const ObxLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.6,
        child: const Center(
          child: CupertinoActivityIndicator(),
        ),
      ),
    );
  }
}
