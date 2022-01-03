<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="product.aspx.vb" Inherits="compify.product" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Products</title>
     <!-- #include file="includes/acss.aspx" -->
    <style type="text/css">
        .auto-style1 {
            width: 101%;
            height: 168px;
        }
        .auto-style2 {
            height: 58px;
        }
        .auto-style4 {
            height: 23px;
        }
        .auto-style6 {
            text-align: right;
        }
        .auto-style7 {
            width: 100%;
        }
        .auto-style8 {
            text-align: center;
        }
    </style>
</head>
<body>
         <!-- #include file="includes/userproductsidebar.aspx" -->
    <form id="form1" runat="server">
        <div>

                <div class="card-body">

        <asp:DataList ID="DataList1" runat="server" CssClass="mt-5" DataSourceID="SqlDataSource1" Height="376px" RepeatDirection="Horizontal" Width="506px" RepeatColumns="5">
        
          
        
            <ItemTemplate>
                <div class="mx-2 card card-body shadow">
                    <table class="auto-style1 ">
                    <tr>
                        <td style="text-align: center">
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("image") %>' Height="200px" Width="200px" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2" style="text-align: center">
                            <asp:Label ID="Label2" runat="server" style="text-align: center" Text='<%# Eval("name") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: center">
                            <asp:Label ID="Label3" runat="server" style="text-align: center" Text='<%# Eval("price") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style6">
                            <asp:Button ID="Button1" runat="server" CssClass="btn btn-success btn-sm" Text="View" CommandName="viewproduct" CommandArgument='<%# Eval("name") %>' />
                            &nbsp;</td>
                    </tr>
                </table>
                    <br />
                </div>
            </ItemTemplate>
               
        </asp:DataList>    
             </div>
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [image], [name], [price] FROM [product] WHERE ([category] = @category)">
            <SelectParameters>
                <asp:QueryStringParameter Name="category" QueryStringField="categories" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
            <asp:DataList ID="DataList3" runat="server" DataSourceID="SqlDataSource3" RepeatDirection="Horizontal" RepeatColumns="5">
                <ItemTemplate>
                    <div class="mx-2 card card-body shadow">
                    <table class="auto-style7 ">
                        <tr>
                            <td class="auto-style8">
                                <asp:Image ID="Image3" runat="server" ImageUrl='<%# Eval("image") %>'  Height="200px" Width="200px" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style8">
                                <asp:Label ID="Label6" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style8">
                                <asp:Label ID="Label7" runat="server" Text='<%# Eval("price") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style6">
                                <asp:Button ID="Button3" CssClass="btn btn-success" runat="server" Text="View" />
                            </td>
                        </tr>
                    </table>
                        </div>
                    <br />
                </ItemTemplate>
                </asp:DataList>



                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [image], [name], [price] FROM [product] WHERE ([brand] = @brand)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="brand" QueryStringField="brand" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>



        </div>

          <div class="card-body">
        <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource2" RepeatDirection="Horizontal" CssClass="mt-5" RepeatColumns="5">
          
                <ItemTemplate>
                    <div class=" me-2 card card-body shadow">
                    <table class="auto-style1">
                    
                            <tr>
                                 <td style="text-align: center">
                                    <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("image") %>' Height="200px" Width="200px" />
                                </td>
                            </tr>
                    
                            <tr>
                                <td class="auto-style4" style="text-align: center">
                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: center">
                                    <asp:Label ID="Label5" runat="server" style="text-align: center" Text='<%# Eval("price") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style6">
                                    <asp:Button ID="Button2" runat="server" CssClass="btn btn-success btn-sm" CommandName="viewproduct" Text="View" CommandArgument='<%# Eval("name") %>' />
                                </td>
                            </tr>
                    
                    </table>
                        </div>
                    <br />
                    <br />
                </ItemTemplate>
         
        </asp:DataList>
           </div>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [image], [name], [price] FROM [product] ORDER BY [date], [price]"></asp:SqlDataSource>
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
