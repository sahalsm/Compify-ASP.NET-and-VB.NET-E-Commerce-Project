Imports System.Data.SqlClient
Public Class addcoupons
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
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        '  Try
        checkvalidate()
        con = New SqlConnection(constring)
        con.Open()
        cmd.Connection = con
        cmd.CommandText = "INSERT INTO coupons(price,couponcode,availablefor)VALUES(" & TextBox1.Text & ",'" + TextBox2.Text + "','" + DropDownList1.SelectedValue.ToString + "')"

        Dim da As New SqlDataAdapter
        da.InsertCommand = cmd
        da.InsertCommand.ExecuteNonQuery()
        con.Close()
        Session("message") = "Coupon Added Successfully"
        Session("status") = "success"
        Response.Redirect("addcoupons.aspx")
        '   Catch ex As Exception
        '   Session("error") = ex.ToString
        '   Response.Redirect("home.aspx")
        '  End Try
    End Sub
    Sub checkvalidate()
        If TextBox1.Text = "" Or TextBox2.Text = "" Then
            Session("error") = "Enter All the fieds"
            Session("errorstatus") = "warning"
            Response.Redirect("addcoupons.aspx")
        End If
    End Sub
End Class