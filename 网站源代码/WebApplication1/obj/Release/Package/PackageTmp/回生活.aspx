<%@ Page Title="" Language="C#" MasterPageFile="~/母回答.master" AutoEventWireup="true" CodeBehind="回生活.aspx.cs" Inherits="WebApplication1.回生活" %>
<asp:Content ID="Content1" ContentPlaceHolderID="muhuida" runat="server">
    <div class="container" style="background-color:gainsboro">
	<div class="row clearfix  ">
        <script type="text/javascript" src="js/JQuery.js"></script>
		<script type="text/javascript">
            $(function () {
                $("li").mousemove(function () {
                    $(this).find("button").addClass("text-info");
                    $(this).siblings().find("button").removeClass("text-info");    // .siblings() 返回被选元素的所有同级元素（其余）。
                });
            });
            //$(function () {
            //    $("button").mousemove(function () {
            //        $(this).addClass("text-info");
            //        $(this).siblings().removeClass("text-info");    // .siblings() 返回被选元素的所有同级元素（其余）。
            //    });
            //});
        </script>
		<div class="col-12 column  border-bottom ">
			<div class="mt-3 " style="background-color:white;border:1px solid white;border-radius:5px">
				<div class=" p-2 " >
                    <div style="border-bottom: 2px solid gainsboro;" class=" p-2 " >
						<asp:DataList ID="DataList1" runat="server" Width="100%" OnItemCommand="DataList1_ItemCommand" onitemdatabound="DataList1_ItemDataBound">
							<ItemTemplate >
								<div style="border-bottom:2px solid #737373;">
									<h4>
										<asp:Label ID="lbComment" runat="server" Text='<%# Eval("Comment") %>'></asp:Label>
									</h4>
								
									<div class="text-right m-2" style="color:#737373;font-size:12px">
										<asp:Label ID="lbtime" runat="server" Text='<%# Eval("time") %>' ></asp:Label>
									</div>
									<div style="color:#737373">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-dots" viewBox="0 0 16 16">
											<path d="M5 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
											<path d="m2.165 15.803.02-.004c1.83-.363 2.948-.842 3.468-1.105A9.06 9.06 0 0 0 8 15c4.418 0 
												8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6a10.437 10.437 0 0 1-.524 2.318l-.003.011a10.722 10.722 
												0 0 1-.244.637c-.079.186.074.394.273.362a21.673 21.673 0 0 0 .693-.125zm.8-3.108a1 1 0 0 0-.287-.801C1.618 10.83 1 9.468 1 
												8c0-3.192 3.004-6 7-6s7 2.808 7 6c0 3.193-3.004 6-7 6a8.06 8.06 0 0 1-2.088-.272 1 1 0 0 0-.711.074c-.387.196-1.24.57-2.634.893a10.97 10.97 0 0 0 .398-2z"/>
										</svg>
										<asp:Label ID="lbchat" runat="server" Text='<%# Eval("ReplyNum") %>'></asp:Label>			<%--这里还没搞定的，首先要默认为0，然后会更改--%>
									</div>
									<div class="row justify-content-end mb-1" style="text-align:right">
										<div class="col-1">
											<asp:Panel ID="Panel1" runat="server">
													<asp:Button ID="Button1" runat="server" Text="刷新" style="float:right" class="btn btn-outline-success  btn-sm" CommandName="shuaxin" />
											</asp:Panel>
										</div>
										<div class="col-1">
											<asp:Panel ID="Panel2" runat="server" Visible="false">
												<button class="btn btn-outline-info  btn-sm" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasBottom" aria-controls="offcanvasBottom" style="float:right;white-space: nowrap">确认</button>
											</asp:Panel>
										</div>
									</div>
								</div>
								<asp:Label ID="lbID" runat="server" Text='<%# Eval("CommentID") %>' style="display:none;" ></asp:Label>
							</ItemTemplate>
							<FooterTemplate>
								<nav aria-label="Page navigation example">

									<ul class="pagination pagination-sm justify-content-end ">
										<li class="page-item">
											 <asp:LinkButton style="color:black" class="page-link" ID="lnkbtnFirst" runat="server" CommandName="first" >&larr; 首页</asp:LinkButton>

										</li>
										<li class="page-item" >
											<asp:LinkButton style="color:black" class="page-link"  ID="lnkbtnFront" runat="server" CommandName="pre">上一页</asp:LinkButton>
										</li>
										<li class="page-item">
											<a class="page-link">
											<asp:Label style="color:black" ID="labNowPage" runat="server" Text="1"></asp:Label>
											</a>
										</li>
										<li class="page-item">
											<asp:LinkButton style="color:black" class="page-link" ID="lnkbtnNext" runat="server" CommandName="next">下一页</asp:LinkButton>
										</li>
										<li class="page-item">
											<asp:LinkButton style="color:black" class="page-link" ID="lnkbtnLast" runat="server"  CommandName="last">尾页 &rarr;</asp:LinkButton>
										</li>
										<li class="page-item">
											<a style="color:black" class="page-link">
												总共
											<asp:Label ID="labCount" runat="server"  Width="12px" Text="1"></asp:Label>
												页
											</a>
										</li>
									</ul>
								</nav>
							</FooterTemplate>
						</asp:DataList>
						<div class="offcanvas offcanvas-bottom" data-bs-scroll="true" tabindex="-1" id="offcanvasBottom" aria-labelledby="offcanvasBottomLabel">
						  <div class="offcanvas-header">
							<h5 class="offcanvas-title" id="offcanvasBottomLabel">回复</h5>
							<button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
						  </div>
						  <div class="offcanvas-body small">
							  <asp:DataList ID="DataList2" runat="server" >
								  <ItemTemplate >
									  <div class="row clearfix  ">
										<div class="col-4 column   ">
											<div  style="background-color:white;border:1px solid white;border-radius:3px">
												<div class=" p-2 ">
													<img ID="Image1" runat="server" src="images/yonghu.jpg" style="width:25px;height:25px; -moz-border-radius:50%;-webkit-border-radius:50%"  />	
													<asp:Label ID="lbUser" runat="server" Text='<%# Eval("UserName") %>' style="font-size:16px"></asp:Label>&nbsp;
												</div>
											</div>
										</div>
										<div class="col-8">
											<asp:Label ID="lbReply" runat="server" Text='<%# Eval("Reply") %>'></asp:Label>
										</div>
									  </div>
									  <div class="text-right m-2" style="color:#737373;font-size:12px">
										<asp:Label ID="lbtime" runat="server" Text='<%# Eval("time") %>' ></asp:Label>
									  </div>
								  </ItemTemplate>
							  </asp:DataList>
						  </div>
						</div>
					</div>
<%--					<div style="border-bottom: 2px solid gainsboro;" class=" p-2 " >
						asd
					</div>--%>
				</div>
			</div>
		</div>
	</div>
   
	</div>
</asp:Content>
