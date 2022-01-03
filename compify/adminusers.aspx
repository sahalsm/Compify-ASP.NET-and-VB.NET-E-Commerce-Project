<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="adminusers.aspx.vb" Inherits="compify.adminusers" %>

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
         <div class="row mt-5">
            <div class ="col-md-12 ">
                <div class="table-responsive vproduct">
            <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-bordered" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="Id">
                <Columns>
                 
                  
                    <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" InsertVisible="False" ReadOnly="True"></asp:BoundField>
                    <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                    <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                    <asp:BoundField DataField="phone" HeaderText="phone" SortExpression="phone" />
                    <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
                    <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
                    <asp:BoundField DataField="subscription" HeaderText="subscription" SortExpression="subscription" />
                   
                </Columns>
            </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [users] WHERE [Id] = @Id" InsertCommand="INSERT INTO [users] ([user_id], [name], [email], [phone], [password], [address], [city], [subscription], [role], [cardname], [cardnumber], [expirydate]) VALUES (@user_id, @name, @email, @phone, @password, @address, @city, @subscription, @role, @cardname, @cardnumber, @expirydate)" SelectCommand="SELECT * FROM [users] WHERE ([role] = @role)" UpdateCommand="UPDATE [users] SET [user_id] = @user_id, [name] = @name, [email] = @email, [phone] = @phone, [password] = @password, [address] = @address, [city] = @city, [subscription] = @subscription, [role] = @role, [cardname] = @cardname, [cardnumber] = @cardnumber, [expirydate] = @expirydate WHERE [Id] = @Id">
                        <DeleteParameters>
                            <asp:Parameter Name="Id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="user_id" Type="String" />
                            <asp:Parameter Name="name" Type="String" />
                            <asp:Parameter Name="email" Type="String" />
                            <asp:Parameter Name="phone" Type="String" />
                            <asp:Parameter Name="password" Type="String" />
                            <asp:Parameter Name="address" Type="String" />
                            <asp:Parameter Name="city" Type="String" />
                            <asp:Parameter Name="subscription" Type="Int32" />
                            <asp:Parameter Name="role" Type="Int32" />
                            <asp:Parameter Name="cardname" Type="String" />
                            <asp:Parameter Name="cardnumber" Type="Int32" />
                            <asp:Parameter Name="expirydate" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:Parameter DefaultValue="1" Name="role" Type="Int32" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="user_id" Type="String" />
                            <asp:Parameter Name="name" Type="String" />
                            <asp:Parameter Name="email" Type="String" />
                            <asp:Parameter Name="phone" Type="String" />
                            <asp:Parameter Name="password" Type="String" />
                            <asp:Parameter Name="address" Type="String" />
                            <asp:Parameter Name="city" Type="String" />
                            <asp:Parameter Name="subscription" Type="Int32" />
                            <asp:Parameter Name="role" Type="Int32" />
                            <asp:Parameter Name="cardname" Type="String" />
                            <asp:Parameter Name="cardnumber" Type="Int32" />
                            <asp:Parameter Name="expirydate" Type="String" />
                            <asp:Parameter Name="Id" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                         
             </div>
     </div>
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
