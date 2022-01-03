<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="adminorders.aspx.vb" Inherits="compify.adminorders" %>

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
                   
                    <asp:BoundField DataField="order_id" HeaderText="order_id" SortExpression="order_id" />
                    <asp:BoundField DataField="items" HeaderText="items" ReadOnly="True" SortExpression="items" />
                    <asp:BoundField DataField="user_id" HeaderText="user_id" SortExpression="user_id" />
                    <asp:BoundField DataField="stotal" HeaderText="stotal" ReadOnly="True" SortExpression="stotal" />
                    <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" />
                    <asp:BoundField DataField="arrivedate" HeaderText="arrivedate" SortExpression="arrivedate" />
                    <asp:BoundField DataField="paymentmethod" HeaderText="paymentmethod" SortExpression="paymentmethod" />
                    <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" />
                     <asp:CommandField ShowSelectButton="True" DeleteText="Delivered" SelectText="View" ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT order_id, COUNT(order_id) AS items, user_id, SUM(total) AS stotal, date, arrivedate, paymentmethod, status FROM orders GROUP BY order_id, date, status, arrivedate, paymentmethod, user_id ORDER BY date DESC" 
                UpdateCommand="UPDATE orders SET status = 0 WHERE (order_id = @order_id)" 
                DeleteCommand="DELETE FROM orders WHERE (Id = - 1)">
                <UpdateParameters>
                    <asp:Parameter Name="order_id" />
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
                      $('.vproduct a:contains("Delivered")').addClass('btn btn-warning float-start m-1 text-white');
                      $('.vproduct a:contains("Cancel")').addClass('btn btn-danger float-start m-1 text-white');
                      $('.vproduct a:contains("View")').addClass('btn btn-success float-start m-1 text-white');

                  </script>


</body>
</html>
