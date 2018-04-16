﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" 
         Inherits="Dashboard_LoadCustomSettings_Web.WebForm1" %>

<%@ Register Assembly="DevExpress.Dashboard.v15.1.Web, Version=15.1.5.0, 
                                                       Culture=neutral, 
                                                       PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.DashboardWeb" TagPrefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <script>

        function OnItemWidgetCreated(e) {
            if (e.ItemName == "chartDashboardItem1") {
                var chart = e.GetWidget();
                chart.option({
                    legend: {
                        font: { size: webViewer.cpChartFontSize }
                    }
                });                
            }
        }
    </script>
    <form id="form1" runat="server">
    <div>
        <dx:ASPxDashboardViewer ID="ASPxDashboardViewer1" runat="server" 
            ClientInstanceName="webViewer"
            ClientSideEvents-ItemWidgetCreated='function(s, e) { OnItemWidgetCreated(e); }'
            OnCustomJSProperties="DashboardViewer_CustomJSProperties" 
            DashboardSource="~/App_Data/Dashboard.xml" Height="600px" Width="1200px"
            onconfiguredataconnection="ASPxDashboardViewer1_ConfigureDataConnection">
        </dx:ASPxDashboardViewer>
    </div>
    </form>
</body>
</html>
