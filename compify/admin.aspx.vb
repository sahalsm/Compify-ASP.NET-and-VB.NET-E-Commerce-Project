Imports System.Data.SqlClient
Public Class admin
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection
    Dim cmd As New SqlCommand
    Dim constring As String = "Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\Sahal\Compify\compify\compify\App_Data\Compify.mdf;Integrated Security=True"
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("role") = 1 Or Session("role") Is Nothing Then
            Session("message") = "Login to proceed"
            Session("status") = "warning"
            Response.Redirect("login.aspx")
        End If
        con = New SqlConnection(constring)
        con.Open()
        cmd.Connection = con
        cmd.CommandText = "SELECT COUNT(id) As tusers FROM users "

        Dim sda As SqlDataAdapter = New SqlDataAdapter(cmd)
        Dim table As DataTable = New DataTable()
        sda.Fill(table)

        If (table.Rows.Count > 0) Then
            Dim dr As SqlDataReader
            dr = cmd.ExecuteReader
            Do While dr.Read
                Label4.Text = dr("tusers")
            Loop
            dr.Close()
        End If
        con.Close()



        con = New SqlConnection(constring)
        con.Open()
        cmd.Connection = con
        cmd.CommandText = "SELECT COUNT(product_id) As tproduct FROM product "

        sda.Fill(table)

        If (table.Rows.Count > 0) Then
            Dim dr As SqlDataReader
            dr = cmd.ExecuteReader
            Do While dr.Read
                Label1.Text = dr("tproduct")
            Loop
            dr.Close()
        End If
        con.Close()




        con.Close()
        con = New SqlConnection(constring)
        con.Open()
        cmd.Connection = con
        cmd.CommandText = "SELECT COUNT(coupon_Id) As tcoupon FROM coupons "

        sda.Fill(table)

        If (table.Rows.Count > 0) Then
            Dim dr As SqlDataReader
            dr = cmd.ExecuteReader
            Do While dr.Read
                Label3.Text = dr("tcoupon")
            Loop
            dr.Close()
        End If
        con.Close()





        con.Close()
        con = New SqlConnection(constring)
        con.Open()
        cmd.Connection = con
        cmd.CommandText = "SELECT COUNT(DISTINCT order_id) As torder FROM orders "

        sda.Fill(table)

        If (table.Rows.Count > 0) Then
            Dim dr As SqlDataReader
            dr = cmd.ExecuteReader
            Do While dr.Read
                Label2.Text = dr("torder")
            Loop
            dr.Close()
        End If
        con.Close()
    End Sub


End Class