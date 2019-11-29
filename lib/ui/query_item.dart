import 'package:equaze/models/response_models/grievance_list_response_model.dart';
import 'package:equaze/ui/query_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class QueryCard extends StatelessWidget {
  GrievanceListResponseModel grievanceModel;

  QueryCard(this.grievanceModel);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return QueryDetailPage(responseModel: grievanceModel);
        }));
      },
      child: Container(
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
                              DateFormat('MMM dd,yyyy').format(DateFormat("EEE MMM dd HH:mm:ss 'IST' yyyy").parse(grievanceModel.lastModifiedAt)),
                              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        //Date
                        Text("Name: ${grievanceModel.nameOfRequester}",style: TextStyle(color: Color(0xFFB53C12), fontSize: 24, fontWeight: FontWeight.bold),),
                        SizedBox(height: 5,),
                        Text("Raised By: ${grievanceModel.raiseRequestAs}",style: TextStyle(color: Colors.lightBlue, fontSize: 20,fontWeight: FontWeight.bold),),
                        SizedBox(height: 5,),
                        Text("Category: ${grievanceModel.category}",style: TextStyle(color: Colors.black, fontSize: 16),),
                        SizedBox(height: 5,),
                        Text("Sub Category: ${grievanceModel.subCategory}",style: TextStyle(color: Colors.black, fontSize: 16),),
                        SizedBox(height: 5,),
                        Text("Sub Sub Category: ${grievanceModel.subSubCategory}",style: TextStyle(color: Colors.black, fontSize: 16),),
                        SizedBox(
                          height: 10,
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
      ),
    );
  }
}
