using System.Collections.Generic;
using System.Web.Mvc;
using Kendo.Mvc.Examples.Models;
using Kendo.Mvc.Extensions;
using Kendo.Mvc.UI;
using System.Linq;

namespace Kendo.Mvc.Examples.Controllers
{
    public partial class GridController : Controller
    {
        public ActionResult Filter_Menu_Customization()
        {            
            return View();
        }

        public ActionResult FilterMenuCustomization_Read([DataSourceRequest] DataSourceRequest request)
        {
            return Json(GetEmployees().ToDataSourceResult(request));
        }

        public ActionResult FilterMenuCustomization_Cities()
        {
            var db = new SampleEntities();
            return Json(db.Employees.Select(e => e.City).Distinct(), JsonRequestBehavior.AllowGet);
        }

        public ActionResult FilterMenuCustomization_Titles()
        {
            // How can I bind the filterValue more elegantly?
            // Can I use Kendo.Mvc.Infrastructure.FilterDescriptorFactory? How?
            var filterValue = Request.QueryString["filter[filters][0][value]"];
            var db = new SampleEntities();
            var employeeTitles = db.Employees
                                   .Select(e => e.Title)
                                   .Where(t => t.StartsWith(filterValue))
                                   .Distinct();
            return Json(employeeTitles, JsonRequestBehavior.AllowGet);
        } 
    }
}
