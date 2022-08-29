<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WebApplication1.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="bootstrap-5.1.3-dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="bootstrap-5.1.3-dist/js/bootstrap.bundle.min.js"></script>
    <link href="css/signin.css" rel="stylesheet" />
    <script type="text/javascript" src="js/JQuery.js"></script>
</head>
<body >
    <main class="form-signin">
      <form runat="server">
        <p  style="font-size:50px;color:burlywood" class="text-center">Life Guide</p>
        <h1 class="h3 mb-3 fw-normal text-center" >注册</h1>

        <div >
          <label for="validationDefaultUsername" class="form-label">用户名</label>
          <div class="input-group">
              <span class="input-group-text" id="inputGroupPrepend2">@</span>
              <input runat="server" type="text" class="form-control" id="validationDefaultUsername"  aria-describedby="inputGroupPrepend2" required />
          </div>
        </div>
        <div >
           
          <label for="validationDefault01"  class="form-label">邮箱</label>
          <input type="email" runat="server" class="form-control" id="validationDefault01"  required />
        </div>
        <div >
          <label for="validationDefault02" class="form-label">密码</label>
          <input type="password"  runat="server" class="form-control" id="validationDefault02"  required />
        </div>
        <div >
            <label for="validationDefault03" class="form-label">确认密码</label>
            <input type="password"  runat="server" class="form-control" id="validationDefault03" required />
            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="* 确认密码不符！" ControlToValidate="validationDefault02" ControlToCompare="validationDefault03" style="color:red" ></asp:CompareValidator>

        </div>
        
          <span name="msg"></span>
    


        <div class="checkbox mb-3">
          <label class="text-secondary">
             已有账户？点击这里
              <a style='text-decoration:none;' href="Login.aspx">登录</a>
          </label>
        </div>
        <asp:Button ID="Button1" runat="server" Text="注册" class="w-100 btn btn-lg btn-primary" OnClick="Button1_Click" />
<%--        <button class="w-100 btn btn-lg btn-primary" type="submit" >注册</button>--%>
        <p class="mt-5 mb-3 text-muted">&copy; 2022人生指南-GM</p>
      </form>
    </main>
</body>
</html>
