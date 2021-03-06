﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/Mobile.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<%: Html.Kendo().MobileView()
       .Title("Press to load more")       
       .Content(obj =>          
            Html.Kendo().MobileListView<Kendo.Mvc.Examples.Models.ProductViewModel>()
                .Name("load-more")
                .TemplateId("load-more-template")
                .LoadMore(true)
                .DataSource(dataSource => 
                    dataSource
                        .Read("Scroll_Read", "Mobile_ListView")
                        .PageSize(20)                            
                )
        )   
%>

<script type="text/x-kendo-tmpl" id="load-more-template">
    <div class="product">
        <img src="<%:Url.Content("~/content/web/foods/")%>#=ProductID#.jpg" alt="#=ProductName# image" class="pullImage"/>
        <h3>#:ProductName#</h3>
        <p>#:kendo.toString(UnitPrice, "c")#</p>
    </div>
</script>

<style scoped>
    .product h3 {
        font-size: 1.3em;
        line-height: 1.4em;
        margin: 0;
        padding: .7em 0 0;
        height: 1.3em;
        overflow: hidden;
    }
    .product p {
        font-size: 1em;
        margin: 0;
        padding: .3em 0 0;
    }
    .pullImage {
        width: 64px;
        height: 64px;
        border-radius: 3px;
        float: left;
        margin-right: 1.3em;
    }    
</style>

</asp:Content>
