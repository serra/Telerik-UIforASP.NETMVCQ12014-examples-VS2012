﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/Web.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">

<% Html.Kendo().Editor()
      .Name("editor")
      .HtmlAttributes(new { style = "width: 740px;height:440px" })
      .Events(events => events
          .Change("change")
          .Execute("execute")
          .Select("select")
          .Paste("paste")
       )
       .Value(() =>
           { %>
            &lt;p&gt;
               &lt;img src="<%= Url.Content("~/content/web/editor/kendo-ui-web.png") %>" alt="Editor for ASP.NET MVC logo" style="display:block;margin-left:auto;margin-right:auto;" /&gt;
            &lt;/p&gt;
            &lt;p&gt;
                Kendo UI Editor allows your users to edit HTML in a familiar, user-friendly way.&lt;br /&gt;
                In this version, the Editor provides the core HTML editing engine, which includes basic text formatting, hyperlinks, lists,
                and image handling. The widget &lt;strong&gt;outputs identical HTML&lt;/strong&gt; across all major browsers, follows
                accessibility standards and provides API for content manipulation.
            &lt;/p&gt;
            &lt;p&gt;Features include:&lt;/p&gt;
            &lt;ul&gt;
                &lt;li&gt;Text formatting &amp; alignment&lt;/li&gt;
                &lt;li&gt;Bulleted and numbered lists&lt;/li&gt;
                &lt;li&gt;Hyperlink and image dialogs&lt;/li&gt;
                &lt;li&gt;Cross-browser support&lt;/li&gt;
                &lt;li&gt;Identical HTML output across browsers&lt;/li&gt;
                &lt;li&gt;Gracefully degrades to a &lt;code&gt;textarea&lt;/code&gt; when JavaScript is turned off&lt;/li&gt;
            &lt;/ul&gt;
            &lt;p&gt;
                Read &lt;a href="http://docs.telerik.com/kendo-ui"&gt;more details&lt;/a&gt; or send us your
                &lt;a href="http://www.telerik.com/forums"&gt;feedback&lt;/a&gt;!
            &lt;/p&gt;
      <% })
         .Render();
%>

<script>
    function change(e) {
        kendoConsole.log("change");
    }

    function execute(e) {
        kendoConsole.log("execute command :: " + e.name);
    }

    function select(e) {
        kendoConsole.log("selection change");
    }

    function paste(e) {
        kendoConsole.log("paste");
    }

    function contentLoad(e) {
        kendoConsole.log("Content loaded in <b>"+ $(e.item).find("> .k-link").text() +
                            "</b> and starts with <b>" + $(e.contentElement).text().substr(0, 20) + "...</b>");
    }

    function error(e) {
        kendoConsole.error("Loading failed with " + e.xhr.statusText + " " + e.xhr.status);
    }
</script>

<div class="console"></div>

</asp:Content>