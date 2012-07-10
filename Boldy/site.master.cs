using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;

public partial class StandardSite : System.Web.UI.MasterPage
{
  protected void Page_Load(object sender, EventArgs e)
  {
      Page.Header.DataBind();
  }

  public static string ResolveUrl(string url)
  {
      return BlogEngine.Core.Utils.ApplicationRelativeWebRoot + url;
  }
}
