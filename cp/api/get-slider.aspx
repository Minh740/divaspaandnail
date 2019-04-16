<%@ Page Language="C#" AutoEventWireup="true" CodeFile="get-slider.aspx.cs" Inherits="api_get_slider" %>

 
<div id="owl-slider" class="owl-carousel text-center">
   <%for (int i = 0; i < listslide.Count; i++)
      { %>
    
        <div class="item <%=i==0? "active":"" %>">
            <img src="http://reward.tuscript.com/upload/slider/slider_<%=listslide[i].SliderID %>.jpg" />
        </div>
    
   <%} %>
</div>
 
