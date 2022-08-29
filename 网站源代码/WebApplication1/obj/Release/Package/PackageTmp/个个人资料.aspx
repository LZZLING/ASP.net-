<%@ Page Title="" Language="C#" MasterPageFile="~/母个人中心.master" AutoEventWireup="true" CodeBehind="个个人资料.aspx.cs" Inherits="WebApplication1.个个人资料" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mugerenzhongxin" runat="server">
		<div class="container" style="background-color:gainsboro">
			<div class="row clearfix  ">
				<div class="col-12 column  border-bottom ">
					<div class="mt-3 " style="background-color:white;border:1px solid white;border-radius:3px">
						<div class=" p-2 ">
							<img ID="Image1" runat="server" src="images/yonghu.jpg" style="width:75px;height:75px; -moz-border-radius:50%;-webkit-border-radius:50%"  />	
							<asp:Label ID="Label1" runat="server" Text=""  Font-Size="35px"></asp:Label>
							<p class=" text-muted">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;暂无个人简介</p>
								
						</div>
							
					</div>
				</div>

				<div class="col-12 column  border-bottom ">
					<div class="mt-3 " style="background-color:white;border:1px solid white;border-radius:5px">
						<div class=" p-2 ">
							<table class="table table-borderless">
                                <thead>
                                        <tr style="border-bottom: 2px solid gainsboro;">
                                            <td ><h3>信息</h3></td>

                                            <td colspan="5" style="text-align:right">
                                                
                                                <h6>
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                                                      <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                                      <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                                                    </svg>
                                                    <a runat="server" data-bs-toggle="modal" data-bs-target="#m1" style="text-decoration:none;color:cornflowerblue;text-align:right">修改</a>
                                                </h6>
                                                <div class="modal fade" id="m1" tabindex="-1" aria-labelledby="1" aria-hidden="true">
                                                  <div class="modal-dialog">
                                                    <div class="modal-content">
                                                      <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabel">修改信息</h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                      </div>
                                                      <div class="modal-body">
                                                        <table class="table table-borderless">
                                                            <tbody>
                                                                <tr>
                                                                    <td>性别</td>
                                                                    <td>
                                                                        <asp:TextBox ID="TSex" runat="server"></asp:TextBox>
                                                                    </td>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>简介</td>
                                                                    <td>
                                                                        <asp:TextBox ID="TIntroduction" runat="server"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>邮箱</td>
                                                                    <td>
                                                                        <asp:TextBox ID="TEmail" runat="server"></asp:TextBox>
                                                                    </td>
                                                                    <td></td>
                                                                </tr>
                                                                 <tr>
                                                                    <td>电话</td>
                                                                    <td>
                                                                        <asp:TextBox ID="TPhone" runat="server"></asp:TextBox>
                                                                    </td>
                                                                    <td></td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                      </div>
                                                      <div class="modal-footer">
                                                        
                                                        <asp:Button ID="Button1" runat="server" Text="保存"  class="btn btn-primary" OnClick="baocun" />
                                                        <asp:Button ID="Button2" runat="server" Text="关闭" class="btn btn-light"  />
                                                      </div>
                                                    </div>
                                                  </div>
                                                </div>
                                            </td>
                                        </tr>
                                        
										
										

                                </thead>
                                <tbody>
                                    <tr>
                                        <td>性别</td>
                                        <td>
                                            <asp:Label ID="Sex" runat="server" Text=""></asp:Label>
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>简介</td>
                                        <td>
                                            <asp:Label ID="Introduction" runat="server" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>邮箱</td>
                                        <td>
                                            <asp:Label ID="Email" runat="server" Text=""></asp:Label>
                                        </td>
                                        <td></td>
                                    </tr>
                                     <tr>
                                        <td>电话</td>
                                        <td>
                                            <asp:Label ID="Phone" runat="server" Text=""></asp:Label>
                                        </td>
                                        <td></td>
                                    </tr>
                                </tbody>
                            </table>
								
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
