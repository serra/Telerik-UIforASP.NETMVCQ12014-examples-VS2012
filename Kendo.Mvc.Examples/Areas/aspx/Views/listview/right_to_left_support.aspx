<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/Web.Master"
Inherits="System.Web.Mvc.ViewPage<IEnumerable<Kendo.Mvc.Examples.Models.ProductViewModel>>" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">

<div class="demo-section k-rtl">

    <script type="text/x-kendo-tmpl" id="template">
        <div class="product">
            <img src="<%=Url.Content("~/content/web/foods/")%>#:ProductID#.jpg" alt="#:ProductName# image" />
            <h3>#:ProductName#</h3>
        </div>
    </script>

    <%: Html.Kendo().ListView<Kendo.Mvc.Examples.Models.ProductViewModel>(Model)
        .Name("listView")
        .TagName("div")
        .ClientTemplateId("template")
        .DataSource(dataSource =>
        {
            dataSource.Read(read => read.Action("Products_Read", "ListView"));
            dataSource.PageSize(12);
        })
        .Pageable()
        .Selectable(selectable => selectable.Mode(ListViewSelectionMode.Multiple))
    %>

</div>

<style scoped>
    .demo-section {
        padding: 15px;
        width: 692px;
    }
    .demo-section h2 {
        font-size: 1.2em;
        margin-bottom: 10px;
        text-transform: uppercase;
    }
    .demo-section .console {
        margin: 0;
    }
    .product
    {
        float: right;
        width: 220px;
        height: 110px;
        margin: 0;
        padding: 5px;
        cursor: pointer;
    }
    .product img
    {
        float: right;
        width: 110px;
        height: 110px;
    }
    .product h3
    {
        margin: 0;
        padding: 10px 10px 0 0;
        font-size: .9em;
        overflow: hidden;
        font-weight: normal;
        float: right;
        max-width: 100px;
        text-transform: uppercase;
    }
    .k-pager-wrap
    {
        border-top: 0;
    }
    .k-listview:after
    {
        content: ".";
        display: block;
        height: 0;
        clear: both;
        visibility: hidden;
    }
    .k-listview
    {
        padding: 0;
        min-width: 690px;
        min-height: 360px;
    }
</style>

</asp:Content>
