<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="placeorder.aspx.vb" Inherits="compify.placeorder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>place order</title>
       <!-- #include file="includes/acss.aspx" -->
</head>
<body>
    <!-- #include file="includes/userproductsidebar.aspx" -->
    <form id="form1" runat="server">
        <div class="row mt-5">

            <div class="col-md-1"></div>
            <div class="col-md-6">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Review Your Order"></asp:Label>
                    <div class="card w-75 mt-5">
                          <div class="card-body">
                              <h5 class="card-title">Reveiw</h5>
                              <div class="row">
                                  <div class="col-md-6">
                                       <h6>Shipping Address</h6>
                                       <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label><br />
                                       <asp:Label ID="Address" runat="server" Text="Label"></asp:Label><br />
                                       <asp:Label ID="City" runat="server" Text="Label"></asp:Label><br />
                                       <asp:Label ID="PhoneNumber" runat="server" Text="Label"></asp:Label><br />
                                  </div> 
                                  <div class="col-md-6">
                                       <h6>Payment Method</h6>
                                         <asp:Label ID="paymentmethod" runat="server" Text="Label"></asp:Label><br />
                                  </div>
                                 
                                   
                              </div>
                          </div>
                    </div>
                    <div class="card w-75 mt-5">
                          <div class="card-body">
                            <h5 class="card-title">Delivery Date</h5>
                             <asp:Label ID="deliverydate" runat="server" Text="Label"></asp:Label><br />
                          </div>
                    </div>
            </div>
            <div class="col-md-5">
                <div class="card w-50 mt-5">
                      <div class="card-body">
                        <h5 class="card-title">Order Summary</h5>
                          <div class ="row">
                            <div class="col-md-6">
                                 <asp:Label ID="Label3" runat="server" Text="Items"></asp:Label><br />
                                <asp:Label ID="Label4" runat="server" Text="Delivery"></asp:Label><br />
                                <asp:Label ID="Label5" runat="server" Text="Coupon"></asp:Label><hr />
                                <asp:Label ID="Label6" runat="server" Text="Total"></asp:Label><br />
                            </div>
                          <div class="col-md-6">
                              <asp:Label ID="itemsprice" runat="server" Text="Label"></asp:Label><br />
                                <asp:Label ID="delivery" runat="server" Text="Label"></asp:Label><br />
                                <asp:Label ID="coupon" runat="server" Text="Label"></asp:Label><hr />
                                <asp:Label ID="total" runat="server" Text="Label"></asp:Label><br />
                            </div>
                              </div>
                                
                                <p>
                                     <% if Session("paymentmethod") Is "CARD" Then  %>
                                                   <asp:LinkButton ID="Button4" CssClass="btn btn-warning" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample"  runat="server" Text="Place Your Order" />
                                         <% Else  %>
                                              <asp:Button ID="Button2" CssClass="btn btn-warning"  runat="server" Text="Place Your Order" /> 

                                         <% End If %>
                            
                        </p>
                           <div class="collapse" id="collapseExample">
                              <div class="card card-body">
                                   
                                          <div class="mb-3">
                                                <label for="exampleInputEmail1" class="form-label">Card Name</label>
                                                <asp:TextBox ID="cardname" class="form-control" runat="server" ReadOnly="True"></asp:TextBox>
                                          </div>
                                          <div class="mb-3">
                                                <label for="exampleInputPassword1" class="form-label">Card Number</label>
                                                 <asp:TextBox ID="cardnumber" class="form-control" runat="server" ReadOnly="True"></asp:TextBox>
                                                 <div id="emailHelp" class="form-text">We'll never share your Card Details with anyone else.</div>
                                          </div>
                                          <div class="mb-3">
                                                <label for="exampleInputPassword1" class="form-label">Expiry Date</label>
                                                 <asp:TextBox ID="expdate" placeholder="MM/YY" class="form-control" runat="server" ReadOnly="True" ></asp:TextBox>
                                          </div>
                                          <div class="mb-3">
                                                <label for="exampleInputPassword1" class="form-label">CVV</label>
                                                 <asp:TextBox ID="cvv" class="form-control" runat="server" TextMode="Password" required="true" MaxLength="3"  ></asp:TextBox>
                                          </div>
                                          <asp:Button ID="Button1" CssClass="btn btn-warning"  runat="server" Text="Place Your Order" /> 
                                     
                              </div>
                            </div>
                      </div>
                    </div>
            </div>



            






        </div>
    </form>





    
          <!-- #include file="includes/javascripts.aspx" -->
        <!-- #include file="includes/ajs.aspx" -->
     <script>
         <% If Session("error") IsNot Nothing Then %>
         swal("<%=Session("error") %>", "", "<%=Session("errorstatus") %>");
         <% End If %>
         <% Session("error") = Nothing
         Session("errorstatus") = Nothing%>
     </script>
</body>
</html>
