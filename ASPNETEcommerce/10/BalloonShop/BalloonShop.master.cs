﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BalloonShop : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        PayPalViewCart.NavigateUrl = Link.ToPayPalViewCart();
            //
    }
}
