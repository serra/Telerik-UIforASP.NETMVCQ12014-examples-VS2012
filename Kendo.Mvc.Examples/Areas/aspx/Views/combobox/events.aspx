<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/Web.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
<div class="demo-section">
    <h3 class="title">Select item
    </h3>
    <%= Html.Kendo().ComboBox()
            .Name("combobox")
            .DataTextField("Text")
            .DataValueField("Value")
            .BindTo(new List<SelectListItem>()
            {
                new SelectListItem() {
                    Text = "Item 1", Value = "1"  
                },
                new SelectListItem() {
                    Text = "Item 2", Value = "2"  
                },
                new SelectListItem() {
                    Text = "Item 3", Value = "3"  
                }
            })
            .Events(e =>
            {
                e.Change("onChange").Select("onSelect").Open("onOpen").Close("onClose").DataBound("onDataBound");
            })
    %>
</div>
<div class="demo-section">
    <h3 class="title">Console log
    </h3>
    <div class="console"></div>
</div>
<script>
    function onOpen() {
        kendoConsole.log("event: open");
    };

    function onClose() {
        kendoConsole.log("event: close");
    };

    function onChange() {
        kendoConsole.log("event: change");
    };

    function onDataBound() {
        kendoConsole.log("event: dataBound");
    };

    function onSelect(e) {
        if ("kendoConsole" in window) {
            var dataItem = this.dataItem(e.item.index());
            kendoConsole.log("event :: select (" + dataItem.Text + " : " + dataItem.Value + ")");
        }
    };
</script>
<style scoped>
    .demo-section {
        width: 500px;
        text-align: center;
    }
    .console {
        margin: 0;
    }
</style>  
</asp:Content>