Imports System.Data.SqlClient
Public Class subscribe
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
        con = New SqlConnection(constring)
        Dim userid As Integer = Session("userid")
        con.Open()
        cmd.Connection = con
        cmd.CommandText = "SELECT * FROM users WHERE id = '" & userid & "' "

        Dim sda As SqlDataAdapter = New SqlDataAdapter(cmd)
        Dim table As DataTable = New DataTable()
        sda.Fill(table)

        If (table.Rows.Count > 0) Then
            Dim dr As SqlDataReader
            dr = cmd.ExecuteReader
            Do While dr.Read
                If dr("subscription") = "SUBSCRIBED" Then
                    Session("message") = "Already Subscribed"
                    Session("status") = "Success"
                    Response.Redirect("profile.aspx")
                End If
                If IsDBNull(dr("cardname")) Then
                    Label2.Visible = False

                Else

                    Label2.Visible = True
                    cardname.Text = dr("cardname")
                    cardnumber.Text = dr("cardnumber")
                    expdate.Text = dr("expirydate")
                End If
            Loop
            dr.Close()



        Else

            Response.Redirect("login.aspx")
        End If
        con.Close()
    End Sub





    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        checkvalidate()
        Dim userid As Integer = Session("userid")
        con = New SqlConnection(constring)
        con.Open()
        cmd.Connection = con
        cmd.CommandText = "UPDATE users SET subscription='SUBSCRIBED', cardname='" + cardname.Text + "', cardnumber = '" & cardnumber.Text & "', expirydate = '" + Calendar1.SelectedDate + "' WHERE id = '" & userid & "' "
        cmd.ExecuteNonQuery()
        con.Close()
        Session("subscription") = "SUBSCRIBE"
        Response.Redirect("profile.aspx")
    End Sub

    Sub checkvalidate()
        If cardname.Text = "" Or cardname.Text = "" Or cvv.Text = "" Then
            Session("error") = "Enter All the fieds"
            Session("errorstatus") = "warning"
            Response.Redirect("subscribe.aspx")
        ElseIf Calendar1.SelectedDate <= DateTime.Now Then
            Session("error") = "Enter Valid exipry date"
            Session("errorstatus") = "warning"
            Response.Redirect("subscribe.aspx")
        End If
    End Sub
End Class