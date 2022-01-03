<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="orders.aspx.vb" Inherits="compify.orders" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Orders</title>
          <!-- #include file="includes/acss.aspx" -->


</head>
<body>
        <!-- #include file="includes/userproductsidebar.aspx" -->
    <form id="form1" runat="server">
          <div class="row mt-5">
            <div class ="col-md-12 ">
                <div class="table-responsive vproduct">
            <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-bordered" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                <Columns>
                   
                    <asp:BoundField DataField="order_id" HeaderText="order_id" SortExpression="order_id" />
                    <asp:BoundField DataField="items" HeaderText="items" ReadOnly="True" SortExpression="items" />
                    <asp:BoundField DataField="total" HeaderText="total" ReadOnly="True" SortExpression="total" />
                    <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" />
                    <asp:BoundField DataField="arrivedate" HeaderText="arrivedate" SortExpression="arrivedate" />
                    <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" />
                     <asp:CommandField ShowSelectButton="True"  SelectText="View"/>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT order_id, COUNT(order_id) AS items, status, SUM(total) AS total, date, arrivedate FROM orders WHERE (user_id = @userid) GROUP BY order_id, status, date, arrivedate ORDER BY order_id DESC">
                <SelectParameters>
                                <asp:SessionParameter Name="userid" SessionField="userid" Type="Int32" />
                            </SelectParameters>
            </asp:SqlDataSource>

            </div>
     </div>
</div>


    </form>




               
    <!-- #include file="includes/javascripts.aspx" -->
        <!-- #include file="includes/ajs.aspx" -->
    
                  <script>
                      $('.vproduct a:contains("Edit")').addClass('btn btn-primary float-start m-1 text-white');
                      $('.vproduct a:contains("Update")').addClass('btn btn-primary float-start m-1 text-white');
                      $('.vproduct a:contains("Delete")').addClass('btn btn-danger float-start m-1 text-white');
                      $('.vproduct a:contains("Cancel")').addClass('btn btn-danger float-start m-1 text-white');
                      $('.vproduct a:contains("View")').addClass('btn btn-success float-start m-1 text-white');

                  </script>
</body>
</html>
