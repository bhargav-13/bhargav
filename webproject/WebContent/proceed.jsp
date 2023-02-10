<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>

<% 
   Random randomGenerator = new Random();
   int randomInt = randomGenerator.nextInt(1000000);
%>

<form method="post" action="pgRedirect.jsp">
					<table border="1">
						<tbody>
							<tr>
								<th>S.No</th>
								<th>Label</th>
								<th>Value</th>
							</tr>
							<tr>
								<td>1</td>
								<td><label>ORDER_ID::*</label></td>
								<td><input id="ORDER_ID" tabindex="1" maxlength="20"
									size="20" name="ORDER_ID" autocomplete="off"
									value="ORDS_<%= randomInt %>"></td>
							</tr>
							<tr>
								<td>2</td>
								<td><label>CUSTID ::*</label></td>
								<td><input id="CUST_ID" tabindex="2" maxlength="30"
									size="12" name="CUST_ID" autocomplete="off" value="<%=u.getUid()%>_<%=u.getFname()%>"></td>
							</tr>
							<tr>
								<td>3</td>
								<td><label>INDUSTRY_TYPE_ID ::*</label></td>
								<td><input id="INDUSTRY_TYPE_ID" tabindex="4"
									maxlength="12" size="12" name="INDUSTRY_TYPE_ID"
									autocomplete="off" value="Retail"></td>
							</tr>
							<tr>
								<td>4</td>
								<td><label>Channel ::*</label></td>
								<td><input id="CHANNEL_ID" tabindex="4" maxlength="12"
									size="12" name="CHANNEL_ID" autocomplete="off" value="WEB">
								</td>
							</tr>
							
							<tr>
								<td colspan="3">
									<button value="CheckOut" type="submit" class="btn btn-block btn-primary font-weight-bold my-3 py-3">Proceed To Checkout</button>
								</td>
								</tr>
						</tbody>
					</table>
					* - Mandatory Fields
				</form>

</body>
</html>