using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
namespace clipMoney.App_Start
{
    public class BundleConfig
    {
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/Script/Bundles").Include(
                "~/bundles/inline.*",
                "~/bundles/polyfills.*",
                "~/bundles/scripts.*",
                "~/bundles/vendor.*",
                "~/bundles/runtime.*",
                "~/bundles/zone.*",
                "~/bundles/main.*",
                "~/bundles/jquery.min.*",
                "~/bundles/popper.min.*",
                "~/bundles/bootstrap.min.*"));
            bundles.Add(new StyleBundle("~/Content/Styles").Include("" +
                "~/bundles/styles.*",
                "~/bundles/bootstrap.min.*"));
        }
    }
}