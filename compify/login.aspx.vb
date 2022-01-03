Imports System.Data
Imports System.Data.SqlClient
Public Class login
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection
    Dim cmd As New SqlCommand
    Dim constring As String = "Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\Sahal\Compify\compify\compify\App_Data\Compify.mdf;Integrated Security=True"
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Response.Redirect("register.aspx")
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        checkvalidation()
        con = New SqlConnection(constring)
        con.Open()
        cmd.Connection = con
        cmd.CommandText = "SELECT * FROM users WHERE email = '" + TextBox1.Text + "' AND password = '" + TextBox2.Text + "'"

        Dim sda As SqlDataAdapter = New SqlDataAdapter(cmd)
        Dim table As DataTable = New DataTable()
        sda.Fill(table)

        If (table.Rows.Count > 0) Then
            Dim dr As SqlDataReader
            dr = cmd.ExecuteReader
            Do While dr.Read
                Session("userid") = dr("id")
                Session("role") = dr("role")
                Session("subscription") = dr("subscription")
                Session("name") = dr("name")
            Loop
            dr.Close()
            TextBox1.Text = ""
            TextBox2.Text = ""
            Session("message") = "Logged In Successfully"
            Session("status") = "success"
            If Session("role") = 1 Then
                Response.Redirect("home.aspx")
            Else
                Response.Redirect("admin.aspx")
            End If

        Else
            TextBox1.Text = ""
            TextBox2.Text = ""
            Session("userid") = Nothing
            Session("role") = Nothing
            Session("name") = Nothing
            Session("message") = "Wrong Password or Gmail!"
            Session("status") = "error"
            Response.Redirect("login.aspx")
        End If
        con.Close()


    End Sub
    Sub checkvalidation()
        If TextBox1.Text = "" Or TextBox2.Text = "" Then
            Session("message") = "Enter All the fieds"
            Session("status") = "warning"
            Response.Redirect("login.aspx")
        End If
    End Sub
End Class