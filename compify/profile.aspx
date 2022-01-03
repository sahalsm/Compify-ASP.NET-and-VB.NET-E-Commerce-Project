<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="profile.aspx.vb" Inherits="compify.profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
   <!-- #include file="includes/acss.aspx" -->
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
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
                    <div class="card-body">
                        <asp:DataList ID="DataList1" runat="server" DataKeyField="Id" CssClass="" DataSourceID="SqlDataSource1">
                            <ItemTemplate>
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-6">
                                             <label>Name</label>
                                            <input type="text" value="<%# Eval("name") %>" class="form-control"/>
                                        </div>
                                         <div class="col-md-6">
                                             <label>Email</label>
                                            <input type="email" value="<%# Eval("email") %>" class="form-control"/>
                                        </div>
                                        <div class="col-md-6">
                                             <label>Phone</label>
                                            <input type="number" value="<%# Eval("phone") %>" class="form-control"/>
                                        </div>
                                         <div class="col-md-6">
                                             <label>City</label>
                                            <input type="text" value="<%# Eval("city") %>" class="form-control"/>
                                        </div>
                                        <div class="col-md-12">
                                             <label>Address</label>
                                            <textarea class="form-control"><%# Eval("address") %></textarea>
                                        </div>
                                    </div>
                                </div>
                        
                            </ItemTemplate>
                        </asp:DataList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [users] WHERE ([Id] = @Id)">
                            <SelectParameters>
                                <asp:SessionParameter Name="Id" SessionField="userid" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:Button ID="Button1" runat="server" CssClass="btn my-5 ms-5 float-end btn-success" Text="Subscribe"  />
                        <asp:Button ID="edit" runat="server" CssClass="btn my-5 float-end btn-warning" Text="Edit"  />
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
