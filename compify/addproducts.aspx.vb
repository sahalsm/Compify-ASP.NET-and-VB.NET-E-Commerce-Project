Imports System.IO
Imports System.Data.SqlClient
Public Class addproducts
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

    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Dim folderPath As String = Server.MapPath("~/Files/")

        'Check whether Directory (Folder) exists.
        If Not Directory.Exists(folderPath) Then
            'If Directory (Folder) does not exists Create it.
            Directory.CreateDirectory(folderPath)
        End If

        'Save the File to the Directory (Folder).
        pimage.SaveAs(folderPath & Path.GetFileName(pimage.FileName))

        'Display the Picture in Image control.
        Image1.ImageUrl = "~/Files/" & Path.GetFileName(pimage.FileName)
    End Sub

    Protected Sub psubmit_Click(sender As Object, e As EventArgs) Handles psubmit.Click
        checkvalidate()
        Try

            con = New SqlConnection(constring)
            con.Open()
            cmd.Connection = con
            Dim total As Integer
            Dim date1 As Date = Date.Now.Date
            Dim path As String = ""

            total = Val(pprice.Text) * Val(pquantity.Text)


            cmd.CommandText = "INSERT INTO product(name,category,brand,description,price,quantity,total,image,date)VALUES('" + pname.Text + "','" + pcategories.Text + "','" + pbrands.Text + "','" + pdescription.Text + "','" + pprice.Text + "','" + pquantity.Text + "','" & total & "','" & Image1.ImageUrl.ToString & "','" + DateTime.Now.ToString("D") + "' )"


            Dim da As New SqlDataAdapter
            da.InsertCommand = cmd
            da.InsertCommand.ExecuteNonQuery()
            con.Close()
            Session("message") = "Product Added Successfully"
            Session("status") = "success"
            Response.Redirect("addproducts.aspx")

        Catch ex As Exception
            Session("error") = ex.ToString
            Response.Redirect("addproducts.aspx")
        End Try

        If Session("error") Is Nothing Then
            Response.Redirect("addproducts.aspx")

        End If
    End Sub
    Sub checkvalidate()
        If pname.Text = "" Or pprice.Text = "" Or pquantity.Text = "" Or pdescription.Text = "" Or Image1.ImageUrl = Nothing Then
            Session("error") = "Enter All the fieds"
            Session("errorstatus") = "warning"
            Response.Redirect("addproducts.aspx")
        End If
    End Sub
End Class



'Dim ms As New MemoryStream
'Dim img() As Byte
'img = dt(0)(4)
'Dim ms As New MemoryStream(img)
'PictureBox1.Image = Image.FromStream(ms)