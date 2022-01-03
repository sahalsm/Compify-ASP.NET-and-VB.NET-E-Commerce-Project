Imports System.Data.SqlClient
Public Class cart
    Inherits System.Web.UI.Page

    Dim con As New SqlConnection
    Dim cmd As New SqlCommand
    Dim constring As String = "Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\Sahal\Compify\compify\compify\App_Data\Compify.mdf;Integrated Security=True"
    Dim editCartId As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("userid") Is Nothing Then
            Session("message") = "Login first to view cart"
            Session("status") = "warning"
            Response.Redirect("Login.aspx")
        End If
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged


        Dim name As String
        Dim quantity As Integer
        name = GridView1.SelectedRow.Cells(2).Text
        quantity = GridView1.SelectedRow.Cells(4).Text
        Response.Redirect("viewproduct.aspx?name=" + name + "")
    End Sub
    '
    Protected Sub GridView1_RowDeleting(sender As Object, e As GridViewDeleteEventArgs) Handles GridView1.RowDeleting
        Dim id As String = GridView1.Rows(e.RowIndex).Cells(0).Text

        '    Try
        con = New SqlConnection(constring)
        con.Open()
        cmd.Connection = con
        cmd.CommandText = "DELETE FROM cart WHERE cart_id = '" & id & "'"
        cmd.ExecuteNonQuery()
        con.Close()

        ' Catch ex As Exception
        '          Session("error") = ex.ToString
        '      Response.Redirect("home.aspx")
        ' End Try
    End Sub



    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        con = New SqlConnection(constring)
        con.Open()
        cmd.Connection = con
        cmd.CommandText = "SELECT * FROM cart WHERE status = 'PENDING' AND user_id = '" & Session("userid") & "'"

        Dim sda As SqlDataAdapter = New SqlDataAdapter(cmd)
        Dim table As DataTable = New DataTable()
        sda.Fill(table)

        If (table.Rows.Count > 0) Then
            Response.Redirect("checkout.aspx")
        Else
            Session("message") = "Add Items to cart first!"
            Session("status") = "warning"
            Response.Redirect("product.aspx")
        End If
        con.Close()
    End Sub

    Protected Sub Button4_Click(sender As Object, e As EventArgs)

    End Sub
End Class