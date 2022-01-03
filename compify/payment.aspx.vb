Imports System.Data.SqlClient
Public Class payment
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
        'Try
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
                If IsDBNull(dr("cardname")) Then
                    Label2.Visible = False

                Else
                    Button4.Text = "Add New Card"
                    Label2.Visible = True
                    Label2.Text = dr("cardname")
                    cardname.Text = dr("cardname")
                    cardnumber.Text = dr("cardnumber")
                    Calendar1.SelectedDate = dr("expirydate")
                    '  MsgBox("" + DateTime.Parse(dr("expirydate")) + "")
                End If
            Loop
            dr.Close()



        Else

            Response.Redirect("login.aspx")
        End If
        con.Close()

        ' Catch ex As Exception
        'Session("error") = ex.ToString
        'Response.Redirect("home.aspx")
        ' End Try
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        'Try
        checkvalidate()
        Dim userid As Integer = Session("userid")
        con = New SqlConnection(constring)
        con.Open()
        cmd.Connection = con
        cmd.CommandText = "UPDATE users SET cardname='" + cardname.Text + "', cardnumber = '" + cardnumber.Text + "', expirydate = '" + Calendar1.SelectedDate + "' WHERE id = '" & userid & "' "

        cmd.ExecuteNonQuery()
        Label2.Text = cardname.Text



        con.Close()

        ' Catch ex As Exception
        'Session("error") = ex.ToString
        'Response.Redirect("home.aspx")
        ' End Try
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        If Label2.Text Is Nothing Then
            Session("error") = "Enter the card Details"
            Session("errorstatus") = "warning"
            Response.Redirect("payment.aspx")
        Else

            Session("paymentmethod") = "CARD"
            Response.Redirect("placeorder.aspx")
        End If
    End Sub

    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Session("paymentmethod") = "CASH ON DELIVERY"
        Response.Redirect("placeorder.aspx")
    End Sub

    Sub checkvalidate()
        If cardname.Text = "" Or cardnumber.Text = "" Then
            Session("error") = "Enter the card Details"
            Session("errorstatus") = "warning"
            Response.Redirect("payment.aspx")
        ElseIf Calendar1.SelectedDate <= DateTime.Now Then
            Session("error") = "Enter correct expiry date"
            Session("errorstatus") = "warning"
            Response.Redirect("payment.aspx")
        End If
    End Sub
End Class