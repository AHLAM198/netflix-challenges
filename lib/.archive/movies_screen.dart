// import 'package:flutter/material.dart';

// class MovieListPage extends StatefulWidget {
//   const MovieListPage({Key? key}) : super(key: key);
//   @override
//   State<MovieListPage> createState() => _MovieListPageState();
// }

// class _MovieListPageState extends State<MovieListPage> {
//   final TextEditingController _controller = TextEditingController();
//   @override
//   void initState() {
//     super.initState();
//     Provider.of<MovieListViewModel>(
//       context,
//       listen: false,
//     ).fetchMovies("iron man");
//   }

//   @override
//   Widget build(BuildContext context) {
//     final vm = Provider.of<MovieListViewModel>(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Movies MVVM Example"),
//       ),
//     );
//   }
// }
