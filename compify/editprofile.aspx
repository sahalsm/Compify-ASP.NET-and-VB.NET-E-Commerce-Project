<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="editprofile.aspx.vb" Inherits="compify.editprofile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
  <!-- #include file="includes/acss.aspx" -->
 
</head>
<body>
         <!-- #include file="includes/userproductsidebar.aspx" -->
    <form id="form1" runat="server">
                <div class="row justify-content-center">
            <div class="col-md-10 my-5 table-responsive">
                <div class="card">
                    <div class="card-header">
                        <h4>My Profile</h4>
                    </div>
                                 <div class="container">
                                        <div class="row">
                                            <div class="col-md-6">
                                                    <label>Name</label>
                                                    <asp:TextBox ID="name" runat="server" CssClass="form-control" required="true"  ></asp:TextBox>   
                                            </div>
                                                <div class="col-md-6">
                                                    <label>Email</label>
                                                      <asp:TextBox ID="email" runat="server" CssClass="form-control" required="true"  ></asp:TextBox>  
                                                </div>
                                            <div class="col-md-6">
                                                    <label>Phone</label>
                                                  <asp:TextBox ID="phone" runat="server" CssClass="form-control" required="true"  ></asp:TextBox>  
                                            </div>
                                                <div class="col-md-6">
                                                    <label>City</label>
                                                  <asp:TextBox ID="city" runat="server" CssClass="form-control" required="true"  ></asp:TextBox>  
                                            </div>
                                            <div class="col-md-12">
                                                    <label>Address</label>
                                                  <asp:TextBox ID="address" runat="server" TextMode="MultiLine" CssClass="form-control" required="true"  ></asp:TextBox>  
                                            </div>
                                        </div>
                                     <asp:Button ID="update" CssClass="btn btn-success" runat="server" Text="Update" />
                                    </div>
                                </div>
                        </div>
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
