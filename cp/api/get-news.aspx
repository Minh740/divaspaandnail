<%@ Page Language="C#" AutoEventWireup="true" CodeFile="get-news.aspx.cs" Inherits="api_get_news" %>

<%for (int i = 0; i < list.Count; i++)
  { %>

<div class="item">
    <div class="pageTitle" style="display: block; padding: 0 20px; font-size: 62px; font-weight: 500; color: #ff006e; font-family: 'Tangerine', cursive; text-align: center;">
        <%=list[i].NewsName %>
    </div>
    <div class="item-page-content">
        <div class="pageNarrative">
            <p><%=list[i].NewsContent %></p>
        </div>
    </div>
    </div>
    <%} %>
