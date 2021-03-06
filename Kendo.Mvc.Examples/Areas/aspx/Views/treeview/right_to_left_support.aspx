<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/Web.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="k-rtl">

    <div class="demo-section">
        <%=Html.Kendo().TreeView()
            .Name("treeview")
            .Items(treeview =>
            {
                treeview.Add().Text("My Web Site")
                    .SpriteCssClasses("folder")
                    .Expanded(true)
                    .Items(root =>
                    {
                        root.Add().Text("images")
                            .Expanded(true)
                            .SpriteCssClasses("folder")
                            .Items(images =>
                            {
                                images.Add().Text("logo.png")
                                    .SpriteCssClasses("image");

                                images.Add().Text("body-back.png")
                                    .SpriteCssClasses("image");

                                images.Add().Text("my-photo.jpg")
                                    .SpriteCssClasses("image");
                            });

                        root.Add().Text("resources")
                            .Expanded(true)
                            .SpriteCssClasses("folder")
                            .Items(resources =>
                            {
                                resources.Add().Text("pdf")
                                    .Expanded(true)
                                    .SpriteCssClasses("folder")
                                    .Items(pdf =>
                                    {
                                        pdf.Add().Text("brochure.pdf")
                                            .SpriteCssClasses("pdf");

                                        pdf.Add().Text("prices.pdf")
                                            .SpriteCssClasses("pdf");
                                    });

                                resources.Add().Text("zip")
                                    .SpriteCssClasses("folder");
                            });

                        root.Add().Text("about.html")
                            .SpriteCssClasses("html");

                        root.Add().Text("contacts.html")
                            .SpriteCssClasses("html");

                        root.Add().Text("index.html")
                            .SpriteCssClasses("html");

                        root.Add().Text("portfolio.html")
                            .SpriteCssClasses("html");
                    });
            })
        %>
    </div>

</div>

<style scoped>
    .demo-section {
        width: 200px;
    }

    #treeview .k-sprite {
        background-image: url("<%=Url.Content("~/Content/web/treeview/coloricons-sprite.png")%>");
    }

    .rootfolder { background-position: 0 0; }
    .folder { background-position: 0 -16px; }
    .pdf { background-position: 0 -32px; }
    .html { background-position: 0 -48px; }
    .image { background-position: 0 -64px; }

</style>

</asp:Content>