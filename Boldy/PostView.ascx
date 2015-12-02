<%@ Control Language="C#" AutoEventWireup="true" EnableViewState="false" Inherits="BlogEngine.Core.Web.Controls.PostViewBase" %>
<%@ Import Namespace="BlogEngine.Core"%>
<% if (Location != ServingLocation.SinglePost){%>
<article class="post post-home" id="post<%=Index %>">
<%} %>
<% if (Location == ServingLocation.SinglePost){%>
<article class="post" id="post<%=Index %>">
<%} %>
    <header class="post-header">
        <h2 class="post-title">
            <a href="<%=Post.RelativeOrAbsoluteLink %>"><%=Server.HtmlEncode(Post.Title) %></a>
        </h2>
        <div class="post-info clearfix">
            <span class="post-date"><i class="icon-calendar"></i><%=Post.DateCreated.ToString("dd MMMM yyyy hh:mm") %></span>
            <span class="post-author"><i class=" icon-user"></i>
                <a href="<%=Utils.AbsoluteWebRoot + "author/" + Utils.RemoveIllegalCharacters(Post.Author) + BlogConfig.FileExtension %>">
               <%=Post.AuthorProfile != null ? Post.AuthorProfile.DisplayName : Post.Author %></a>
             </span>
            <span class="post-category"><i class=" icon-folder"></i><%=CategoryLinks(", ") %></span>
            <a rel="nofollow" class="pull-right post-comment-link" href="<%=Post.RelativeOrAbsoluteLink %>#comment">
                <i class="glyphicon glyphicon-comment"></i>(<%=Post.ApprovedComments.Count %>)
            </a>   
        </div>
    </header>
    <section class="post-body text">
        <asp:PlaceHolder ID="BodyContent" runat="server" />
        <%=AdminLinks %>
    </section>
    <% if (Location == ServingLocation.SinglePost){%>
    <footer class="post-footer">
        <div class="post-tags">
            <i class="icon-tags"></i> <%=TagLinks(", ") %>
        </div>
    </footer>
    <%} %>
</article>