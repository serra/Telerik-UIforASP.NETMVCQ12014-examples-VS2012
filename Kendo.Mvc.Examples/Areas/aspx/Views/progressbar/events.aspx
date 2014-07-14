﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/Web.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
<div id="example" class="k-content">
    <div class="demo-section">
        <h3 class="title">ProgressBar</h3>
        <%= Html.Kendo().ProgressBar()
              .Name("progressBar")
              .Min(0)
              .Max(10)
              .Type(ProgressBarType.Percent)
              .Events(e => {
                  e.Change("onChange");
                  e.Complete("onComplete");
              })
        %>
        <button id="startProgress" class="k-button">Start progress</button>
    </div>
    <div class="demo-section">
        <h3 class="title">Console log</h3>
        <div class="console"></div>
    </div>
    <script>
        function onChange(e) {
            kendoConsole.log("Change event :: value is " + e.value);
        }

        function onComplete(e) {
            kendoConsole.log("Complete event :: value is " + e.value);

            $("#startProgress").text("Restart Progress").removeClass("k-state-disabled");
        }

        $("#startProgress").click(function () {
            if (!$(this).hasClass("k-state-disabled")) {
                $(this).addClass("k-state-disabled");
                progress();
            }
        });

        function progress() {
            var pb = $("#progressBar").data("kendoProgressBar");
            pb.value(0);

            var interval = setInterval(function () {
                if (pb.value() < 10) {
                    pb.value(pb.value() + 1);
                } else {
                    clearInterval(interval);
                }
            }, 100);
        }
    </script>

    <style scoped>
        #progressBar {
            width: 440px;
            margin-bottom: 10px;
        }
        .demo-section {
            width: 500px;
            text-align: center;
        }
        .console {
            margin: 0;
        }
    </style> 
</div>
</asp:Content>