<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="2首页生活.aspx.cs" Inherits="Life_Leader._2首页生活" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <%--<link href="https://cdn.staticfile.org/twitter-bootstrap/5.1.1/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.staticfile.org/twitter-bootstrap/5.1.1/js/bootstrap.bundle.min.js"></script>--%>
    <link href="bootstrap-5.1.3-dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="bootstrap-5.1.3-dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:DataList ID="DataList1" runat="server"  >
                <HeaderTemplate>
                </HeaderTemplate>
                <ItemTemplate>
                    <div class="media well ">
				                     <a   class="pull-left"><img src="images/yonghu.jpg" style="width:50px;height:50px;" class="img-circle media-object"></a>
				                    <div class="media-body btn-group btn-group-sm">
					                    <h4 class="media-heading">
						                    <asp:Label ID="lb" runat="server" Text='<%# Eval("UserName") %>' ></asp:Label>
					                    </h4> 
                                       
                                        <asp:Label ID="F1Comment" runat="server" Text='<%# Eval("SecretComment") %>' ></asp:Label>
                                        <div class="text-right">
                                            <asp:Label ID="lbCommentdate" runat="server" Text='<%# Eval("Secretdate") %>' ></asp:Label>
                                        </div>
                                        <asp:LinkButton ID="LinkButton5" CommandName="abc" CommandArgument='<%# Eval("SecretID") %>' runat="server"  class="btn btn-default btn-lg " Text="回复"   ></asp:LinkButton> 
				                    </div>
			                    </div>
			                    
                </ItemTemplate>
                <FooterTemplate>
                    <ul class="pagination ">
				        <li>
					         <asp:LinkButton ID="lnkbtnFirst1" runat="server" CommandName="first" >&larr; 首页</asp:LinkButton>

				        </li>
				        <li>
                            <asp:LinkButton ID="lnkbtnFront1" runat="server" CommandName="pre">上一页</asp:LinkButton>
				        </li>
                        <li>
                            <asp:Label ID="labNowPage1" runat="server" Text="1"></asp:Label>
				        </li>
                        <li>
                            <asp:LinkButton ID="lnkbtnNext1" runat="server" CommandName="next">下一页</asp:LinkButton>
				        </li>
				        <li>
                            <asp:LinkButton ID="lnkbtnLast1" runat="server"  CommandName="last">尾页 &rarr;</asp:LinkButton>
				        </li>
                        <li>
                            <a>
                                总共
                            <asp:Label ID="labCount1" runat="server"  Width="12px" Text="1"></asp:Label>
                                页
                            </a>
                        </li>
			        </ul>
                </FooterTemplate>
            </asp:DataList>

        </div>
    </form>
</body>
</html>
