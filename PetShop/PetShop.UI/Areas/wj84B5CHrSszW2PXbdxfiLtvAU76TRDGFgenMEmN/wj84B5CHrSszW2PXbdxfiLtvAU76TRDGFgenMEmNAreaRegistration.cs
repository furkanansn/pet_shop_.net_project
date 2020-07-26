using System.Web.Mvc;

namespace PetShop.UI.Areas.wj84B5CHrSszW2PXbdxfiLtvAU76TRDGFgenMEmN
{
    public class wj84B5CHrSszW2PXbdxfiLtvAU76TRDGFgenMEmNAreaRegistration : AreaRegistration 
    {
        public override string AreaName 
        {
            get 
            {
                return "wj84B5CHrSszW2PXbdxfiLtvAU76TRDGFgenMEmN";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context) 
        {
            context.MapRoute(
                "wj84B5CHrSszW2PXbdxfiLtvAU76TRDGFgenMEmN_default",
                "wj84B5CHrSszW2PXbdxfiLtvAU76TRDGFgenMEmN/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}