﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/Web.Master"
         Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="chart-wrapper">
    <%= Html.Kendo().Chart<Kendo.Mvc.Examples.Models.ElectricityProduction>()
        .Name("chart")
        .Title("Spain electricity production (GWh)")
        .Legend(legend => legend
            .Position(ChartLegendPosition.Top)
        )
        .DataSource(ds => ds.Read(read => read.Action("_SpainElectricityProduction", "Area_Charts")))
        .Series(series =>
        {
            series.Area(model => model.Nuclear).Name("Nuclear");
            series.Area(model => model.Hydro).Name("Hydro");
            series.Area(model => model.Wind).Name("Wind");
        })
        .CategoryAxis(axis => axis
            .Categories(model => model.Year)
            .Labels(labels => labels.Rotation(-90))
            .Justify()
            .Crosshair(c => c.Visible(true))
        )
        .ValueAxis(axis => axis.Logarithmic()
            .Labels(labels => labels.Format("{0:N0}"))
        )
        .Tooltip(tooltip => tooltip
            .Visible(true)
            .Shared(true)
            .Format("{0:N0}")
        )
    %>
</div>
</asp:Content>
