﻿Imports Obout.SuperForm
Imports System.Data
Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web.UI.WebControls
Partial Class SuperForm_vb_commands_editonly
    Inherits System.Web.UI.Page
    Dim SuperForm1 As Obout.SuperForm.SuperForm
    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        SuperForm1 = New SuperForm()
        SuperForm1.ID = "SuperForm1"
        SuperForm1.DataSourceID = "SqlDataSource1"
        SuperForm1.Title = "Order Details"
        SuperForm1.AutoGenerateInsertButton = True
        SuperForm1.AutoGenerateEditButton = True
        SuperForm1.AutoGenerateDeleteButton = True
        Dim keyNames1() As String = {"Order ID"}
        SuperForm1.DataKeyNames = keyNames1
        SuperForm1.AllowPaging = True
        SuperForm1.AllowDataKeysInsert = False
        SuperForm1.DefaultMode = DetailsViewMode.Edit
        AddHandler SuperForm1.ModeChanging, AddressOf SuperForm1_ModeChaning


        SuperForm1Container.Controls.Add(SuperForm1)

    End Sub
    Sub SuperForm1_ModeChaning(ByVal sender As Object, ByVal e As DetailsViewModeEventArgs)

        If e.NewMode = DetailsViewMode.ReadOnly Then

            SuperForm1.DataBind()

        End If

        e.Cancel = True

    End Sub
End Class