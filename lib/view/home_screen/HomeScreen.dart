import 'package:apiintegrationusaapi/controller/home_screen_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget
{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
{
  @override
  void initState()
  {
    WidgetsBinding.instance.addPostFrameCallback((timestamp) async
    {
     // await Provider.of<HomeScreenController>(context, listen: false).fetchData();
      //Another method of provider calliing
      //functionsne aane vilikane vechal
      await context.read<HomeScreenController>().fetchData(); // listen falsene pakaram aane read ennulla function wrk aavane.
      // listen true aanenkil (variable) aanenkil context.watch()

    });
  }
  @override
  Widget build(BuildContext context)
  {
    final homeProvider = context.watch<HomeScreenController>();

    return Scaffold(
      body: ListView.separated(
          itemBuilder: (context, index) => ListTile(
            title: Text(homeProvider.dataResponseModel!.usDataList![index].year.toString()),
            subtitle: Text(homeProvider.dataResponseModel!.usDataList![index].population.toString()),
          ), 
          separatorBuilder: (context, index) => SizedBox(height: 20,),
          itemCount: homeProvider.dataResponseModel!.usDataList!.length ?? 0),
    );
  }
}
