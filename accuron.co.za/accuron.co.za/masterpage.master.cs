using System;
using System.Web.UI;

public partial class masterpage : MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.MaintainScrollPositionOnPostBack = true;
    }
}
