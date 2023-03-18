import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListItemBuilder<T> extends StatelessWidget {
  final AsyncSnapshot<List<T>> snapshot;
  final Widget Function(BuildContext, T) itemBuilder;
  final Widget? noItemWidget;
  final Widget? errorWidget;
  final Widget? loadingWidget;
  final bool Function(T)? filter;
  const ListItemBuilder({
    super.key,
    required this.snapshot,
    required this.itemBuilder,
    this.noItemWidget,
    this.errorWidget,
    this.loadingWidget,
    this.filter,
  });

  @override
  Widget build(BuildContext context) {
    if (snapshot.connectionState == ConnectionState.active) {
      if (snapshot.hasData) {
        final items = snapshot.data!;
        if (filter != null) {
          items.retainWhere(filter!);
        }
        if (items.isNotEmpty) {
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return itemBuilder(context, items[index]);
            },
          );
        } else {
          //when zero items
          return Center(
            child: noItemWidget ??
                Container(
                  color: Colors.transparent,
                ),
          );
        }
      } else {
        //if snapshot has null data
        return Center(
          child: noItemWidget ??
              Container(
                child: Text(
                  "Server down :(",
                  style: GoogleFonts.chakraPetch(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
        );
      }
    } else if (snapshot.connectionState == ConnectionState.waiting) {
      //when waiting for the items in list
      return Center(
        child: loadingWidget ?? Container(color: Colors.transparent),
      );
    } else {
      //when none of the cases
      return errorWidget ?? Container(color: Colors.transparent);
    }
  }
}
