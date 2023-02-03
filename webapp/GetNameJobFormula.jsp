<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONValue"%>
<%@page import="com.jobeligibility.org.controller.FormulaEvaluateController"%>

<%
String strJson = request.getParameter("strJson");

JSONObject jsonObj = (JSONObject) JSONValue.parse(strJson);
System.out.println(jsonObj);
String name = jsonObj.get("name").toString();
String post = jsonObj.get("post").toString();
String elgFormulae = jsonObj.get("formula").toString();

FormulaEvaluateController efc = new FormulaEvaluateController(name,post);
if(efc.resultEvaluate(elgFormulae)){
	out.print(true);
}
else{
	out.print(false);
}
%>