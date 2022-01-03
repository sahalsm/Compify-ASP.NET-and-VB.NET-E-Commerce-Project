<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="admin.aspx.vb" Inherits="compify.admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Dashboard</title>   

    <!-- #include file="includes/acss.aspx" -->
</head>
<body>

     <!-- #include file="includes/asidebar.aspx" -->
     <!-- #include file="includes/anavbar.aspx" -->



     <form id="form1" runat="server">

         <div class="container">
            <div class="row">
            <div class="col-md-3">
              <div class="card-counter primary">
                <i class="fa fa-shopping-cart"></i>
               
                  <asp:Label ID="Label1" CssClass="count-numbers" runat="server" Text="12"></asp:Label>
                <span class="count-name">Products</span>
              </div>
            </div>

            <div class="col-md-3">
              <div class="card-counter danger">
                <i class="fa fa-database"></i>
                <asp:Label ID="Label2" CssClass="count-numbers" runat="server" Text="12"></asp:Label>
                <span class="count-name">Orders</span>
              </div>
            </div>

            <div class="col-md-3">
              <div class="card-counter success">
                <i class="fa fa-ticket"></i>
                <asp:Label ID="Label3" CssClass="count-numbers" runat="server" Text="12"></asp:Label>
                <span class="count-name">Coupons</span>
              </div>
            </div>

            <div class="col-md-3">
              <div class="card-counter info">
                <i class="fa fa-users"></i>
                <asp:Label ID="Label4" CssClass="count-numbers" runat="server" Text="12"></asp:Label>
                <span class="count-name">Users</span>
              </div>
            </div>
          </div>
        </div>





        
    
    
         
     <!-- #include file="includes/afooter.aspx" -->



    <!-- #include file="includes/ajs.aspx" -->
        





        
    
    
         
     </form>

     </body>

</html>
