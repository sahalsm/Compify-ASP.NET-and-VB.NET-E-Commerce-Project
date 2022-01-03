<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="viewadminorder.aspx.vb" Inherits="compify.viewadminorder" %>

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
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:ImageField DataImageUrlField="image" HeaderText="Image"
                            ControlStyle-Width="150" ItemStyle-Width="150"
                            ControlStyle-Height="150" ItemStyle-Height="150" >
                        <ControlStyle Height="150px" Width="150px"></ControlStyle>
                        <ItemStyle Height="150px" Width="150px"></ItemStyle>
                    </asp:ImageField>
                    <asp:BoundField DataField="product_name" HeaderText="product_name" SortExpression="product_name" />
                    <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                    <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                    <asp:BoundField DataField="phone" HeaderText="phone" SortExpression="phone" />
                    <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
                    <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
                    <asp:BoundField DataField="quantity" HeaderText="quantity" SortExpression="quantity" />
                    <asp:BoundField DataField="total" HeaderText="total" SortExpression="total" />
                    <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" />
                    <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" />
                    <asp:BoundField DataField="arrivedate" HeaderText="arrivedate" SortExpression="arrivedate" />
                    <asp:BoundField DataField="paymentmethod" HeaderText="paymentmethod" SortExpression="paymentmethod" />
                    <asp:BoundField DataField="couponcode" HeaderText="couponcode" SortExpression="couponcode" />
               
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT product.image, product.price, users.name, users.phone, users.address, users.city, orders.quantity, orders.total, orders.status, orders.date, orders.arrivedate, orders.paymentmethod, coupons.couponcode, product.name AS product_name FROM coupons INNER JOIN orders ON coupons.coupon_Id = orders.coupon_id INNER JOIN product ON orders.product_id = product.product_id INNER JOIN users ON orders.user_id = users.Id WHERE (orders.order_id = @order_id)">
                 <SelectParameters>
                    <asp:QueryStringParameter Name="order_id" QueryStringField="id" />
                </SelectParameters>
            </asp:SqlDataSource>
                         
             </div>
     </div>
</div>

    </form>
     <!-- #include file="includes/afooter.aspx" -->



    <!-- #include file="includes/ajs.aspx" -->
</body>
</html>
