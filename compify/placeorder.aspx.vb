Imports System.Data.SqlClient
Imports System.IO
Public Class placeorder
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection
    Dim con1 As New SqlConnection
    Dim cmd As New SqlCommand
    Dim cmd1 As New SqlCommand
    Dim order_id As Integer
    Dim constring As String = "Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\Sahal\Compify\compify\compify\App_Data\Compify.mdf;Integrated Security=True"
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("userid") Is Nothing Then
            Session("message") = "Login to proceed"
            Session("status") = "warning"
            Response.Redirect("Login.aspx")
        End If
        Label2.Text = Session("name")
        deliverydate.Text = DateTime.Now.AddDays(4).ToString("D")
        itemsprice.Text = Session("itemstotal")
        delivery.Text = "150"
        coupon.Text = Session("coupons")
        If Session("coupons") Is Nothing Then
            coupon.Text = "None"
        End If

        total.Text = Val(Session("total")) - Val(Session("coupons"))

        '  Try
        con = New SqlConnection(constring)
        con.Open()
        cmd.Connection = con
        Dim userid As Integer = Session("userid")
        cmd.CommandText = "SELECT * FROM users WHERE id = '" & userid & "' "

        Dim sda As SqlDataAdapter = New SqlDataAdapter(cmd)
        Dim table As DataTable = New DataTable()
        sda.Fill(table)

        If (table.Rows.Count > 0) Then
            Dim dr As SqlDataReader
            dr = cmd.ExecuteReader
            Do While dr.Read
                If IsDBNull(dr("address")) Then
                    Response.Redirect("updateaddress.aspx")
                End If

                Address.Text = dr("address")
                City.Text = dr("city")
                PhoneNumber.Text = dr("phone")
                If Session("paymentmethod") = "CARD" Then
                    cardname.Text = dr("cardname")
                    cardnumber.Text = dr("cardnumber")
                    expdate.Text = dr("expirydate")
                End If

                paymentmethod.Text = Session("paymentmethod")
            Loop
            dr.Close()

        Else
            Session("message") = "error"
            Session("status") = "error"
            Response.Redirect("home.aspx")
        End If
        con.Close()

        ' Catch ex As Exception
        '    Session("message") = "Some Error"
        '    Session("status") = "error"
        '     Response.Redirect("home.aspx")
        '   End Try
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        If cvv.Text.Length < 3 Or cvv.Text.Length > 3 Or Not IsNumeric(cvv.Text) Then
            Session("error") = "Enter valid CVV"
            Session("errorstatus") = "error"
            Response.Redirect("placeorder.aspx")
        End If
        order()
    End Sub

    Sub order()
        'Try
        findOrderId()
        Dim userid As Integer = Session("userid")
        con = New SqlConnection(constring)
        con.Open()
            cmd.Connection = con
        cmd.CommandText = "SELECT * FROM cart WHERE user_id = '" & Session("userid") & "' AND status = 'PENDING'"

        Dim sda As SqlDataAdapter = New SqlDataAdapter(cmd)
            Dim table As DataTable = New DataTable()
            sda.Fill(table)

        If (table.Rows.Count > 0) Then
            Dim dr1 As SqlDataReader
            Dim da As New SqlDataAdapter
            con1 = New SqlConnection(constring)



            dr1 = cmd.ExecuteReader
            Do While dr1.Read
                Dim product_id As Integer = Val(dr1("product_id"))
                Dim quantity As Integer = Val(dr1("quantity"))


                Dim coupon_id As Integer = Val(1)
                con1.Open()
                cmd1.Connection = con1
                cmd1.CommandText = "INSERT INTO orders(order_id,user_id,product_id,coupon_id,quantity,total,date,arrivedate,paymentmethod)VALUES(" & order_id & " , " & userid & " , " & product_id & " , " & coupon_id & " , " & quantity & " , " & total.Text & " , '" + DateTime.Now.ToString("D") + "' , '" + DateTime.Now.AddDays(4).ToString("D") + "' , '" + paymentmethod.Text + "' )"
                cmd1.ExecuteNonQuery()
                con1.Close()
                removequantity(product_id, quantity)

            Loop

            dr1.Close()
            Session("message") = "Order Placed!"
            Session("status") = "success"
            updatecart()
            Response.Redirect("product.aspx")


        Else
            Session("message") = "Oops, Something went wrong"
            Session("status") = "error"
            Response.Redirect("product.aspx")

        End If



            con.Close()
        ' Catch ex As Exception
        'Session("error") = ex.ToString
        'Response.Redirect("home.aspx")
        ' End Try
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        order()
    End Sub

    Sub findOrderId()
        con = New SqlConnection(constring)
        con.Open()
        cmd.Connection = con
        cmd.CommandText = "SELECT TOP 1 order_id FROM orders ORDER BY id DESC"

        Dim sda As SqlDataAdapter = New SqlDataAdapter(cmd)
        Dim table As DataTable = New DataTable()
        sda.Fill(table)

        If (table.Rows.Count > 0) Then
            Dim dr1 As SqlDataReader
            dr1 = cmd.ExecuteReader
            Do While dr1.Read
                order_id = Val(dr1("order_id")) + 1
            Loop
            dr1.Close()
        Else
            order_id = 1

        End If



        con.Close()
    End Sub

    Sub removequantity(product_id As Integer, quantity As Integer)
        con = New SqlConnection(constring)
        con.Open()
        cmd.Connection = con
        cmd.CommandText = "SELECT quantity FROM product WHERE product_id = '" & product_id & "'"
        Dim sda As SqlDataAdapter = New SqlDataAdapter(cmd)
        Dim table As DataTable = New DataTable()
        sda.Fill(table)

        If (table.Rows.Count > 0) Then
            Dim dr1 As SqlDataReader
            dr1 = cmd.ExecuteReader
            Do While dr1.Read
                quantity = Val(dr1("quantity")) - Val(quantity)
            Loop
            dr1.Close()
        End If
        con.Close()

        con = New SqlConnection(constring)
        con.Open()
        cmd.Connection = con
        cmd.CommandText = "UPDATE product SET quantity = '" & quantity & "' WHERE product_id = '" & product_id & "'"
        cmd.ExecuteNonQuery()
        con.Close()
    End Sub

    Sub updatecart()
        con = New SqlConnection(constring)
        con.Open()
        cmd.Connection = con
        cmd.CommandText = "UPDATE cart SET status = 'ORDERED' WHERE user_id = '" & Session("userid") & "'"
        cmd.ExecuteNonQuery()
        con.Close()
    End Sub


End Class