﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/Web.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">

<%= Html.Kendo().Notification()
    .Name("notification")
    .Width("12em")
    .Templates(t =>
    {
        t.Add().Type("time").ClientTemplate("<div style='padding: .6em 1em'>Time is: <span class='timeWrap'>#: time #</span></div>");
    })
%>

<div class="demo-section">
    <p>
        <button id="showNotification" class="k-button">Show notification</button>

        <button id="hideAllNotifications" class="k-button">Hide All Notifications</button>
    </p>
</div>
            
<script>
    $(document).ready(function () {

        var notification = $("#notification").data("kendoNotification");

        $("#showNotification").click(function () {
            var d = new Date();
            notification.show({ time: kendo.toString(d, 'HH:MM:ss.') + kendo.toString(d.getMilliseconds(), "000") }, "time");
        });

        $("#hideAllNotifications").click(function () {
            notification.hide();
        });
    });
</script>

</asp:Content>