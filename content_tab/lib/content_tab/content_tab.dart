import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContentTab extends StatelessWidget {
  List<Widget> contents = [];
  List<String> titles = [];
  ContentTab({
    Key? key,
  }) : super(key: key);

  void addTab(String title,Widget content){
      titles.add(title);
      contents.add(content);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RefreshContentBloc(),
      child: Column(
        children: [
          ContentTabHeader(contents : contents,titles: titles),
          BlocBuilder<RefreshContentBloc, Widget>(builder: (context, state) {
            return state;
          })
        ],
      ),
    );
  }
}

class ContentTabHeader extends StatelessWidget {
  List<Widget> contents;
  List<String> titles;
  ContentTabHeader({Key? key,required this.contents,required this.titles}) : super(key: key);

  List<Widget> buildTab(BuildContext context, String order){
    List<Widget> retval = [];
    for(int i = 0; i < contents.length;i++){
      retval.add(      
          ElevatedButton(
            style: ButtonStyle(backgroundColor:
                MaterialStateProperty.resolveWith<Color?>((states) {
              if (order == titles[i]) {
                return Colors.white;
              } else {
                if (states.contains(MaterialState.hovered)) {
                  return Colors.grey[300];
                } else {
                  return Colors.grey[600];
                }
              }
            })),
            onPressed: () {
              BlocProvider.of<RefreshContentBloc>(context).add(contents[i]);
              BlocProvider.of<RefreshHeaderBloc>(context).add(titles[i]);
            },
            child: Text(
              titles[i],
              style: TextStyle(color: Colors.black),
            ),),);
    }
    return retval;
  }

  Row tableHeader(context, String order) {
    return Row(
      children: buildTab(context,order)
    );
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RefreshHeaderBloc(),
      child: BlocBuilder<RefreshHeaderBloc, String>(builder: (context, state) {
        return 
           tableHeader(context, state);
        
      }),
    );
  }
}

class RefreshHeaderBloc extends Bloc<String, String> {
  RefreshHeaderBloc({Key? key}) : super("init") {
    on<String>((_, emit) async {
      emit(_);
    });
  }
}

class RefreshContentBloc extends Bloc<Widget, Widget> {
  RefreshContentBloc({Key? key}) : super(Container()) {
    on<Widget>((_, emit) async {
      emit(_);
    });
  }
}
