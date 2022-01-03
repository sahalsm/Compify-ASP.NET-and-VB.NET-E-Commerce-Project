<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="editproducts.aspx.vb" Inherits="compify.editproducts" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Products</title>
     <!-- #include file="includes/acss.aspx" -->
</head>
<body>
    <!-- #include file="includes/asidebar.aspx" -->
    <!-- #include file="includes/anavbar.aspx" -->
    <form id="form1" runat="server">
          <div class="row mt-5">
            <div class ="col-md-12 ">
                <div class="table-responsive vproduct">

            
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="product_id" DataSourceID="SqlDataSource1" CssClass="table table-striped table-bordered" CellSpacing="-1" >
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:ImageField DataImageUrlField="image" HeaderText="Image"
                                ControlStyle-Width="150" ItemStyle-Width="150"
                                ControlStyle-Height="150" ItemStyle-Height="150" >
                                    <ControlStyle Height="150px" Width="150px"></ControlStyle>
                                    <ItemStyle Height="150px" Width="150px"></ItemStyle>
                            </asp:ImageField>
                            <asp:BoundField DataField="product_id" HeaderText="product_id" InsertVisible="False" ReadOnly="True" SortExpression="product_id" />
                            <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                            <asp:BoundField DataField="category" HeaderText="category" SortExpression="category" />
                            <asp:BoundField DataField="brand" HeaderText="brand" SortExpression="brand" />
                            <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" >
                            <ItemStyle CssClass="descprod" />
                            </asp:BoundField>
                            <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                            <asp:BoundField DataField="quantity" HeaderText="quantity" SortExpression="quantity" />
                            <asp:BoundField DataField="total" HeaderText="total" SortExpression="total" />
                            <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" />
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" >
                            <ControlStyle ForeColor="#3333FF" />
                            <ItemStyle Wrap="True" />
                            </asp:CommandField>
                        </Columns>
                        
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        DeleteCommand="DELETE FROM [product] WHERE [product_id] = @original_product_id " 
                        InsertCommand="INSERT INTO [product] ([name], [category], [brand], [description], [price], [quantity], [total], [image], [date]) VALUES (@name, @category, @brand, @description, @price, @quantity, @total, @image, @date)" OldValuesParameterFormatString="original_{0}" 
                        SelectCommand="SELECT * FROM [product]" 
                        UpdateCommand="UPDATE [product] SET [name] = @name, [category] = @category, [brand] = @brand, [description] = @description, [price] = @price, [quantity] = @quantity, [total] = @total, [image] = @image, [date] = @date WHERE [product_id] = @original_product_id AND [name] = @original_name AND [category] = @original_category AND [brand] = @original_brand AND [description] = @original_description AND [price] = @original_price AND [quantity] = @original_quantity AND [total] = @original_total AND (([image] = @original_image) OR ([image] IS NULL AND @original_image IS NULL)) AND [date] = @original_date">
                        <DeleteParameters>
                            <asp:Parameter Name="original_product_id" Type="Int32" />
                            <asp:Parameter Name="original_name" Type="String" />
                            <asp:Parameter Name="original_category" Type="String" />
                            <asp:Parameter Name="original_brand" Type="String" />
                            <asp:Parameter Name="original_description" Type="String" />
                            <asp:Parameter Name="original_price" Type="Int32" />
                            <asp:Parameter Name="original_quantity" Type="Int32" />
                            <asp:Parameter Name="original_total" Type="Int32" />
                            <asp:Parameter Name="original_image" Type="String" />
                            <asp:Parameter DbType="Date" Name="original_date" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="name" Type="String" />
                            <asp:Parameter Name="category" Type="String" />
                            <asp:Parameter Name="brand" Type="String" />
                            <asp:Parameter Name="description" Type="String" />
                            <asp:Parameter Name="price" Type="Int32" />
                            <asp:Parameter Name="quantity" Type="Int32" />
                            <asp:Parameter Name="total" Type="Int32" />
                            <asp:Parameter Name="image" Type="String" />
                            <asp:Parameter DbType="Date" Name="date" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="name" Type="String" />
                            <asp:Parameter Name="category" Type="String" />
                            <asp:Parameter Name="brand" Type="String" />
                            <asp:Parameter Name="description" Type="String" />
                            <asp:Parameter Name="price" Type="Int32" />
                            <asp:Parameter Name="quantity" Type="Int32" />
                            <asp:Parameter Name="total" Type="Int32" />
                            <asp:Parameter Name="image" Type="String" />
                            <asp:Parameter DbType="Date" Name="date" />
                            <asp:Parameter Name="original_product_id" Type="Int32" />
                            <asp:Parameter Name="original_name" Type="String" />
                            <asp:Parameter Name="original_category" Type="String" />
                            <asp:Parameter Name="original_brand" Type="String" />
                            <asp:Parameter Name="original_description" Type="String" />
                            <asp:Parameter Name="original_price" Type="Int32" />
                            <asp:Parameter Name="original_quantity" Type="Int32" />
                            <asp:Parameter Name="original_total" Type="Int32" />
                            <asp:Parameter Name="original_image" Type="String" />
                            <asp:Parameter DbType="Date" Name="original_date" />
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
