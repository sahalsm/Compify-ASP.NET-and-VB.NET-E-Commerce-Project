<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="register.aspx.vb" Inherits="compify.register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
        <link rel="stylesheet" href="asset/css/bootstrap.css" />
    <link rel="stylesheet" href="asset/css/custom.css" />
</head>
<body>

  <section>
        <div>
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
              <div class="container">
                <a class="navbar-brand" href="#">COMPIFY</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                  <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-auto ml-auto">
                    <li class="nav-item">
                      <a class="nav-link active" aria-current="page" href="home.aspx">Home</a>
                    </li>
                    <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Brands
                      </a>
                      <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="product.aspx?brand=Acer">Acer</a></li>
                        <li> <a class="dropdown-item" href="product.aspx?brand=Dell">Dell</a></li>
                        <li> <a class="dropdown-item" href="product.aspx?brand=Intel">Intel</a></li>
                        <li> <a class="dropdown-item" href="product.aspx?brand=Ryzen">Ryzen</a></li>
                        <li><a class="dropdown-item" href="product.aspx?brand=ASUS">Asus</a></li>
                        <li> <a class="dropdown-item" href="product.aspx?brand=HP">HP</a></li>
                        <li> <a class="dropdown-item" href="product.aspx?brand=Red Gear">RedGear</a></li>
                             <li> <a class="dropdown-item" href="product.aspx?brand=Zotac">Zotac</a></li>

                      </ul>
                    </li>
                    <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Categories
                      </a>
                      <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="product.aspx?categories=CPU Panel">CPU Panel</a></li>
                        <li><a class="dropdown-item" href="product.aspx?categories=Graphics Card">Graphics Card</a></li>
                        <li><a class="dropdown-item" href="product.aspx?categories=HDD">HDD</a></li>
                        <li><a class="dropdown-item" href="product.aspx?categories=Keyboard">Keyboard</a></li>
                        <li><a class="dropdown-item" href="product.aspx?categories=Motherboard">Motherboard</a></li>
                        <li><a class="dropdown-item" href="product.aspx?categories=Mouse">Mouse</a></li>
                        <li><a class="dropdown-item" href="product.aspx?categories=Monitor">Monitor</a></li>
                        <li><a class="dropdown-item" href="product.aspx?categories=Power Supply">Power Supply</a></li>
                        <li><a class="dropdown-item" href="product.aspx?categories=Processor">Processor</a></li>
                        <li><a class="dropdown-item" href="product.aspx?categories=RAM">RAM</a></li>
                        <li><a class="dropdown-item" href="product.aspx?categories=SSD">SSD</a></li>
                      </ul>
                    </li>
                    <li class="nav-item dropdown">
                      <asp:HyperLink ID="HyperLink1" CssClass="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false" runat="server">  
                                         <% if Session("name") Is Nothing Then  %>
                                                    Login
                                         <% Else  %>
                                              <%=Session("name") %>  
                                         <% End If %>
                       </asp:HyperLink>
                             <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="cart.aspx">Cart</a></li>
                                <li><a class="dropdown-item" href="profile.aspx">Profile</a></li>
                                <li><a class="dropdown-divider"></a></li> <hr>
                                <li>    
                                         <% if Session("name") Is Nothing Then  %>
                                                     <a class="dropdown-item" href="login.aspx">Login</a>
                                         <% Else  %>
                                                 <a class="dropdown-item" href="logout.aspx">Logout</a>
                                         <% End If %> </li>
                              </ul>
                    </li>
                      <li class="nav-item">
                      <a class="nav-link" aria-current="page" href="cart.aspx">Cart
                          </a>
                       </li>
                  </ul>
                </div>
              </div>
            </nav>
        </div>
    </section>

    <section style="margin:100px;">
        <div class ="row">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <h3 class="text-center">Register Here!</h3>
                  <form id="form1" runat="server">
                      <div class="mb-3">
                            <label for="exampleInputEmail1" class="form-label">Full Name</label>
                            <asp:TextBox ID="TextBox1" class="form-control" runat="server" required="true"></asp:TextBox>
                      </div>
                      <div class="mb-3">
                            <label for="exampleInputPassword1" class="form-label">Email</label>
                             <asp:TextBox ID="TextBox2" class="form-control" runat="server" TextMode="Email"  required="true"></asp:TextBox>
                             <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                      </div>
                      <div class="mb-3">
                            <label for="exampleInputPassword1" class="form-label">Phone Number</label>
                             <asp:TextBox ID="TextBox5" class="form-control" runat="server" MaxLength="10" TextMode="number"  required="true"></asp:TextBox>

                      </div>
                      <div class="mb-3">
                            <label for="exampleInputPassword1" class="form-label">Password</label>
                             <asp:TextBox ID="TextBox3" type="password" class="form-control" runat="server" TextMode="Password"  required="true"></asp:TextBox>
                      </div>
                      <div class="mb-3">
                            <label for="exampleInputPassword1" class="form-label">Confirm Password</label>
                             <asp:TextBox ID="TextBox4" type="password" class="form-control" runat="server" TextMode="Password"  required="true"></asp:TextBox>
                      </div>
                      <asp:Button ID="Button1" CssClass="btn btn-success"  runat="server" Text="Submit" />
                      <asp:Button ID="Button2" CssClass="btn btn-danger"  runat="server" Text="Cancel" />
                </form>
            </div>
            <div class="col-md-3"></div>
        </div>
         
    </section>
 




<section>

        <div class="footer d-flex justify-content-between">

            <div>
                <h6 class="para ">HOME</h6>
                <p class="para ">Build your own pc</p>
                <p class="para ">Testimonials</p>
                <p class="para ">Recently Added</p>
            </div> 
   
            <div>
                <h6 class="para ">BRAND</h6>
                <p class="para ">Build your own pc</p>
                <p class="para ">Testimonials</p>
                <p class="para ">Recently Added</p>
            </div> 
   
            <div>
                <h6 class="para ">CATEGORIES</h6>
                <p class="para ">Build your own pc</p>
                <p class="para ">Testimonials</p>
                <p class="para ">Recently Added</p>
            </div> 
   
            <div>
                <h6 class="para ">MY ACCOUNT</h6>
                <p class="para ">Profie</p>
                <p class="para ">Cart</p>
                <p class="para ">Orders</p>
            </div> 
   


        </div>

        <div class="footer-end d-flex justify-content-between">
            <p class="para " >Follow us on Facebook Instagram</p>
            <p class="para " >Copyright © 2021 compify.com All rights reserved</p>
            <p class="para " >Phone : +91 9108454347</p>
        </div>

    </section>


 <!-- #include file="includes/javascripts.aspx" -->
     <script>
         <% If Session("error") IsNot Nothing Then %>
         swal("<%=Session("error") %>", "", "<%=Session("errorstatus") %>");
         <% End If %>
         <% Session("error") = Nothing
         Session("errorstatus") = Nothing%>
     </script>
</body>
</html>

