<!--*
 *
 * (c) Copyright Ascensio System Limited 2010-2018
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

<%@page import="entities.FileModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ONLYOFFICE</title>
        <link rel="icon" href="favicon.ico" type="image/x-icon" />
        <link rel="stylesheet" type="text/css" href="css/editor.css" />
        <% FileModel Model = (FileModel) request.getAttribute("file"); %>

        <input type="hidden" value="${docserviceApiUrl}" id="apiurl" />
        <script type="text/javascript" language="javascript">
            var APIurl=document.getElementById('apiurl').value;
        </script>

<%--        <script type="text/javascript" src="http://192.168.1.222:80/web-apps/apps/api/documents/api.js"></script>--%>
        <script type="text/javascript" src="${docserviceApiUrl}"></script>
    </head>




    <body>
    <div class="form">
        <div id="iframeEditor"></div>
    </div>
    <input type="hidden" value="${url}" id="url" />
    <input type="hidden" value="${port}" id="port" />
    </body>

    <script type="text/javascript" src="scripts/javascript.js"></script>

    <script type="text/javascript" language="javascript">

        var URL=document.getElementById('url').value;
        var PORT=document.getElementById('port').value;

        console.log("url="+URL);
        console.log("port="+PORT);


        var innerAlert = function (message) {
            if (console && console.log)
                console.log(message);
        };

        var onReady = function () {
            innerAlert("Document editor ready");
        };

        var onDocumentStateChange = function (event) {
            var title = document.title.replace(/\*$/g, "");
            document.title = title + (event.data ? "*" : "");
        };

        var onRequestEditRights = function () {
            location.href = location.href.replace(RegExp("mode=view\&?", "i"), "");
        };

        var onError = function (event) {
            if (event)
                innerAlert(event.data);
        };

        var onOutdatedVersion = function (event) {
            location.reload(true);
        };

        var сonnectEditor = function () {
           var config={
        		   "document":{
        			   "fileType": "<%= Model.document.fileType %>",
        			   "key": "<%= Model.document.key %>",
        			   "title": "<%= Model.document.title %>",
        			   "url": "<%= Model.document.url%>"
        		   },
        		   "documentType": "<%= Model.documentType %>",
        		   "editorConfig": {
        			   <%--"callbackUrl":"http://localhost:8099/OnlineEditors/CallBackServlet?"+"fileName=<%= Model.document.title %>",--%>
                       "callbackUrl":URL+":"+PORT+"/OnlineEditors/CallBackServlet?"+"fileName=<%= Model.document.title %>",
        				"customization":{
        			        //"autoSave":true,
                            "forceSave":false
        				},
	        		   "user": {
	        			   "id": "78ele841",
	        			   "name":"John Smith"
	        		    },
        				"lang":"zh-CN",
                        "mode":"<%= Model.editorConfig.mode%>"
        		   },
                   /*"events":{
                       "onAppReady": onAppReady,
                   },*/
        		   "height": "100%",
        		   "width": "100%"
           };
                docEditor = new DocsAPI.DocEditor("iframeEditor", config);
        };

        if (window.addEventListener) {
            window.addEventListener("load", сonnectEditor);
        } else if (window.attachEvent) {
            window.attachEvent("load", сonnectEditor);
        }

    </script>


</html>
