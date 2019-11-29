import 'dart:async';

import 'package:equaze/bloc/bloc.dart';
import 'package:equaze/models/request_models/resolve_query_request_model.dart';
import 'package:equaze/models/response_models/grievance_list_response_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:steps/steps.dart';
import 'login_page.dart';

class QueryDetailPage extends StatefulWidget {
  final GrievanceListResponseModel responseModel;

  const QueryDetailPage({Key key, @required this.responseModel})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return QueryDetailState(responseModel);
  }
}

class QueryDetailState extends State<QueryDetailPage> {
  final GrievanceListResponseModel responseModel;
  final TextEditingController _remarkController = TextEditingController();
  ResolveQueryBloc _resolveQueryBloc = ResolveQueryBloc();

  QueryDetailState(this.responseModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check),
        onPressed: () => _resolveQuery(),
      ),
      appBar: AppBar(title: Text("Query Detail Page")),
      body: Container(
        decoration: BoxDecoration(),
        child: NestedScrollView(
          body: _buildQueryFlow(
              responseModel.statusName, responseModel.lastModifiedAt),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverList(
                delegate: SliverChildListDelegate(
                  <Widget>[
                    _buildSingleDetailItem(responseModel),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      height: 2,
                      width: double.maxFinite,
                      decoration: BoxDecoration(color: Colors.grey[100]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 8.0, bottom: 8),
                      child: Text(
                        "Query Status",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 26),
                      ),
                    )
                  ],
                ),
              )
            ];
          },
        ),
      ),
    );
  }

  _buildSingleDetailItem(GrievanceListResponseModel grievanceModel) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Material(
        elevation: 3,
        child: Container(
          padding: EdgeInsets.all(20),
          color: Colors.white,
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Flexible(
                  flex: 9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            DateFormat('MMM dd,yyyy').format(DateFormat("EEE MMM dd HH:mm:ss 'IST' yyyy").parse(responseModel.createdAt)),
                            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      //Date
                      Text("Query #${grievanceModel.caseReferenceId}",style: TextStyle(color: Color(0xFFB53C12), fontSize: 24, fontWeight: FontWeight.bold),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                            Text("Name: ${grievanceModel.nameOfRequester}",style: TextStyle(color: Colors.lightBlue, fontSize: 20),),
                            SizedBox(height: 5,),
                            Text("Raised By: ${grievanceModel.raiseRequestAs}",style: TextStyle(color: Colors.lightBlue, fontSize: 20),),
                        ],
                      ),
                      SizedBox(height: 5,),
                      Text("Category: ${grievanceModel.category}",style: TextStyle(color: Colors.black, fontSize: 16),),
                      SizedBox(height: 5,),
                      Text("Sub Category: ${grievanceModel.subCategory}",style: TextStyle(color: Colors.black, fontSize: 16),),
                      SizedBox(height: 5,),
                      Text("Sub Sub Category: ${grievanceModel.subSubCategory}",style: TextStyle(color: Colors.black, fontSize: 16),),
                      SizedBox(height: 5,),
                      Text("Directed to: ${grievanceModel.queryDirectedAgainst}(${grievanceModel.queryDirectedAgainstDesignation})",style: TextStyle(color: Colors.black, fontSize: 16),),
                      SizedBox(height: 5,),
                      Text("Directed against: ${grievanceModel.queryDirectedAgainst}(${grievanceModel.queryDirectedAgainstDesignation})",style: TextStyle(color: Colors.black, fontSize: 16),),
                      SizedBox(height: 5,),
                      Text("Contact Number: ${grievanceModel.contactNumber}",style: TextStyle(color: Colors.black, fontSize: 16),),
                      SizedBox(
                        height: 20,
                      ),
                      Text(grievanceModel.remarks,style: TextStyle(color: Colors.grey),)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildQueryFlow(String status, String date) {
    print("status"+status);
    List<String> statusList = [
      "New",
      "Open",
      "Waiting For Response",
      "In Progress",
      "Assigned",
      "Resolved",
      "Closed"
    ];
    return Theme(
      data: ThemeData(
        primaryColor: Colors.green[600]
      ),
      child: Stepper(
          currentStep: statusList.indexOf(status),
          steps: statusList.map((statusValue) {
            int currentIndex = statusList.indexOf(status);
            int iteratedIndex = statusList.indexOf(statusValue);
            return Step(
                content: _buildStep(statusValue, date),
                title: Text("Query's status is $statusValue"),
                subtitle: Text(
                    "Date: ${DateFormat('MMM dd,yyyy').format(DateFormat("EEE MMM dd HH:mm:ss 'IST' yyyy").parse(date))}"),
                isActive: true,
                state: currentIndex == iteratedIndex
                    ? StepState.indexed
                    : currentIndex > iteratedIndex
                        ? StepState.complete
                        : StepState.disabled);
          }).toList()),
    );
  }

  _buildStep(String status, String date) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Material(
        elevation: 3,
        child: Container(
          padding: EdgeInsets.all(16),
          color: Colors.white,
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  height: 20,
                  width: 5,
                  color: Colors.deepOrange,
                ),
                SizedBox(
                  width: 20,
                ),
                Flexible(
                  flex: 9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Query's Current Status is $status",
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Date: ${DateFormat('MMM dd,yyyy').format(DateFormat("EEE MMM dd HH:mm:ss 'IST' yyyy").parse(date))}",
                        style: TextStyle(color: Colors.deepOrange),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _resolveQuery() {
   _resolveQueryBloc = ResolveQueryBloc();
    showDialog(
        context: context,
        builder: (context) {
          return BlocProvider(
            builder: (context) => _resolveQueryBloc,
            child: AlertDialog(
              title: Text("Enter Remarks"),
              content: BlocBuilder(
                bloc: _resolveQueryBloc,
                builder: (BuildContext context, ResolveQueryState state) {
                  if (state is InitialResolveQueryState) {
                    return TextFormField(
                      controller: _remarkController,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(hintText: "Enter Remarks"),
                    );
                  } else if (state is ResolvingQueryState) {
                    return Container(height:50,width:50,child: Center(child: CircularProgressIndicator()));
                  } else if (state is QueryResolvedSuccessState) {
                    return Text("Query Resolved Successfully");
                  } else {
                    return Text("Query Can not be resolved.");
                  }
                },
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text(
                    "Reply",
                    style: TextStyle(color: Colors.deepOrange),
                  ),
                  onPressed: () => _addComment(),
                ),
                FlatButton(
                  child: Text(
                    "Mark as Resolved",
                    style: TextStyle(color: Colors.deepOrange),
                  ),
                  onPressed: () => _markAsResolved(),
                ),
              ],
            ),
          );
        });
  }

  _markAsResolved() {
    final value = _remarkController.text;
    ResolveQueryRequestModel resolveQueryRequestModel;
    getSharedPreferences("username").then((username) => {
          getSharedPreferences("instituteId").then((instituteId) => {
                resolveQueryRequestModel = ResolveQueryRequestModel.create(
                    "7",
                    username,
                    value,
                    username,
                    "",
                    responseModel.caseReferenceId,
                    "",
                    instituteId),
    print(resolveQueryRequestModel),
    _resolveQueryBloc.dispatch(ResolveQuery(resolveQueryRequestModel)),
              })
        });
  }

  _addComment() {
    final value = _remarkController.text;
    if (value != null && value != "") {
      ResolveQueryRequestModel resolveQueryRequestModel;
      getSharedPreferences("username").then((username) => {
            getSharedPreferences("instituteId").then((instituteId) => {
                  resolveQueryRequestModel = ResolveQueryRequestModel.create(
                      "7",
                      username,
                      value,
                      username,
                      "",
                      responseModel.caseReferenceId,
                      "",
                      instituteId),
      print("kk"+resolveQueryRequestModel.toString()),
      _resolveQueryBloc.dispatch(ResolveQuery(resolveQueryRequestModel)),
                })
          });
    } else {
      Fluttertoast.showToast(msg: "Please put a remark.");
    }
  }
}
