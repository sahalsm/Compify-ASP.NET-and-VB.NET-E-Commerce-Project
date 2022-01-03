<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="cart.aspx.vb" Inherits="compify.cart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>cart</title>
            <!-- #include file="includes/acss.aspx" -->

    </head>
<body>
        <!-- #include file="includes/userproductsidebar.aspx" -->
    <form id="form1" runat="server">
          <div class="row mt-5">
            <div class ="col-md-12 ">
                <div class="table-responsive vproduct">
          
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" CssClass="table table-striped table-bordered" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="cart_id" DataSourceID="SqlDataSource1">
                            <Columns>
                                <asp:BoundField DataField="cart_id" HeaderText="cart_id" InsertVisible="False" ReadOnly="True" SortExpression="cart_id" />
                                 <asp:ImageField DataImageUrlField="image" HeaderText="Image"
                                     ControlStyle-Width="150" ItemStyle-Width="150"
                                     ControlStyle-Height="150" ItemStyle-Height="150" >
                                    <ControlStyle Height="150px" Width="150px"></ControlStyle>
                                    <ItemStyle Height="150px" Width="150px"></ItemStyle>
                                </asp:ImageField>
                                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                                <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                                <asp:BoundField DataField="quantity" HeaderText="quantity" SortExpression="quantity" />
                                <asp:CommandField ShowSelectButton="True" SelectText="Modify" ShowDeleteButton="True" />
                        
                            </Columns>
                            <EmptyDataTemplate>
                                No Items Available
                            </EmptyDataTemplate>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            SelectCommand="SELECT cart.cart_id, product.image, product.name, product.price, cart.quantity FROM cart INNER JOIN product ON cart.product_id = product.product_id INNER JOIN users ON cart.user_id = users.Id WHERE (cart.status = 'PENDING') AND (cart.user_id = @userid) ORDER BY cart.date" DeleteCommand="DELETE FROM cart WHERE (cart_id = -1)">
                            <SelectParameters>
                                <asp:SessionParameter Name="userid" SessionField="userid" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:Button ID="Button1" runat="server" Text="CheckOut" CssClass="btn btn-success float-right " style="text-align: center; margin-right:30px;" />
                  
             </div>
     </div>
</div>




        

           
    <!-- #include file="includes/javascripts.aspx" -->
        <!-- #include file="includes/ajs.aspx" -->



                  <script>
                      $('.vproduct a:contains("Edit")').addClass('btn btn-primary float-start m-1 text-white');
                      $('.vproduct a:contains("Update")').addClass('btn btn-primary float-start m-1 text-white');
                      $('.vproduct a:contains("Delete")').addClass('btn btn-danger float-start m-1 text-white');
                      $('.vproduct a:contains("Cancel")').addClass('btn btn-danger float-start m-1 text-white');
                      $('.vproduct a:contains("Modify")').addClass('btn btn-success float-start m-1 text-white');

                  </script>
            <script>
         <% If Session("message") IsNot Nothing Then %>
                swal("<%=Session("message") %>", "", "<%=Session("status") %>");
         <% End If %>
             <% Session("message") = Nothing
             Session("status") = Nothing%>
            </script>
      
    </form>


    
           
    </body>
</html>
