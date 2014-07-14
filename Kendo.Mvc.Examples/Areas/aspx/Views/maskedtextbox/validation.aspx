<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/Web.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">

<div class="demo-section">
    <form id="employeeForm" data-role="validator" novalidate="novalidate">
        <h3>Employee</h3>
        <ul>
            <li>
                <label for="FirstName">First Name:</label>
                <input type="text" class="k-textbox" name="FirstName" id="FirstName" required="required" />
            </li>
            <li>
                <label for="LastName">Last Name:</label>
                <input type="text" class="k-textbox" name="LastName" id="LastName" required="required" />
            </li>
            <li>
                <label for="PhoneNumber">Phone Number:</label>
                <%= Html.Kendo().MaskedTextBox()
                      .Name("PhoneNumber")
                      .Mask("(999) 000-0000")
                      .HtmlAttributes(new {
                        data_validmask_msg = "Phone number is incomplete",
                        required = "required"
                      })
                %>
                <span data-for='PhoneNumber' class='k-invalid-msg'></span>
            </li>
            <li class="actions">
                <button type="button" data-role="button" data-sprite-css-class="k-icon k-i-tick" data-click='save'>Save</button>
            </li>
        </ul>
    </form>
</div>

<script type="text/javascript">
    $(function () {
        var container = $("#employeeForm");
        kendo.init(container);
        container.kendoValidator({
            rules: {
                validmask: function (input) {
                    if (input.is("[data-validmask-msg]") && input.val() != "") {
                        var maskedtextbox = input.data("kendoMaskedTextBox");
                        return maskedtextbox.value().indexOf(maskedtextbox.options.promptChar) === -1;
                    }

                    return true;
                }
            }
        });
    });

    function save(e) {
        var validator = $("#employeeForm").data("kendoValidator");
        if (validator.validate()) {
            alert("Employee Saved");
        }
    }

</script>

<style scoped>

    #employeeForm ul {
        list-style-type: none;
        margin: 0;
        padding: 0;
    }

    #employeeForm li {
        margin-top: 10px;
    }

    label {
        display: inline-block;
        padding-right: 3px;
        width: 66px;
    }

    span.k-tooltip {
        margin-left: 6px;
    }

    .demo-section {
        padding: 30px;
        width: 500px;
    }

    .actions {
        padding-left: 72px;
        padding-top: 10px;
    }
</style>
</asp:Content>