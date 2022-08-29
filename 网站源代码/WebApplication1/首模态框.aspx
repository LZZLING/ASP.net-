<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="首模态框.aspx.cs" Inherits="WebApplication1.首模态框" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>子窗口</title>
    
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <center>
            <table>
                <tr>
                    <td>
                       用户名:
                    </td>
                    <td>
                        <input type="text" id="txtUserName" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        密码:
                    </td>
                    <td>
                        <input type="text" id="txtPwd" runat="server" />
                    </td>
                 </tr>
                 <tr>
                    <td>
                        安全信息
                    </td>
                    <td>                     
                        <label runat="server" id="lblPass">1345451057450</label>
                        <input type="text" id="txtPass" runat="server" style="display:none;" value="1345451057450" />
                    </td>
                 </tr>
                 <tr>
                    <td colspan="2">
                        <asp:Button runat="server" ID="btn_Submit" Text="保 存" 
                            οnclick="btn_Submit_Click" />
                        <input type="button" id="btn_Close" value="关 闭" οnclick="javascript:window.close();" />
                    </td>   
                 </tr>
                
            </table>
        </center>
    </div>
    </form>
</body>
</html>