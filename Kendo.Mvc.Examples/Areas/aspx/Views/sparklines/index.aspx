﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/Web.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
<div class="chart-wrapper">
    <div class="climate">
        <h1>
            Climate control history
        </h1>
        <table class="history">
            <tr>
                <td class="item">Pressure</td>
                <td class="spark">
                    <%= Html.Kendo().Sparkline().Data(ViewBag.PressureData).Name("press-log") %>
                </td>
                <td class="value">980<span>mb</span></td>
            </tr>
            <tr>
                <td class="item">Temperature</td>
                <td class="spark">
                    <%= Html.Kendo().Sparkline()
                            .Name("temp-log")
                            .Type(SparklineType.Column)
                            .Tooltip(tooltip => tooltip.Format("{0} &deg;C"))
                            .Data(ViewBag.TemperatureData)
                    %>
                </td>
                <td class="value">21<span>&deg;C</span></td>
            </tr>
            <tr>
                <td class="item">Humidity</td>
                <td class="spark">
                    <%= Html.Kendo().Sparkline()
                            .Name("hum-log")
                            .Type(SparklineType.Area)
                            .Tooltip(tooltip => tooltip.Format("{0} %"))
                            .Data(ViewBag.HumidityData)
                    %>
                </td>
                <td class="value">32<span>%</span></td>
            </tr>
        </table>
    </div>
    <div class="temperature">
        <h1>
            Temperature control
        </h1>
        <div class="stats">
            <%= Html.Kendo().Sparkline()
                    .Name("temp-range")        
                    .Type(SparklineType.Bullet)
                    .ValueAxis(axis => axis
                        .Numeric()
                        .Min(0)
                        .Max(30)
                        .PlotBands(bands => {
                            bands.Add().From(0).To(15).Color("#787878").Opacity(0.15);
                            bands.Add().From(15).To(22).Color("#787878").Opacity(0.3);
                            bands.Add().From(22).To(30).Color("#787878").Opacity(0.15);
                        })
                    )
                    .Data(ViewBag.TemperatureRange)
            %>
        </div>
    </div>
    <div class="conditioner">
        <h1>
            Conditioner working time
        </h1>
        <ul class="pie-list stats">
            <li>MON <%= Html.Kendo().Sparkline().Type(SparklineType.Pie).Data(ViewBag.ACStats["mon"]).Name("stats-mon")%></li>
            <li>TUE <%= Html.Kendo().Sparkline().Type(SparklineType.Pie).Data(ViewBag.ACStats["tue"]).Name("stats-tue")%></li>
            <li>WED <%= Html.Kendo().Sparkline().Type(SparklineType.Pie).Data(ViewBag.ACStats["wed"]).Name("stats-wed")%></li>
            <li>THU <%= Html.Kendo().Sparkline().Type(SparklineType.Pie).Data(ViewBag.ACStats["thu"]).Name("stats-thu")%></li>
            <li>FRI <%= Html.Kendo().Sparkline().Type(SparklineType.Pie).Data(ViewBag.ACStats["fri"]).Name("stats-fri")%></li>
            <li>SAT <%= Html.Kendo().Sparkline().Type(SparklineType.Pie).Data(ViewBag.ACStats["sat"]).Name("stats-sat")%></li>
            <li>SUN <%= Html.Kendo().Sparkline().Type(SparklineType.Pie).Data(ViewBag.ACStats["sun"]).Name("stats-sun")%></li>
        </ul>
    </div>
</div>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .chart-wrapper {
            width: 480px;
            height: 100%;
            margin: 0 auto 30px auto;
            padding: 0 0 30px 0;
            font-weight: bold;
            text-transform: uppercase;
        }
        .climate, .temperature, .conditioner {
            margin: 0 30px;
            padding: 30px 0 0 0;
        }
        h1 {
            margin-bottom: 20px;
            font-size: 1.2em;
        }
        .history {
            border-collapse: collapse;
            width: 100%;
        }
        .history td {
            padding: 0;
        }
        .history td.item {
            text-align: right;
            line-height: normal;
            vertical-align: bottom;
        }
        .history td.spark {
            text-align: center;
            line-height: 50px;
            padding: 0 5px;
        }
        .history td.value {
            font-size: 2em;
            font-weight: normal;
            line-height: normal;
            vertical-align: bottom;
        }
        .history td.value span {
            font-size: .5em;
            vertical-align: top;
        }
        .stats {
            text-align: center;
        }
        .pie-list {
            margin: 0;
            padding: 0;
            list-style-type: none;
        }
        .pie-list li {
            display: inline-block;
            width: 54px;
        }
        #stats-mon,
        #stats-tue,
        #stats-wed,
        #stats-thu,
        #stats-fri,
        #stats-sat,
        #stats-sun {
            display: block;
            width: 54px;
            line-height: 50px;
        }
        #temp-range {
            width: 400px;
            line-height: 50px;
        }
    </style>
</asp:Content>
