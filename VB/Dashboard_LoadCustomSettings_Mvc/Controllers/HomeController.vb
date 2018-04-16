﻿Imports System.Web.Mvc
Imports DevExpress.DashboardWeb.Mvc
Imports DevExpress.DataAccess.ConnectionParameters

Namespace Dashboard_LoadCustomSettings_Mvc.Controllers
    Public Class HomeController
        Inherits Controller

        Public Function Index() As ActionResult
            Return View()
        End Function

        <ValidateInput(False)> _
        Public Function DashboardViewerPartial() As ActionResult
            Return PartialView("_DashboardViewerPartial", DashboardViewerSettings.Model)
        End Function
        Public Function DashboardViewerPartialExport() As FileStreamResult
            Return DashboardViewerExtension.Export("DashboardViewer", DashboardViewerSettings.Model)
        End Function
    End Class
    Friend Class DashboardViewerSettings
        Public Shared ReadOnly Property Model() As DashboardSourceModel
            Get
                Return DashboardSourceModel()
            End Get
        End Property

        Private Shared Function DashboardSourceModel() As DashboardSourceModel

            Dim model_Renamed As New DashboardSourceModel()
            model_Renamed.DashboardSource = "App_Data/Dashboard.xml"
            model_Renamed.ConfigureDataConnection = Sub(sender, e)
                If e.ConnectionName = "nwindConnection" Then
                    Dim parameters As Access97ConnectionParameters = 
                        CType(e.ConnectionParameters, Access97ConnectionParameters)
                    Dim databasePath As String = 
                        System.Web.HttpContext.Current.Server.MapPath("~\App_Data\nwind.mdb")
                    parameters.FileName = databasePath
                End If
            End Sub
            Return model_Renamed
        End Function
    End Class
End Namespace