Imports System.Data
Imports System.Data.SqlClient
Public Class adminorders
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

    Protected Sub GridView1_RowDeleting(sender As Object, e As GridViewDeleteEventArgs) Handles GridView1.RowDeleting
        Dim id As String = GridView1.Rows(e.RowIndex).Cells(0).Text

        '    Try
        con = New SqlConnection(constring)
        con.Open()
        cmd.Connection = con
        cmd.CommandText = "UPDATE orders SET status = 'DELIVERED' WHERE order_id = '" + id + "'"
        cmd.ExecuteNonQuery()
        con.Close()

    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged
        Dim id As String = GridView1.SelectedRow.Cells(0).Text
        Response.Redirect("viewadminorder.aspx?id=" + id + "")
    End Sub
End Class