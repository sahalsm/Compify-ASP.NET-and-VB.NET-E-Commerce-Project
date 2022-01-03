<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="updateaddress.aspx.vb" Inherits="compify.updateaddress" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
   <!-- #include file="includes/acss.aspx" -->
</head>
<body>
         <!-- #include file="includes/userproductsidebar.aspx" -->
    <form id="form1" runat="server">
        <div>
             <section style="margin:100px;">
        <div class ="row">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <h3 class="text-center">Update Address</h3>
                  
                     <div class="mb-3">
                            <label for="exampleInputPassword1" class="form-label">Address</label>
                           
                         <asp:TextBox ID="TextBox1" class="form-control" runat="server" TextMode="MultiLine" required="true"  ></asp:TextBox>
                </div>
                      <div class="mb-3">
                            <label for="exampleInputPassword1" class="form-label">City</label>
                             <asp:TextBox ID="TextBox2" type="text" class="form-control" runat="server" required="true"  ></asp:TextBox>
                      </div>
                      <asp:Button ID="Button1" CssClass="btn btn-success"  runat="server" Text="Update" />
                      <asp:Button ID="Button2" CssClass="btn btn-danger"  runat="server" Text="Cancel" />
           
            </div>
            <div class="col-md-3"></div>
        </div>
         
    </section>
 
        </div>
    </form>
               
    <!-- #include file="includes/javascripts.aspx" -->
        <!-- #include file="includes/ajs.aspx" -->
     <script>
         <% If Session("message") IsNot Nothing Then %>
         swal("<%=Session("message") %>", "", "<%=Session("status") %>");
         <% End If %>
             <% Session("message") = Nothing
             Session("status") = Nothing%>
     </script>
</body>
</html>
