import 'package:equaze/bloc/bloc.dart';
import 'package:equaze/models/request_models/get_grievance_list_request_model.dart';
import 'package:equaze/models/response_models/grievance_list_response_model.dart';
import 'package:equaze/ui/query_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:date_range_picker/date_range_picker.dart' as DRP;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ViewQueriesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ViewQueriesState();
  }
}

class ViewQueriesState extends State<ViewQueriesPage> {
  GetGrievanceListBloc _bloc = GetGrievanceListBloc();


  @override
  void initState() {
    _bloc.dispatch(GetGrievanceResponseEvent(GetGrievanceListRequestModel.custom("","","","ashutoshinstitute","","",DateFormat("yyyy-MM-dd").format(DateTime.now().subtract(Duration(days: 7))),DateFormat("yyyy-MM-dd").format(DateTime.now()),"Administrator")));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        builder: (context) => _bloc,
        child: Scaffold(
            appBar: AppBar(
              title: Text("View All grievances"),
              actions: <Widget>[
                GestureDetector(
                    onTap: () async {
                      final List<DateTime> picked = await DRP.showDatePicker(
                          context: context,
                          initialFirstDate:
                          (DateTime.now()).subtract(new Duration(days: 7)),
                          initialLastDate: DateTime.now(),
                          firstDate: DateTime(1998),
                          lastDate: DateTime.now());
                      if (picked != null && picked.length == 2) {
                        _bloc.dispatch(GetGrievanceResponseEvent(GetGrievanceListRequestModel.custom("","","","ashutoshinstitute","","",DateFormat("yyyy-MM-dd").format(picked.first),DateFormat("yyyy-MM-dd").format(picked.last),"Administrator")));
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right:10.0),
                      child: Icon(Icons.filter_list),
                    ))
              ],
            ),
            body: BlocBuilder(
              bloc: _bloc,
              builder: (BuildContext context, GetGrievanceListState getGrievanceListState) {
                if (getGrievanceListState is GrievanceLoadingState) {
                  return Center(child: CircularProgressIndicator());
                }
                else if (getGrievanceListState is GrievanceLoadingSuccessState) {
                  GrievanceLoadingSuccessState grievanceLoadingSuccessState = getGrievanceListState;
                  final responseModel = grievanceLoadingSuccessState.grievanceListResponseModel;
                  if (responseModel.length == 0) {
                    return Center(child: Text("No queries available"));
                  }
                  else {
                    return _buildListView(responseModel);
                  }
                }
                else {
                  return Center(child: Text("Server Error. Please contact admin."));
                }
              },
            )));
  }

  _buildListView(List<GrievanceListResponseModel> items) {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return QueryCard(items[index]);
        });
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }


}
