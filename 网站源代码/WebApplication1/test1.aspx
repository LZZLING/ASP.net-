<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test1.aspx.cs" Inherits="WebApplication1.test1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>父窗口</title>
    
    <script type="text/javascript">

        function OpenSelectInfo() {
            var width = 1000;  //模态窗口的宽度
            var height = 500;   //模态窗口的高度
            var url = "首模态框.aspx?UserName=ZhangSan"; //模态窗口的url地址
            window.showModalDialog(url, null, 'dialogWidth=' + width + 'px;dialogHeight=' + height + 'px;help:no;status:no');

        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>        
         <input type="button" id="btn_ModifyNickName" runat="server" value="打开模态窗口"  style=" 126px;" οnclick="OpenSelectInfo()" />   
          
    </div>
    </form>
</body>
</html>
