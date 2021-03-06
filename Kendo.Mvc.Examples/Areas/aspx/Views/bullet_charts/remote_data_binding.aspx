<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/Web.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<style>
    .chart-wrapper {
        padding-top: 20px;
    }
    
    .chart-wrapper .k-tooltip {
        text-align: left;
    }
</style>
</asp:Content>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <div class="chart-wrapper">
        <%= Html.Kendo().Chart<Kendo.Mvc.Examples.Models.AprilSales>()
                .Name("chart")
                .Legend(false)
                .DataSource(ds => ds.Read(read => read
                    .Action("_AprilSales", "Bullet_Charts")
                ))
                .Series(series => {
                    series.VerticalBullet(
                        model => model.Current,
                        model => model.Target
                    );
                })
                .ValueAxis(axis => axis
                    .Numeric()
                    .Min(2000)
                    .Max(11000)
                    .MajorGridLines(line => line.Visible(false))
                    .MinorTicks(line => line.Visible(true))
                    .PlotBands(bands => {
                        bands.Add().From(1000).To(3000).Color("#aaaaaa").Opacity(0.55);
                        bands.Add().From(3000).To(5000).Color("#aaaaaa").Opacity(0.4);
                        bands.Add().From(5000).To(8000).Color("#aaaaaa").Opacity(0.25);
                        bands.Add().From(8000).To(11000).Color("#aaaaaa").Opacity(0.1);
                    })
                )
                .CategoryAxis(axis => axis
                    .Categories(model => model.Category)
                    .MajorGridLines(line => line.Visible(false))
                )
                .Tooltip(tooltip => tooltip
                    .Visible(true)
                    .Template("Target: #= value.target # items<br /> Actual: #= value.current # items")
                )
       %>
    </div>
</asp:Content>