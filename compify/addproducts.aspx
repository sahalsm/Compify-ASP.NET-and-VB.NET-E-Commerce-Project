<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="addproducts.aspx.vb" Inherits="compify.addproducts" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Products</title>
      <!-- #include file="includes/acss.aspx" -->
</head>
<body>
    <!-- #include file="includes/asidebar.aspx" -->
    <!-- #include file="includes/anavbar.aspx" -->
    <form id="form1" runat="server">
    
        <div class="row mt-5">
            <div class="col-md-2">
               
            </div>
            <div class ="col-md-6">
             
                <div class="form-group">
                    <label for="exampleFormControlInput1">Name</label>
                     <asp:TextBox ID="pname" class="form-control" placeholder="Ryzen 5 3600" runat="server" required="true"  ></asp:TextBox>
                </div>   
                <div class="form-group">
                    <label for="exampleFormControlSelect1">Category</label>
                    <asp:DropDownList ID="pcategories" CssClass="form-control" runat="server">
                        <asp:ListItem>CPU Panel</asp:ListItem>
                        <asp:ListItem>Graphics Card</asp:ListItem>
                        <asp:ListItem>HDD</asp:ListItem>
                        <asp:ListItem>Keyboard</asp:ListItem>
                        <asp:ListItem>Motherboard</asp:ListItem>
                        <asp:ListItem>Mouse</asp:ListItem>
                        <asp:ListItem>Monitor</asp:ListItem>
                        <asp:ListItem>Power Supply</asp:ListItem>
                        <asp:ListItem>Processor</asp:ListItem>
                        <asp:ListItem>RAM</asp:ListItem>
                        <asp:ListItem>SSD</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <label for="exampleFormControlSelect1">Brand</label>
                    <asp:DropDownList ID="pbrands" CssClass="form-control" runat="server">
                        <asp:ListItem>Acer</asp:ListItem>
                        <asp:ListItem>Intel</asp:ListItem>
                        <asp:ListItem>Ryzen</asp:ListItem>
                        <asp:ListItem>ASUS</asp:ListItem>
                        <asp:ListItem>HP</asp:ListItem>
                        <asp:ListItem>Samsung</asp:ListItem>
                        <asp:ListItem>Dell</asp:ListItem>
                        <asp:ListItem>Red Gear</asp:ListItem>
                        <asp:ListItem>Gamdias</asp:ListItem>
                        <asp:ListItem>Zotac</asp:ListItem>
                    </asp:DropDownList>
                </div>
                 <div class="form-group">
                    <label>Price</label>
                     <asp:TextBox ID="pprice" class="form-control" runat="server" required="true"  ></asp:TextBox>
                </div>
                 <div class="form-group">
                    <label>Quantity</label>
                     <asp:TextBox ID="pquantity" class="form-control" runat="server" required="true"  ></asp:TextBox>
                </div>
                
                <div class="form-group">
                    <label for="exampleFormControlTextarea1">Description</label>
                    <asp:TextBox ID="pdescription" class="form-control" TextMode="MultiLine" Height="100" runat="server" required="true"  ></asp:TextBox>
                    
                </div>
                 <div class="mb-3 form-group">
                  <label for="formFile" class="form-label">Default file input example</label>
                     <div class="row">
                         <div class="col-md-8">
                             <asp:FileUpload ID="pimage" CssClass="form-control" runat="server"    />
                         </div>
                         <div class="col-md-4">
                            <asp:Button ID="Button3" CssClass="btn btn-success"  runat="server" Text="Upload" />

                         </div>
                     </div>
                 
                    
                 </div>
                  <asp:Button ID="pcancel" CssClass="btn btn-danger" runat="server" Text="Cancel" /> 
                  <asp:Button ID="psubmit" CssClass="btn btn-success"  runat="server" Text="Submit" />
            
            </div>
               <div class="col-md-3 mt-5">
                    <asp:Image ID="Image1" runat="server" Height = "400" Width = "400" />
               </div>
        </div>

    
    
    </form>



    <!-- #include file="includes/afooter.aspx" -->
    <!-- #include file="includes/ajs.aspx" -->
         <script>
         <% If Session("error") IsNot Nothing Then %>
         swal("<%=Session("error") %>", "", "<%=Session("errorstatus") %>");
         <% End If %>
         <% Session("error") = Nothing
         Session("errorstatus") = Nothing%>
         </script>
     <script>
         <% If Session("message") IsNot Nothing Then %>
         swal("<%=Session("message") %>", "", "<%=Session("status") %>");
         <% End If %>
         <% Session("message") = Nothing
             Session("status") = Nothing%>
     </script>
</body>
</html>
