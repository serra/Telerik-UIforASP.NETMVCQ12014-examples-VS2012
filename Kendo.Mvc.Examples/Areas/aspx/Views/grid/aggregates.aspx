<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/Web.Master" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">

<%: Html.Kendo().Grid<Kendo.Mvc.Examples.Models.ProductViewModel>()
    .Name("Grid")
        .Columns(columns =>
        {
            columns.Bound(p => p.ProductName)
                .ClientFooterTemplate("Total Count: #=count#")
                .ClientGroupFooterTemplate("Count: #=count#");        
            columns.Bound(p => p.UnitPrice).Format("{0:C}");
            columns.Bound(p => p.UnitsOnOrder)
                .ClientFooterTemplate("Average: #=average#")
                .ClientGroupFooterTemplate("Average: #=average#");
            columns.Bound(p => p.UnitsInStock)
                .ClientGroupHeaderTemplate("Units In Stock: #= value # (Count: #= count#)")
                .ClientFooterTemplate("<div>Min: #= min #</div><div>Max: #= max #</div>");
        })
        .Pageable()    
        .Sortable()        
        .DataSource(dataSource => dataSource
            .Ajax()
            .Aggregates(aggregates =>
            {
                aggregates.Add(p => p.UnitsInStock).Min().Max().Count();
                aggregates.Add(p => p.UnitsOnOrder).Average();
                aggregates.Add(p => p.ProductName).Count();
                aggregates.Add(p => p.UnitPrice).Sum();
            })
            .Group(groups => groups.Add(p => p.UnitsInStock))
            .Read(read => read.Action("Aggregates_Read", "Grid"))
        )
    %>
</asp:Content>