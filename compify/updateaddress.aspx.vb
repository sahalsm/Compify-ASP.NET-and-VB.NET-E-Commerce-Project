Imports System.Data.SqlClient
Public Class updateaddress
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
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        checkvalidate()
        Dim userid As Integer = Session("userid")
        con = New SqlConnection(constring)
        con.Open()
        cmd.Connection = con
        cmd.CommandText = "UPDATE users SET address='" + TextBox1.Text + "', city = '" + TextBox2.Text + "' WHERE id = '" & userid & "' "

        cmd.ExecuteNonQuery()

        con.Close()
        Session("message") = "Address Updated"
        Session("status") = "success"
        Response.Redirect("checkout.aspx")
    End Sub

    Sub checkvalidate()
        If TextBox1.Text = "" Or TextBox2.Text = "" Then
            Session("message") = "Enter All the fieds"
            Session("status") = "warning"
            Response.Redirect("updateaddress.aspx")
        End If
    End Sub
End Class