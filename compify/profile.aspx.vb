Imports System.Data
Imports System.Data.SqlClient
Public Class profile
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
        If Session("subscription") = "SUBSCRIBE" Then
            Button1.Visible = True
        End If

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Response.Redirect("subscribe.aspx")
    End Sub

    Protected Sub edit_Click(sender As Object, e As EventArgs) Handles edit.Click
        Response.Redirect("editprofile.aspx")
    End Sub
End Class