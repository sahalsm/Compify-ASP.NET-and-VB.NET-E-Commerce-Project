<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="apayments.aspx.vb" Inherits="compify.apayments" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
  <!-- #include file="includes/acss.aspx" -->
</head>
<body>

     <!-- #include file="includes/asidebar.aspx" -->
     <!-- #include file="includes/anavbar.aspx" -->
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered" DataKeyNames="Id" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                    <asp:BoundField DataField="cardname" HeaderText="cardname" SortExpression="cardname" />
                    <asp:BoundField DataField="cardnumber" HeaderText="cardnumber" SortExpression="cardnumber" />
                    <asp:BoundField DataField="expirydate" HeaderText="expirydate" SortExpression="expirydate" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Id],[name], [cardname], [cardnumber], [expirydate] FROM [users] WHERE role=1 ">

            </asp:SqlDataSource>
        </div>
    </form>
     <!-- #include file="includes/afooter.aspx" -->



    <!-- #include file="includes/ajs.aspx" -->
    
                  <script>
                      $('.vproduct a:contains("Edit")').addClass('btn btn-primary float-start m-1 text-white');
                      $('.vproduct a:contains("Update")').addClass('btn btn-primary float-start m-1 text-white');
                      $('.vproduct a:contains("Delete")').addClass('btn btn-danger float-start m-1 text-white');
                      $('.vproduct a:contains("Cancel")').addClass('btn btn-danger float-start m-1 text-white');
                      $('.vproduct a:contains("Modify")').addClass('btn btn-success float-start m-1 text-white');

                  </script>
</body>
</html>
