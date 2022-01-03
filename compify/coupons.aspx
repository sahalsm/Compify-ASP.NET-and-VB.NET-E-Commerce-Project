<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="coupons.aspx.vb" Inherits="compify.coupons" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>coupons</title>
  <!-- #include file="includes/acss.aspx" -->
</head>
<body>
    <!-- #include file="includes/asidebar.aspx" -->
    <!-- #include file="includes/anavbar.aspx" -->
    <form id="form1" runat="server">
        <div class="row mt-5">
            <div class ="col-md-12 ">
                <div class="table-responsive vproduct">





            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" CssClass="table table-striped table-bordered" AutoGenerateColumns="False" DataKeyNames="coupon_Id" DataSourceID="SqlDataSource1">
                <Columns>
                   
                    <asp:BoundField DataField="coupon_Id" HeaderText="coupon_Id" InsertVisible="False" ReadOnly="True" SortExpression="coupon_Id" />
                    <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                    <asp:BoundField DataField="couponcode" HeaderText="couponcode" SortExpression="couponcode" />
                    <asp:BoundField DataField="availablefor" HeaderText="availablefor" SortExpression="availablefor" />
                     <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                DeleteCommand="DELETE FROM [coupons] WHERE [coupon_Id] = @coupon_Id" 
                InsertCommand="INSERT INTO [coupons] ([price], [couponcode], [availablefor]) VALUES (@price, @couponcode, @availablefor)" 
                SelectCommand="SELECT * FROM [coupons]" 
                UpdateCommand="UPDATE [coupons] SET [price] = @price, [couponcode] = @couponcode, [availablefor] = @availablefor WHERE [coupon_Id] = @coupon_Id">
                <DeleteParameters>
                    <asp:Parameter Name="coupon_Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="price" Type="Int32" />
                    <asp:Parameter Name="couponcode" Type="String" />
                    <asp:Parameter Name="availablefor" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="price" Type="Int32" />
                    <asp:Parameter Name="couponcode" Type="String" />
                    <asp:Parameter Name="availablefor" Type="Int32" />
                    <asp:Parameter Name="coupon_Id" Type="Int32" />
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
            
     </script>
</body>
</html>
