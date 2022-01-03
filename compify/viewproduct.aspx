<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="viewproduct.aspx.vb" Inherits="compify.viewproduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
         <!-- #include file="includes/acss.aspx" -->
</head>
<body>
         <!-- #include file="includes/userproductsidebar.aspx" -->
    <form id="form1" runat="server">
        <div class="row mt-5">
           <div class="col-md-2"></div>
            
            <div class=" col-md-4">
                   <asp:Label ID="Label1" runat="server" Text="Label" Font-Bold="True" Font-Size="XX-Large"></asp:Label>
                <hr />
                <div class="card shadow ">
                        <asp:Image ID="Image1" runat="server"  />
                    </div>
                </div>
       <div class=" col-md-3" style="margin-top: 120px; margin-left: 80px;">
              
          <div >
                        <asp:Label ID="Label32" runat="server" Text="Price : " Font-Bold="True" Font-Size="XX-Large" ForeColor="Black"></asp:Label>       
                        <asp:Label ID="Label323" runat="server" Text="₹" Font-Bold="True" Font-Size="XX-Large" ForeColor="Black"></asp:Label>                 
                        <asp:Label ID="Label3" runat="server" Text="Label" Font-Bold="True" Font-Size="XX-Large" ForeColor="Black"></asp:Label>          
                        <br /><br />
                    <asp:Label ID="Label12" runat="server" Text="Description : " Font-Bold="True" Font-Size="Large"></asp:Label>
                    <asp:Label ID="Label2" runat="server" Text="Label" Font-Size="Large"></asp:Label><br /><br />
                    <asp:Label ID="Label5" runat="server" Text="Quantity : " Font-Bold="True" Font-Size="Large"></asp:Label>
        
                     <asp:DropDownList ID="quantity" CssClass="dropdown" runat="server" Font-Size="Large" >
                         <asp:ListItem Value="1">1</asp:ListItem>
                         <asp:ListItem Value="2">2</asp:ListItem>
                         <asp:ListItem Value="3">3</asp:ListItem>
                         <asp:ListItem Value="4">4</asp:ListItem>
                         <asp:ListItem Value="5">5</asp:ListItem>
                         <asp:ListItem Value="6">6</asp:ListItem>
                         <asp:ListItem></asp:ListItem>
                     </asp:DropDownList>
                     <br />
                  <asp:Label ID="Label4" runat="server" Text="Label" Visible="False"></asp:Label>
                      <asp:Label ID="price" runat="server" Text="Label" Visible="False"></asp:Label><br />
                  <asp:Label ID="total" runat="server" Text="Label" ForeColor="Red" Visible="False" ></asp:Label>
                        <asp:Label ID="Label324" runat="server"></asp:Label>
                        <asp:Label ID="pqtylab" runat="server"></asp:Label>
                        <br />
                     <br />
                 
                  <asp:Button ID="Button1" runat="server" CssClass="btn btn-success sticky-bottom mb-5 float-right" Text="Add to Cart" />
            </div>
        </div>

            
        <div class="col-md-3"></div>
                        
       
            </div>
   

       
    <!-- #include file="includes/javascripts.aspx" -->
        <!-- #include file="includes/ajs.aspx" -->
    <script>
         <% If Session("qty") IsNot Nothing Then %>
         swal("<%=Session("qty") %>", "", "<%=Session("status") %>");
         <% End If %>
        <% Session("qty") = Nothing
        Session("status") = Nothing%>
    </script>
    </form>


       
    </body>
</html>
