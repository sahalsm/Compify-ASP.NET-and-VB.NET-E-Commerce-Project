Public Class product
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim category As String = Request.QueryString("categories")
        Dim brand As String = Request.QueryString("brand")

        If category = Nothing Then
            DataList1.Visible = False

            If brand = Nothing Then
                DataList3.Visible = False
            Else
                DataList2.Visible = False
            End If
        Else
                DataList2.Visible = False
        End If



    End Sub

    Protected Sub DataList1_ItemCommand(source As Object, e As DataListCommandEventArgs) Handles DataList1.ItemCommand
        If (e.CommandName = "viewproduct") Then
            Response.Redirect("viewproduct.aspx?name=" & e.CommandArgument & "")
        End If
    End Sub

    Protected Sub DataList2_ItemCommand(source As Object, e As DataListCommandEventArgs) Handles DataList2.ItemCommand
        If (e.CommandName = "viewproduct") Then
            Response.Redirect("viewproduct.aspx?name=" & e.CommandArgument & "")
        End If
    End Sub


End Class