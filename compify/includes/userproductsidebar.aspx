<!-- Page Wrapper -->
     <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="home.aspx">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">Compify</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="#">
                    <i class="fa fa-boxes"></i>
                    <span>Products</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Category
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fa fa-braille"></i>
                    <span>Category</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Manage Products</h6>
                        <a class="dropdown-item" href="product.aspx?categories=Graphics Card">Graphics Card</a>
                        <a class="dropdown-item" href="product.aspx?categories=HDD">HDD</a>
                        <a class="dropdown-item" href="product.aspx?categories=CPU Panel">CPU Panel</a>
                        <a class="dropdown-item" href="product.aspx?categories=Keyboard">Keyboard</a>
                        <a class="dropdown-item" href="product.aspx?categories=Motherboard">Motherboard</a>
                        <a class="dropdown-item" href="product.aspx?categories=Mouse">Mouse</a>
                        <a class="dropdown-item" href="product.aspx?categories=Monitor">Monitor</a>
                        <a class="dropdown-item" href="product.aspx?categories=Power Supply">Power Supply</a>
                        <a class="dropdown-item" href="product.aspx?categories=Processor">Processor</a>
                        <a class="dropdown-item" href="product.aspx?categories=RAM">RAM</a>
                        <a class="dropdown-item" href="product.aspx?categories=SSD">SSD</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseThree"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fa fa fa-bullhorn"></i>
                    <span>Brand</span>
                </a>
                <div id="collapseThree" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Manage Products</h6>
                        <a class="dropdown-item" href="product.aspx?brand=Acer">Acer</a>
                        <a class="dropdown-item" href="product.aspx?brand=Dell">Dell</a>
                        <a class="dropdown-item" href="product.aspx?brand=Intel">Intel</a>
                        <a class="dropdown-item" href="product.aspx?brand=Ryzen">Ryzen</a>
                        <a class="dropdown-item" href="product.aspx?brand=ASUS">Asus</a>
                        <a class="dropdown-item" href="product.aspx?brand=HP">HP</a>
                        <a class="dropdown-item" href="product.aspx?brand=Red Gear">RedGear</a>
                        <a class="dropdown-item" href="product.aspx?brand=Zotac">Zotac</a>
                        <a class="dropdown-item" href="product.aspx?brand=samsung">Samsung</a>
                        <a class="dropdown-item" href="product.aspx?brand=gamdias">Gamidas</a>
                      
                    </div>
                </div>
            </li>

           

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Personal
            </div>

            <!-- Nav Item - Pages Collapse Menu -->

            <li class="nav-item">
                <a class="nav-link" href="cart.aspx">
                    <i class="fa fa-shopping-cart"></i>
                    <span>Cart</span></a>
            </li>
            
            <li class="nav-item">
                <a class="nav-link" href="orders.aspx">
                    <i class="fa fa-shopping-cart"></i>
                    <span>Orders</span></a>
            </li>

            <!-- Nav Item - Charts -->
            <li class="nav-item">
                <a class="nav-link" href="profile.aspx">
                    <i class="fa fa-user"></i>
                    <span><%=Session("name") %></span></a>
            </li>

            <!-- Nav Item - Tables -->
          
            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <li class="nav-item">
                <a class="nav-link" href="logout.aspx"
                    <i class="fa fa-sign-out-alt"></i>
                    <span>Logout</span></a>
            </li>
            

        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">