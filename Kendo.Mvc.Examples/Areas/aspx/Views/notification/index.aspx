﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/Web.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">

<%= Html.Kendo().Notification()
    .Name("popupNotification")
%>

<%= Html.Kendo().Notification()
    .Name("staticNotification")
    .AppendTo("#appendto")
%>

        <div class="demo-section">
            <div id="appendto" class="k-block"></div>
            
            <h3>Show notification:</h3>
            <p>
                <button id="showPopupNotification" class="k-button">As a popup at bottom-right</button><br />
                <button id="showStaticNotification" class="k-button">Static in the right panel</button>
            </p>
            
            <h3>Hide notification:</h3>
            <p>
                <button id="hideAllNotifications" class="k-button">Hide All Notifications</button>
            </p>
        </div>
            
        <style>
            .demo-section {
                width: 600px;
                padding: 20px 30px;
            }
            .demo-section:after {
                content: "";
                display: block;
                clear: both;
                height: 0;
            }
            .demo-section p {
                margin: 3px 0 20px;
                line-height: 40px;
            }
            .demo-section .k-button {
                width: 200px;
            }
            #appendto {
                float: right;
                width: 300px;
                height: 170px;
                margin: 1em 0;
                overflow: auto;
            }
        </style>

        <script>
            $(document).ready(function () {
                var popupNotification = $("#popupNotification").data("kendoNotification");
                var staticNotification = $("#staticNotification").data("kendoNotification");

                $("#showPopupNotification").click(function () {
                    var d = new Date();
                    popupNotification.show(kendo.toString(d, 'HH:MM:ss.') + kendo.toString(d.getMilliseconds(), "000"), "error");
                });

                $("#showStaticNotification").click(function () {
                    var d = new Date();
                    staticNotification.show(kendo.toString(d, 'HH:MM:ss.') + kendo.toString(d.getMilliseconds(), "000"), "info");
                    var container = $(staticNotification.options.appendTo);
                    container.scrollTop(container[0].scrollHeight);
                });

                $("#hideAllNotifications").click(function () {
                    popupNotification.hide();
                    staticNotification.hide();
                });
            });
        </script>

</asp:Content>