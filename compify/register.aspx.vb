Imports System.Data.SqlClient
Public Class register
    Inherits System.Web.UI.Page

    Dim con As New SqlConnection
    Dim cmd As New SqlCommand
    Dim constring As String = "Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\Sahal\Compify\compify\compify\App_Data\Compify.mdf;Integrated Security=True"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        checkvalidation()
        con = New SqlConnection(constring)
        con.Open()
        cmd.Connection = con
        cmd.CommandText = "INSERT INTO users(name,email,phone,password)VALUES('" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox5.Text + "','" + TextBox3.Text + "')"

        Dim da As New SqlDataAdapter
        da.InsertCommand = cmd
        If da.InsertCommand.ExecuteNonQuery() Then
            Session("message") = "Registered Successfully"
            Session("status") = "success"
            Response.Redirect("login.aspx")
        Else
            Session("message") = "Oops, Something went wrong!"
            Session("status") = "error"
            Response.Redirect("home.aspx")
        End If
        con.Close()






    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        TextBox1.Text = ""
        TextBox2.Text = ""
        TextBox3.Text = ""
        TextBox4.Text = ""
        TextBox5.Text = ""

    End Sub

    Sub checkvalidation()
        If TextBox1.Text = "" Or TextBox2.Text = "" Or TextBox3.Text = "" Or TextBox4.Text = "" Or TextBox5.Text = "" Then
            Session("error") = "Enter All the fieds"
            Session("errorstatus") = "warning"
            Response.Redirect("register.aspx")
        ElseIf TextBox3.Text <> TextBox4.Text Then
            Session("error") = "Enter correct password"
            Session("errorstatus") = "warning"
            Response.Redirect("register.aspx")
        ElseIf TextBox5.Text.Length < 10 Or TextBox5.Text.Length > 10 Then
            Session("error") = "Enter correct phone number"
            Session("errorstatus") = "warning"
            Response.Redirect("register.aspx")
        End If
    End Sub


End Class