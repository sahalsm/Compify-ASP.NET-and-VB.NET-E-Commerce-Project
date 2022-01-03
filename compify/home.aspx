<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="home.aspx.vb" Inherits="compify.home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Compify</title>
 <!-- #include file="includes/css.aspx" -->
</head>
<body>
    <form id="form1" runat="server">
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
     <section>
        <div>
            <div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
              <div class="carousel-inner">
                <div class="carousel-item active">
                  <img src="asset/images/slider-img1.png" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                  <img src="asset/images/slider-img2.png" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                  <img src="asset/images/slider-img3.png" class="d-block w-100" alt="...">
                </div>
              </div>
              <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
              </button>
              <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
              </button>
            </div>
        </div>
    </section>

     <section class="section" id="configure">
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-3">
                <div>
                    <h1>Build Your Dream PC</h1>
                    <br />
                    <h5>Get your dream PC built either at our store or online using our build your PC page and get the complete setup delivered at your door step.</h5>
                    <br />
                    <a href="product.aspx" class="btn btn-outline-success">Configure Now</a>
                </div>
            </div>
            <div class="col-md-3">
                <div>
                    <image src="asset/images/configure.jfif" style="width: 350px; height: 300px"></image>
                </div>
            </div>
            <div class="col-md-3"></div>
        </div>
        <br />
        <br />
        <br />
        <br />
        <hr />
         <section>
             <image src="asset/images/banner1.jpg" style="width:1525px"></image>
         </section>


         <section class="mt-5 text-center">
             <h1>TRENDING PRODUCTS</h1>
             <div class="row mt-5">
                 <div class="col-md-3">
                     <div class="card shadow ms-4 text-center" style="width: 18rem;">
                      <img class="card-img-top" src="Files/ACER-PREDATOR-XB1-27-INCH-WQHD-XB271HU-GAMING-MONITOR-2-300x300.jpg" alt="Card image cap">
                      <div class="card-body">
                        <h5 class="card-title">Monitors</h5>
                        <p class="card-text">Brand new Monitors with Reasonable price.</p>
                        <a href="product.aspx?categories=Monitor" class="btn btn-warning">View</a>
                      </div>
                    </div>
                 </div>

                 <div class="col-md-3">
                     <div class="card shadow ms-4 text-center" style="width: 18rem;">
                      <img class="card-img-top" src="Files/ASUS-DUAL-GEFORCE-RTX-3060-TI-V2-MINI-8GB-GDDR6-WITH-LHR-2-300x300.jpg" alt="Card image cap">
                      <div class="card-body">
                        <h5 class="card-title">Graphics card</h5>
                        <p class="card-text">Brand new Graphics card with Reasonable price.</p>
                        <a href="product.aspx?categories=graphics card" class="btn btn-warning">View</a>
                      </div>
                    </div>
                 </div>
                 <div class="col-md-3">
                     <div class="card shadow ms-4 text-center" style="width: 18rem;">
                      <img class="card-img-top" src="Files/Patriot-Viper-RGB-16GB-8GBX2-DDR4-3200MHz-Black-2-300x300.jpg" alt="Card image cap">
                      <div class="card-body">
                        <h5 class="card-title">RAM</h5>
                        <p class="card-text">Brand new RAM with Reasonable price.</p>
                        <a href="product.aspx?categories=Ram" class="btn btn-warning">View</a>
                      </div>
                    </div>
                 </div>
                 <div class="col-md-3">
                     <div class="card shadow ms-4 text-center" style="width: 18rem;">
                      <img class="card-img-top" src="Files/ryzen5.jpg" alt="Card image cap">
                      <div class="card-body">
                        <h5 class="card-title">Processors</h5>
                        <p class="card-text">Brand new Processors with Reasonable price.</p>
                        <a href="product.aspx?categories=Processor" class="btn btn-warning">View</a>
                      </div>
                    </div>
                 </div>
             </div>
         </section>
         <br />
         <br />
         <br />
         <br />
         <hr />

         <section>
             <div class="row mt-5">
                 <div class=" col-md-4 text-center" style="    padding-left: 80px;">
                     <div class="card" style="width: 18rem; ">
                      <img class="card-img-top mx-auto d-block" style="width:100px; height:100px;" src="asset/images/shipping-icon.png" alt="Card image cap">
                      <div class="card-body">
                        <p class="card-text">ALL OVER INDIA SHIPPING</p>
                      </div>
                    </div>
                 </div>
                 <div class=" col-md-4 text-center "style="    padding-left: 80px;">
                     <div class="card" style="width: 18rem;">
                      <img class="card-img-top mx-auto d-block" style="width:100px; height:100px;" src="asset/images/compeprice-icon.png" alt="Card image cap">
                      <div class="card-body">
                        <p class="card-text">COMPETITIVE PRICE</p>
                      </div>
                    </div>
                 </div>
                 <div class=" col-md-4 text-center"style="    padding-left: 80px;">
                     <div class="card" style="width: 18rem; ">
                      <img class="card-img-top mx-auto d-block" style="width:100px; height:100px;" src="asset/images/experts-icons.png" alt="Card image cap">
                      <div class="card-body">
                        <p class="card-text">EXPERTS IN PC BUILDING</p>
                      </div>
                    </div>
                 </div>
            </div>
         </section>
          <br />
         <br />
         <br />
         <br />
         <hr />

    </section>
    
     <section class="section" id="recently_added">
        <div class="row justify-content-center">
            <div class="col-md-1"></div>
            <div class="col-md-10">
                <div >
                    <h1 class="text-center">About Us</h1>
                    <br />
                    <br />
                    <p class="text-center">We at COMPIFY (www.compify.in) pride in completing 25 years of our existence. Known in the IT market as a innovator of technology, Our Journey has truly been justified to our name.</p>
                    <p class="text-center">COMPIFY is dedicated to 100% customer delight ensuring that everything from placing your order to delivering it right to your doorstep is smooth and hassle-free. When it comes to online transactions, COMPIFY ensures that all credit/debit card and net banking transactions are done through secure and trusted gateways. All your bank details are safe and secure, and will not be shared with any third-party.</p>
                    <p class="text-center">COMPIFY is one of the leading IT distribution companies in KARNATAKA operating since its inception in 1993.</p>
                    <p class="text-center">The company is heading to provide full range of PC components to all customers through its wide sales channels</p>
                </div>
            </div>
            <div class="col-md-1"></div>
        </div>
        <br />
        <br />
        <br />
        <br />
    </section>



    
    <!-- #include file="includes/footer.aspx" -->
    <!-- #include file="includes/javascripts.aspx" -->
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
