<%@ Page Title="" Language="C#" MasterPageFile="~/母个人中心.master" AutoEventWireup="true" CodeBehind="个技能.aspx.cs" Inherits="WebApplication1.个技能" %>
<asp:Content ID="Content1" ContentPlaceHolderID="mugerenzhongxin" runat="server">
    <div class="container" style="background-color:gainsboro">
	<div class="row clearfix  ">
		
		<div class="col-12 column  border-bottom ">
			<div class="mt-3 " style="background-color:white;border:1px solid white;border-radius:5px">
				<div class=" p-2 " >
					<div style="border-bottom: 2px solid gainsboro;">
						<h3>技能</h3>
						<p>在想学的方面深度学习</p>
					</div>
					<div style="border-bottom: 2px solid gainsboro;" class=" p-2 " >
						<asp:DataList ID="DataList1" runat="server" Width="100%" OnItemCommand="DataList1_ItemCommand" onitemdatabound="DataList1_ItemDataBound">
							<ItemTemplate >
								<h4>
									<asp:Label ID="lbComment" runat="server" Text='<%# Eval("Comment") %>'></asp:Label>
								</h4>
								<button type="button" class="btn btn-outline-secondary" style="padding: 3px 5px;font-size: 12px;line-height: 1.5;border-radius: 3px;" >
									<asp:Label ID="lbLable" runat="server" Text="技能" ></asp:Label>
								</button>
								<div class="text-right m-2" style="color:#737373;font-size:12px">
                                    <asp:Label ID="lbtime" runat="server" Text='<%# Eval("time") %>' ></asp:Label>
                                </div>
								<div style="color:#737373">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
										<path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/>
										<path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>
									</svg>
									<asp:Label ID="chakan" runat="server" Text="1"></asp:Label>
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-dots" viewBox="0 0 16 16">
										<path d="M5 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
										<path d="m2.165 15.803.02-.004c1.83-.363 2.948-.842 3.468-1.105A9.06 9.06 0 0 0 8 15c4.418 0 8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6a10.437 10.437 0 0 1-.524 2.318l-.003.011a10.722 10.722 0 0 1-.244.637c-.079.186.074.394.273.362a21.673 21.673 0 0 0 .693-.125zm.8-3.108a1 1 0 0 0-.287-.801C1.618 10.83 1 9.468 1 8c0-3.192 3.004-6 7-6s7 2.808 7 6c0 3.193-3.004 6-7 6a8.06 8.06 0 0 1-2.088-.272 1 1 0 0 0-.711.074c-.387.196-1.24.57-2.634.893a10.97 10.97 0 0 0 .398-2z"/>
									</svg>
									<asp:Label ID="lbchat" runat="server" Text='<%# Eval("ReplyNum") %>'></asp:Label>
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
					</div>
				</div>
			</div>
		</div>
	</div>
    <div class="text-center">
        <p class="mt-5 mb-3 text-muted">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-github" viewBox="0 0 16 16">
                <path d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.012 8.012 0 0 0 16 8c0-4.42-3.58-8-8-8z"/>
            </svg>
                <a href="#" runat="server" style="text-decoration:none;color:#737373">支持项目</a>
            &nbsp;&nbsp;
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-wechat" viewBox="0 0 16 16">
                <path d="M11.176 14.429c-2.665 0-4.826-1.8-4.826-4.018 0-2.22 2.159-4.02 4.824-4.02S16 8.191 16 10.411c0 1.21-.65 2.301-1.666 3.036a.324.324 0 0 0-.12.366l.218.81a.616.616 0 0 1 .029.117.166.166 0 0 1-.162.162.177.177 0 0 1-.092-.03l-1.057-.61a.519.519 0 0 0-.256-.074.509.509 0 0 0-.142.021 5.668 5.668 0 0 1-1.576.22ZM9.064 9.542a.647.647 0 1 0 .557-1 .645.645 0 0 0-.646.647.615.615 0 0 0 .09.353Zm3.232.001a.646.646 0 1 0 .546-1 .645.645 0 0 0-.644.644.627.627 0 0 0 .098.356Z"/>
                <path d="M0 6.826c0 1.455.781 2.765 2.001 3.656a.385.385 0 0 1 .143.439l-.161.6-.1.373a.499.499 0 0 0-.032.14.192.192 0 0 0 .193.193c.039 0 .077-.01.111-.029l1.268-.733a.622.622 0 0 1 .308-.088c.058 0 .116.009.171.025a6.83 6.83 0 0 0 1.625.26 4.45 4.45 0 0 1-.177-1.251c0-2.936 2.785-5.02 5.824-5.02.05 0 .1 0 .15.002C10.587 3.429 8.392 2 5.796 2 2.596 2 0 4.16 0 6.826Zm4.632-1.555a.77.77 0 1 1-1.54 0 .77.77 0 0 1 1.54 0Zm3.875 0a.77.77 0 1 1-1.54 0 .77.77 0 0 1 1.54 0Z"/>
            </svg>
            <a href="#" runat="server" style="text-decoration:none;color:#737373">联系作者</a>
            &nbsp;&nbsp;
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-circle" viewBox="0 0 16 16">
                <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                <path d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z"/>
            </svg>
                <a href="#" runat="server" style="text-decoration:none;color:#737373">免责声明</a>
        </p>
        <p class="mt-3 mb-3 text-muted">&copy; 2022人生指南-GM</p>
    </div>
</div>
</asp:Content>
