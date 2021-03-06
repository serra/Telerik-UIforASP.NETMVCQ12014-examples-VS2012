﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/Web.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<%: Html.Kendo().Grid<Kendo.Mvc.Examples.Models.OrderViewModel>()
    .Name("grid")
    .Columns(columns =>
    {
        columns.Bound(e => e.OrderID).Filterable(false);
        columns.Bound(e => e.Freight);
        columns.Bound(e => e.OrderDate).Width(120).Format("{0:MM/dd/yyyy}");
        columns.Bound(e => e.ShipName).Width(260);
        columns.Bound(e => e.ShipCity).Width(150);
    })
    .DataSource(dataSource => dataSource
        .Custom()
        .Type("odata")
        .Transport(transport =>
           transport.Read(read => read.Url("http://demos.telerik.com/kendo-ui/service/Northwind.svc/Orders"))
        ) 
        .PageSize(20)
        .ServerPaging(true)
        .ServerSorting(true)
        .ServerFiltering(true)
    )
    .Pageable()
    .Sortable()
    .Filterable()
%>
</asp:Content>
