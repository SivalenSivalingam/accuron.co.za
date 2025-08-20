﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="default.aspx.cs" Inherits="_default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Accuron</title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link href="/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/css/uc.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="overlay"></div>
        <div class="stars" aria-hidden="true"></div>
        <div class="starts2" aria-hidden="true"></div>
        <div class="stars3" aria-hidden="true"></div>
        <main class="main">
            <section class="contact text-center">
                <h1 class="title">Accuron</h1>
				<h3 class="sub-title">We busy setting up our website. Make sure to check back soon!</h3>
                <p>Copyright © <%=DateTime.Now.Year.ToString() %> Accuron. All Rights Reserved. Hosted by <a href="https://webox.co.za" target="=_blank" style="color:#fff">Webox</a></p>
            </section>
        </main>
    </form>
</body>
</html>
