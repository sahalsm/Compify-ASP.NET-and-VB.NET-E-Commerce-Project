Imports System.Data
Imports System.Data.SqlClient
Public Class editprofile
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

    Protected Sub update_Click(sender As Object, e As EventArgs) Handles update.Click
        checkvalidate()
        Dim userid As Integer = Session("userid")
        con = New SqlConnection(constring)
        con.Open()
        cmd.Connection = con
        cmd.CommandText = "UPDATE users SET name='" + name.Text + "',email='" + email.Text + "',phone='" + phone.Text + "',address = '" + address.Text + "',city='" + city.Text + "' WHERE id = '" & userid & "' "
        cmd.ExecuteNonQuery()
        con.Close()
        Session("message") = "Updated Successfully"
        Session("status") = "success"
        Response.Redirect("profile.aspx")
    End Sub

    Sub checkvalidate()
        If name.Text = "" Or email.Text = "" Or phone.Text = "" Or city.Text = "" Or address.Text = "" Then
            Session("message") = "Enter All the fieds"
            Session("status") = "warning"
            Response.Redirect("editprofile.aspx")
        End If
    End Sub
End Class