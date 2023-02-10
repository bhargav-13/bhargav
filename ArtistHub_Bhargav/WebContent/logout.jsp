<%

session.removeAttribute("u");
session.invalidate();
request.getRequestDispatcher("index.jsp").forward(request, response);
%>