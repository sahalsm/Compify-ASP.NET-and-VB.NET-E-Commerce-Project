Imports System.Data.SqlClient
Public Class checkout
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection
    Dim cmd As New SqlCommand
    Dim constring As String = "Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\Sahal\Compify\compify\compify\App_Data\Compify.mdf;Integrated Security=True"
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("userid") Is Nothing Then
            Session("message") = "Login to proceed"
            Session("status") = "warning"
            Response.Redirect("Login.aspx")
        End If
        Session("itemstotal") = 0
        'Try
        con = New SqlConnection(constring)
        con.Open()
        cmd.Connection = con
        Dim user As Integer = Session("userid")
        cmd.CommandText = "SELECT product.price, cart.quantity FROM cart INNER JOIN product On cart.product_id = product.product_id INNER JOIN users On cart.user_id = users.Id WHERE (cart.status = 'PENDING') And (cart.user_id = '" & user & "') ORDER BY cart.Date"

        Dim sda As SqlDataAdapter = New SqlDataAdapter(cmd)
        Dim table As DataTable = New DataTable()
        sda.Fill(table)

        If (table.Rows.Count > 0) Then
            Dim dr As SqlDataReader
            dr = cmd.ExecuteReader
            Do While dr.Read
                Session("itemstotal") = Val(Session("itemstotal")) + (dr("price") * dr("quantity"))
                Session("total") = Val(Session("itemstotal")) + 150
            Loop
            dr.Close()



        Else

            Response.Redirect("login.aspx")
        End If
        con.Close()


        con = New SqlConnection(constring)
        con.Open()
        cmd.Connection = con
        cmd.CommandText = "SELECT couponcode,price FROM coupons WHERE availablefor='" + Session("subscription") + "'"
        Dim sda1 As SqlDataAdapter = New SqlDataAdapter(cmd)
        Dim table1 As DataTable = New DataTable()
        sda1.Fill(table1)

        If (table1.Rows.Count > 0) Then
            Dim dr1 As SqlDataReader
            dr1 = cmd.ExecuteReader
            Do While dr1.Read
                DropDownList1.Items.Add(New ListItem("" + dr1("couponcode") + "", "" & dr1("price") & ""))

            Loop
            dr1.Close()



        Else

            Response.Redirect("login.aspx")
        End If
        con.Close()
        ' Catch ex As Exception
        'Session("error") = ex.ToString
        'Response.Redirect("home.aspx")
        ' End Try








    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Session("coupons") = DropDownList1.SelectedValue
        Response.Redirect("payment.aspx")
    End Sub

End Class