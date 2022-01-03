<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="vieworder.aspx.vb" Inherits="compify.vieworder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Order</title>
         <!-- #include file="includes/acss.aspx" -->
</head>
<body>
         <!-- #include file="includes/userproductsidebar.aspx" -->
    <form id="form1" runat="server">
             <div class="row mt-5">
            <div class ="col-md-12 ">
                <div class="table-responsive vproduct">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:ImageField DataImageUrlField="image" HeaderText="Image"
                        ControlStyle-Width="150" ItemStyle-Width="150"
                        ControlStyle-Height="150" ItemStyle-Height="150" >
                            <ControlStyle Height="150px" Width="150px"></ControlStyle>
                            <ItemStyle Height="150px" Width="150px"></ItemStyle>
                    </asp:ImageField>
                    <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                    <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                    <asp:BoundField DataField="total" HeaderText="total" SortExpression="total" />
                    <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" />
                    <asp:BoundField DataField="quantity" HeaderText="quantity" SortExpression="quantity" />
                    <asp:BoundField DataField="arrivedate" HeaderText="arrivedate" SortExpression="arrivedate" />
                    <asp:BoundField DataField="paymentmethod" HeaderText="paymentmethod" SortExpression="paymentmethod" />
                    <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT product.name, product.price, product.image, orders.total, orders.status, orders.date, orders.quantity, orders.arrivedate, orders.paymentmethod FROM orders INNER JOIN product ON orders.product_id = product.product_id WHERE (orders.order_id = @order_id)">
                <SelectParameters>
                                <asp:SessionParameter Name="order_id" SessionField="order_id" Type="Int32" />
                            </SelectParameters>
            </asp:SqlDataSource>
        </div>
                                  
             </div>
     </div>

    </form>
           
    <!-- #include file="includes/javascripts.aspx" -->
        <!-- #include file="includes/ajs.aspx" -->
</body>
</html>
