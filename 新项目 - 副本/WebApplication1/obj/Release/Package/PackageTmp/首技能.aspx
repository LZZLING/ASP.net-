<%@ Page Title="" Language="C#" MasterPageFile="~/母首页.master" AutoEventWireup="true" CodeBehind="首技能.aspx.cs" Inherits="WebApplication1.首技能" %>
<asp:Content ID="Content1" ContentPlaceHolderID="mushouye" runat="server">
        <div class="container" style="background-color:gainsboro">
	<div class="row clearfix  ">
        <script type="text/javascript" src="js/JQuery.js"></script>
		<script type="text/javascript">
            $(function () {
                $(".gz").mousemove(function () {
                    $(this).addClass("btn-info");
                    $(this).siblings().removeClass("btn-info");    // .siblings() 返回被选元素的所有同级元素（其余）。
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
					<div style="border-bottom: 2px solid gainsboro;">
						<ul class="nav nav-tabs" id="shougongzuo">
                            <li class="gz nav-item   btn-info btn-sm" >
								<asp:Button ID="b1" runat="server" Text="最新" class="nav-link  " style="color:black" OnClick="b1_Click" />
                                <%--<button id="b1" runat="server"  value="最新" class="nav-link text-primary" style="color:black" >最新</button>--%>
                              
                            </li>
                            <li class="gz nav-item btn-sm">
                                <asp:Button ID="b2" runat="server" Text="最热" class="nav-link " style="color:black" OnClick="b2_Click" />
                            </li>
                            <li class="gz nav-item btn-sm">
                                <asp:Button ID="b3" runat="server" Text="精选" class="nav-link " style="color:black" OnClick="b3_Click" />
                            </li>
                        </ul>
					</div>
                    <div style="border-bottom: 2px solid gainsboro;" class=" p-2 " >
						<asp:DataList ID="DataList1" runat="server" Width="100%" OnItemCommand="DataList1_ItemCommand" onitemdatabound="DataList1_ItemDataBound">
							<ItemTemplate >
								<div style="border-bottom:2px solid #737373;" >
									<h4>
										<asp:Label ID="lbComment" runat="server" Text='<%# Eval("Comment") %>'></asp:Label>
									</h4>
									<button type="button" class="btn  btn-success" style="padding: 3px 5px;font-size: 12px;line-height: 1.5;border-radius: 3px;" >
										<asp:Label ID="lbLable" runat="server" Text="技能" ></asp:Label>
									</button>
									<div class="text-right m-2" style="color:#737373;font-size:12px">
										<asp:Label ID="lbUser" runat="server" Text='<%# Eval("UserName") %>' style="border-right:1px solid #737373;font-size:16px"></asp:Label>&nbsp;
										<asp:Label ID="lbtime" runat="server" Text='<%# Eval("time") %>' ></asp:Label>
									</div>
									<asp:Label ID="lbID" runat="server" Text='<%# Eval("CommentID") %>' style="display:none;" ></asp:Label>
									<div style="color:#737373">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
											<path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 
												5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 
												1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/>
											<path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>
										</svg>
										<asp:Label ID="chakan" runat="server" Text='<%# Eval("ReadNum") %>'></asp:Label>
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-dots" viewBox="0 0 16 16">
											<path d="M5 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
											<path d="m2.165 15.803.02-.004c1.83-.363 2.948-.842 3.468-1.105A9.06 9.06 0 0 0 8 15c4.418 0 
												8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6a10.437 10.437 0 0 1-.524 2.318l-.003.011a10.722 10.722 
												0 0 1-.244.637c-.079.186.074.394.273.362a21.673 21.673 0 0 0 .693-.125zm.8-3.108a1 1 0 0 0-.287-.801C1.618 10.83 1 9.468 1 
												8c0-3.192 3.004-6 7-6s7 2.808 7 6c0 3.193-3.004 6-7 6a8.06 8.06 0 0 1-2.088-.272 1 1 0 0 0-.711.074c-.387.196-1.24.57-2.634.893a10.97 10.97 0 0 0 .398-2z"/>
										</svg>
										<asp:Label ID="lbchat" runat="server" Text='<%# Eval("ReplyNum") %>'></asp:Label>			<%--这里还没搞定的，首先要默认为0，然后会更改--%>
									</div>
									<div class="justify-content-end  mb-1 row" style="text-align:right">
										<div class="col-1">
											<asp:Panel ID="Panel1" runat="server">
												<asp:Button ID="Button1" runat="server" Text="刷新" class="btn btn-outline-success  btn-sm" CommandName="shuaxin" />
											</asp:Panel>
										</div>
										<div class="col-1">
											<asp:Panel ID="Panel2" runat="server" Visible="false">
												<button type="button" class="btn btn-outline-info  btn-sm" data-bs-toggle="modal" data-bs-target="#myModal"  style="float:right;white-space: nowrap">
													确认
												</button>
											</asp:Panel>
										</div>
										
										
									</div>
								</div>
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
						<div class="modal fade " id="myModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
								  <div class="modal-dialog modal-lg modal-dialog-scrollable">
									<div class="modal-content">

									  <!-- 模态框头部 -->
									  <div class="modal-header">
										<h4 class="modal-title">回答</h4>
										<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
									  </div>

									  <!-- 模态框内容 -->
									  <div class="modal-body">
										   <div class="form-group" style="border-bottom:2px solid #d9d9d9 ">
												<asp:DataList ID="DataList2" runat="server" Width="100%"    >
													<ItemTemplate >
														<h4>
															<asp:Label ID="lbReply" runat="server" Text='<%# Eval("Reply") %>'></asp:Label>
														</h4>
														<asp:Label ID="lbUser" runat="server" Text='<%# Eval("UserName") %>' style=""></asp:Label>&nbsp;
														<div class="text-right m-2" style="color:#737373;font-size:12px">
															<asp:Label ID="lbtime" runat="server" Text='<%# Eval("time") %>' ></asp:Label>
														</div>
												
														<div style="color:#737373">
															<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
																<path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 
																	5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 
																	1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/>
																<path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>
															</svg>
															<asp:Label ID="chakan" runat="server" Text="1"></asp:Label>
															<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-dots" viewBox="0 0 16 16">
																<path d="M5 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
																<path d="m2.165 15.803.02-.004c1.83-.363 2.948-.842 3.468-1.105A9.06 9.06 0 0 0 8 15c4.418 0 
																	8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6a10.437 10.437 0 0 1-.524 2.318l-.003.011a10.722 10.722 
																	0 0 1-.244.637c-.079.186.074.394.273.362a21.673 21.673 0 0 0 .693-.125zm.8-3.108a1 1 0 0 0-.287-.801C1.618 10.83 1 9.468 1 
																	8c0-3.192 3.004-6 7-6s7 2.808 7 6c0 3.193-3.004 6-7 6a8.06 8.06 0 0 1-2.088-.272 1 1 0 0 0-.711.074c-.387.196-1.24.57-2.634.893a10.97 10.97 0 0 0 .398-2z"/>
															</svg>
														</div>
													</ItemTemplate>
												</asp:DataList>
										   </div>
										  <div class="form-group m-1">
											<label class="sr-only" style="color:  #739900;" for="email">我来回答!</label>
											<asp:TextBox ID="TextBox1" runat="server" class="form-control"  Height="100px" TextMode="MultiLine" ></asp:TextBox>
											<div style="text-align:right;" class="m-1" >
												<asp:Button ID="Button2" runat="server" class="btn btn-outline-success btn-sm" Text="发表" OnClick="Button2_Click1"  />
											</div>
										  </div>
									  </div>

									  <!-- 模态框底部 -->

									  <div class="modal-footer">
										<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">关闭</button>									  

									  </div>
									</div>
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
