<%@ Control Language="C#" AutoEventWireup="true" EnableViewState="false" Inherits="BlogEngine.Core.Web.Controls.PostViewBase" %>
<div class="postItem">
    <h1><a href="<%=Post.RelativeLink %>"><%=Server.HtmlEncode(Post.Title) %></a></h1>
    <div class="meta">
	<%=Post.DateCreated.ToString("d. MMMM yyyy HH:mm") %> by <a href="<%=VirtualPathUtility.ToAbsolute("~/") + "author/" + BlogEngine.Core.Utils.RemoveIllegalCharacters(Post.Author) %>.aspx"><%=Post.AuthorProfile != null ? Post.AuthorProfile.DisplayName : Post.Author %></a>
	in <%=CategoryLinks(", ") %>&nbsp;&nbsp;//&nbsp;&nbsp;Tags: <%=TagLinks(", ") %>&nbsp;&nbsp;//&nbsp;&nbsp;
    <% if (BlogEngine.Core.BlogSettings.Instance.ModerationType == BlogEngine.Core.BlogSettings.Moderation.Disqus)
       { %>
    <a rel="nofollow" href="<%=Post.PermaLink %>#disqus_thread"><%=Resources.labels.comments %></a>
    <%}
       else
       { %>
    <a rel="nofollow" href="<%=Post.RelativeLink %>#comment"><%=Resources.labels.comments %> (<%=Post.ApprovedComments.Count %>)</a>   
    <%} %>
    </div>
    <asp:PlaceHolder ID="BodyContent" runat="server" />
    <div class="adminLinks">
        <%=AdminLinks %>
    </div>
</div>