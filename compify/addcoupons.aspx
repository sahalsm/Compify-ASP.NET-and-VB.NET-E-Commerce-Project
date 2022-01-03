<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="addcoupons.aspx.vb" Inherits="compify.addcoupons" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>add coupons</title>
 <!-- #include file="includes/acss.aspx" -->
</head>
<body>
    <!-- #include file="includes/asidebar.aspx" -->
    <!-- #include file="includes/anavbar.aspx" -->
    <form id="form1" runat="server">
        <div>

             <div class ="row">
                <div class="col-md-3"></div>
                <div class="col-md-6">
                                       
                         <div class="mb-3">
                                <label for="exampleInputPassword1" class="form-label">Coupon price</label>
                                 <asp:TextBox ID="TextBox1" class="form-control" runat="server"  required="true"  ></asp:TextBox>
                          </div>
                          <div class="mb-3">
                                <label for="exampleInputPassword1" class="form-label">Coupon Code</label>
                                 <asp:TextBox ID="TextBox2"  class="form-control" runat="server" required="true"  ></asp:TextBox>
                          </div>
                          <div class="mb-3">
                                <label for="exampleInputPassword1" class="form-label">Available For?</label>
                                <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server">
                                    <asp:ListItem Value="NORMAL">Normal User</asp:ListItem>
                                    <asp:ListItem Value="SUBSCRIBED">Subscibed User</asp:ListItem>
                                    <asp:ListItem></asp:ListItem>
                                </asp:DropDownList>
                          </div>
                          <asp:Button ID="Button1" CssClass="btn btn-success"  runat="server" Text="Submit" />
                          <asp:Button ID="Button2" CssClass="btn btn-danger"  runat="server" Text="Clear" />
                    
                </div>
                <div class="col-md-3"></div>
        </div>

        </div>
    </form>
      <!-- #include file="includes/afooter.aspx" -->
    <!-- #include file="includes/ajs.aspx" -->
         <script>
         <% If Session("error") IsNot Nothing Then %>
         swal("<%=Session("error") %>", "", "<%=Session("errorstatus") %>");
         <% End If %>
         <% Session("error") = Nothing
         Session("errorstatus") = Nothing%>
         </script>
     <script>
         <% If Session("message") IsNot Nothing Then %>
         swal("<%=Session("message") %>", "", "<%=Session("status") %>");
         <% End If %>
         <% Session("message") = Nothing
             Session("status") = Nothing%>
     </script>
</body>
</html>
