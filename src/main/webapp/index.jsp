<!--*
*
* (c) Copyright Ascensio System SIA 2019
*
* The MIT License (MIT)
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in all
* copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
*-->

<%@page import="helpers.DocumentManager"%>
<%@page import="helpers.ConfigManager"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%--    <title>ONLYOFFICE</title>--%>
    <%--    不确定左上角的英文是否来自于这里--%>
    <link rel="icon" href="favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans:900,800,700,600,500,400,300&subset=latin,cyrillic-ext,cyrillic,latin-ext" />
    <link rel="stylesheet" type="text/css" href="css/stylesheet.css" />
    <link rel="stylesheet" type="text/css" href="css/jquery-ui.css" />
</head>
<body>

<div class="top-panel"></div>

<div class="main-panel">
    <span class="portal-name">ONLYOFFICE Document Editors</span>
<%--    不确定左上角的英文是否来自于这里--%>
    <br />
    <br />
    <span class="portal-descr">Get started with a demo-sample of ONLYOFFICE Document Editors, the first html5-based editors. You may upload your own documents for testing using the "Choose file" button and selecting the necessary files on your PC.</span>

    <input type="hidden" name="hiddenFileName" id="hiddenFileName" />

    <div id="beginView" class="button">View</div>
    <div id="beginEdit" class="button">Edit</div>
    <label class="save-original">
        <input type="checkbox" id="checkOriginalFormat" class="checkbox" />Save document in original format
    </label>
    <span class="question"></span>
    <br />
    <br />
    <br />

    <span id="loadScripts" data-docs="<%= ConfigManager.GetProperty("files.docservice.url.preloader") %>"></span>

    <div class="bottom-panel">
        &copy; Ascensio System SIA <%= Calendar.getInstance().get(Calendar.YEAR) %>. All rights reserved.
    </div>


    <script type="text/javascript" src="scripts/jquery-1.8.2.js"></script>
    <script type="text/javascript" src="scripts/jquery-ui.js"></script>
    <script type="text/javascript" src="scripts/jquery.blockUI.js"></script>
    <script type="text/javascript" src="scripts/jquery.iframe-transport.js"></script>
    <script type="text/javascript" src="scripts/jquery.fileupload.js"></script>
    <script type="text/javascript" src="scripts/jquery.dropdownToggle.js"></script>
    <script type="text/javascript" src="scripts/javascript.js"></script>

    <script language="javascript" type="text/javascript">
        var ConverExtList = "<%= String.join(",", DocumentManager.GetConvertExts()) %>";
        var EditedExtList = "<%= String.join(",", DocumentManager.GetEditedExts()) %>";
        var UrlConverter = "IndexServlet?type=convert";
        var UrlEditor = "EditorServlet";
    </script>

</body>
</html>



