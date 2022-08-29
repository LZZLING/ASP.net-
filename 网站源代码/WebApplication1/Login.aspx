<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication1.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    
    <link href="bootstrap-5.1.3-dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="bootstrap-5.1.3-dist/js/bootstrap.bundle.min.js"></script>

    <script type="text/javascript" src="js/JQuery.js"></script>
    <link href="css/signin.css" rel="stylesheet" />

</head>
<body class="text-center" >
    <main class="form-signin" runat="server">
      <form runat="server">
        <p  style="font-size:50px;color:burlywood">Life Guide</p>
        <h1 class="h3 mb-3 fw-normal">登录</h1>

        <div class="form-floating">
          <input type="email" runat="server" class="form-control" id="floatingInput" placeholder="name@example.com" />
          <label for="floatingInput">邮箱</label>
        </div>
        <div class="form-floating">
          <input type="password" runat="server" class="form-control" id="floatingPassword" placeholder="Password" />
          <label for="floatingPassword">密码</label>
        </div>

        <div class="checkbox mb-3">
          <label class="text-secondary">
             没有账户？点击这里
              <a style='text-decoration:none;' href="Register.aspx">注册</a>
          </label>
        </div>
        <asp:Button ID="Button1" runat="server" class="w-100 btn btn-lg btn-primary" Text="登录" OnClick="Button1_Click" />
<%--        <button class="w-100 btn btn-lg btn-primary" type="submit">登录</button>--%>
        <p class="mt-5 mb-3 text-muted">&copy; 2022人生指南-GM</p>
      </form>
    </main>

</body>
</html>
