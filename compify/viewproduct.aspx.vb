Imports System.Data
Imports System.Data.SqlClient
Public Class viewproduct
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection
    Dim con1 As New SqlConnection
    Dim con2 As New SqlConnection
    Dim cmd As New SqlCommand
    Dim cmd1 As New SqlCommand
    Dim cmd2 As New SqlCommand
    Dim constring As String = "Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\Sahal\Compify\compify\compify\App_Data\Compify.mdf;Integrated Security=True"
    Dim name As String
    Dim product As String
    Dim pqty As Integer

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        product = Request.QueryString("name")

        If product = Nothing Then
            Response.Redirect("home.aspx")
        Else

            name = product

            loadProductDetails()

        End If

    End Sub


    Sub loadProductDetails()
        Try
            con = New SqlConnection(constring)
            con.Open()
            cmd.Connection = con
            cmd.CommandText = "SELECT * FROM product WHERE name = '" + name + "' "

            Dim sda As SqlDataAdapter = New SqlDataAdapter(cmd)
            Dim table As DataTable = New DataTable()
            sda.Fill(table)

            If (table.Rows.Count > 0) Then
                Dim dr As SqlDataReader
                dr = cmd.ExecuteReader
                Do While dr.Read
                    Image1.ImageUrl = dr("image")
                    Label1.Text = dr("name")
                    Label2.Text = dr("description")
                    Label3.Text = dr("price")
                    Label4.Text = dr("product_id")
                    pqty = Val(dr("quantity"))

                    total.Text = Val(Label3.Text) * Val(quantity.SelectedValue)
                Loop



            End If
            con.Close()
            If pqty < 5 And pqty > 0 Then
                Label324.Text = "Available only "
                pqtylab.Text = pqty
            ElseIf pqty <= 0 Then
                pqtylab.Text = "Out of stock"
            End If

        Catch ex As Exception

        End Try
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        If Session("userid") IsNot Nothing Then
            Dim qty As Integer
            con = New SqlConnection(constring)
            con.Open()
            cmd.Connection = con
            cmd.CommandText = "SELECT quantity FROM product WHERE product_id = '" & Label4.Text & "'"
            Dim sda1 As SqlDataAdapter = New SqlDataAdapter(cmd)
            Dim table1 As DataTable = New DataTable()
            sda1.Fill(table1)

            If (table1.Rows.Count > 0) Then
                Dim dr1 As SqlDataReader
                dr1 = cmd.ExecuteReader
                Do While dr1.Read
                    qty = dr1("quantity")
                Loop
                dr1.Close()
            End If
            con.Close()

            con = New SqlConnection(constring)
            con.Open()
            cmd.Connection = con
            Dim total As Integer = Val(Label3.Text) * Val(quantity.SelectedItem.Value)

            cmd.CommandText = "SELECT quantity FROM cart WHERE user_id = '" & Session("userid") & "' AND product_id = '" & Label4.Text & "' AND status = 'PENDING'  "
            Dim sda As SqlDataAdapter = New SqlDataAdapter(cmd)
            Dim table As DataTable = New DataTable()
            sda.Fill(table)

            If (table.Rows.Count > 0) Then
                Dim dr As SqlDataReader
                dr = cmd.ExecuteReader
                Do While dr.Read
                    con1 = New SqlConnection(constring)
                    con1.Open()
                    cmd1.Connection = con1
                    If Val(qty) - Val(quantity.SelectedItem.Value) >= 0 Then
                        cmd1.CommandText = "UPDATE cart SET quantity = '" & quantity.SelectedItem.Value & "',total = '" & total & "',status = 'PENDING' WHERE user_id = '" & Session("userid") & "' AND product_id = '" & Label4.Text & "' "
                        cmd1.ExecuteNonQuery()
                        Session("message") = "Updated cart"
                        Session("status") = "success"
                        Response.Redirect("cart.aspx")
                    Else
                        Session("qty") = "OUT OF STOCK only '" & qty & "' remaining"
                        Session("status") = "warning"
                        Response.Redirect("viewproduct.aspx?name=" + product + "")
                    End If

                    con1.Close()
                Loop


            Else
                con2 = New SqlConnection(constring)
                con2.Open()
                cmd2.Connection = con2
                If Val(qty) - Val(quantity.SelectedItem.Value) >= 0 Then
                    cmd2.CommandText = "INSERT INTO cart(user_id,product_id,quantity,date,total)VALUES('" & Session("userid") & "','" + Label4.Text + "','" + quantity.SelectedItem.Value + "','" + DateTime.Now.ToString("D") + "','" & total & "')"
                    Dim da As New SqlDataAdapter
                    da.InsertCommand = cmd2
                    da.InsertCommand.ExecuteNonQuery()
                    Session("message") = "Added to cart"
                    Session("status") = "success"
                    Response.Redirect("product.aspx")
                Else
                    Session("qty") = "OUT OF STOCK only '" & qty & "' remaining"
                    Session("status") = "warning"
                    Response.Redirect("viewproduct.aspx?name=" + product + "")
                End If

                con2.Close()
            End If




            con.Close()

        Else
            Session("message") = "Login first to add items into cart"
            Session("status") = "warning"
            Response.Redirect("login.aspx")

        End If









    End Sub

End Class