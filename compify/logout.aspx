<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="logout.aspx.vb" Inherits="compify.logout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>logout</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <% Session.Abandon()
                Response.Redirect("home.aspx")%>
        </div>
    </form>
</body>
</html>
