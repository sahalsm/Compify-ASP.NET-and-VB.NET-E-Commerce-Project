<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="checkout.aspx.vb" Inherits="compify.checkout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>checkout</title>
      <!-- #include file="includes/acss.aspx" -->
    <style type="text/css">
        .auto-style1 {
            text-align: right;
        }
        .auto-style2 {
            width: 100%;
        }
        </style>
</head>
<body>
    <!-- #include file="includes/userproductsidebar.aspx" -->
    <form id="form1" runat="server">
       

            <div class="row mt-5">

            <div class="col-md-3"></div>
            <div class="col-md-5">

            <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" Width="737px" >
                <FooterTemplate>
                    <div class="auto-style1">
                        <table class="auto-style2">
                            <tr>
                                <td>
                                    <hr />
                                </td>
                                <td>
                                    <hr />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label5" runat="server" Font-Size="Large" Text="Items:"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="Label14" runat="server" Text="₹"></asp:Label>
                                    <asp:Label ID="Label12" runat="server" Text='<%# Session("itemstotal") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label8" runat="server" Text="Delivery:"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="Label15" runat="server" Text="₹"></asp:Label>
                                    <asp:Label ID="Label11" runat="server" Text="150"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label9" runat="server" Text="Coupon Applied:"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="Label18" runat="server" Text="₹"></asp:Label>
                                    <asp:Label ID="Label19" runat="server" Text="0"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label10" runat="server" Text="Order Total:"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="Label17" runat="server" Font-Size="Large" ForeColor="Red" Text="₹"></asp:Label>
                                    <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text='<%# Session("total") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </div>
                </FooterTemplate>
                <HeaderTemplate>
                    <asp:Label ID="Label7" runat="server" Text="CheckOut"></asp:Label>
                </HeaderTemplate>
                <ItemTemplate>
                    <table class="table table-borderless">
                        <tr>
                            <td>
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("image") %>' Width="80px" Height="80px" />
                            </td>
                            <td>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("name") %>' Font-Bold="True" Font-Size="Large"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("quantity") %>' Font-Size="Large"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("price") %>' Font-Size="Large"></asp:Label>
                                
                            </td>
                        </tr>
                    </table>
                                   
                </ItemTemplate>
            </asp:DataList>
                 <asp:Button ID="Button1" runat="server" CssClass="btn btn-success float-right" OnClick="Button1_Click" Text="Order Now" />

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
               SelectCommand="SELECT product.image, product.name, product.price, cart.quantity FROM cart INNER JOIN product ON cart.product_id = product.product_id INNER JOIN users ON cart.user_id = users.Id WHERE (cart.status = 'PENDING') AND (cart.user_id = @userid) ORDER BY cart.date"> 
                 <selectparameters>
		<asp:sessionparameter name="userid" sessionfield="userid" type="Int32" />
	</selectparameters>

            </asp:SqlDataSource>

                </div>
            <div class="col-md-3">
                <asp:Label ID="Label4" runat="server" Text="Select Coupons"></asp:Label>
                <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>
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
