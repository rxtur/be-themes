<%@ Control Language="C#" EnableViewState="False" Inherits="BlogEngine.Core.Web.Controls.CommentViewBase" %>

<div id="id_<%=Comment.Id %>" class="vcard comment<%= Post.Author.Equals(Comment.Author, StringComparison.OrdinalIgnoreCase) ? " self" : "" %>">
    <div class="commentHdrContainer">
	    <div class="commentHdr">
		    <div class="commentHdrContent">
			    <div class="innertube">
                    <%= ReplyToLink %>
                    
                </div>
		    </div>
	    </div>
	    <div class="commentHdrLeftCol">
		    <span class="gvt-img"><%= Gravatar(38)%></span>
	    </div>
	    <div class="commentHdrRightCol">
            <span class="commentAuthor"><%= Comment.Website != null ? "<a href=\"" + Comment.Website + "\" rel=\"nofollow\" class=\"url fn\">" + Comment.Author + "</a>" : "<span class=\"fn\">" +Comment.Author + "</span>" %></span>
            <br/><%= Comment.DateCreated %> <a href="#id_<%=Comment.Id %>">#</a>
	    </div>
    </div>
    <p class="commenttext"><%= Text %></p>
    <%= AdminLinks.StartsWith(" | ") ? AdminLinks.Substring(3, AdminLinks.Length - 3) : AdminLinks %>
    <div class="comment-replies" id="replies_<%=Comment.Id %>" <%= (Comment.Comments.Count == 0) ? " style=\"display:none;\"" : "" %>>
	    <asp:PlaceHolder ID="phSubComments" runat="server" />
    </div>
</div>