<html>
    <head>
        <title>ws8_2</title>
        <style>
            .product
            {
                margin-top: 40px;
                border: 1px solid gray;
            }
        </style>
        <script>
            function display()
            {
                var xhr = new XMLHttpRequest();
                xhr.open("GET","file1.json", true);
                xhr.send();
                xhr.onreadystatechange = function()
                {
                    if(this.readyState == 4 && this.status == 200)
                    {
                        var obj = JSON.parse(this.responseText);
                        var cont = document.getElementById("display");
                        for(var i = 0; i<obj.length; i++)
                        {
                            var box = document.createElement("div");
                            box.setAttribute("class", "product");
                            box.id = obj[i].id;
                            box.innerHTML = "Item: " + obj[i].title + "<br>Price: " + obj[i].price;
                            var img = document.createElement("img");
                            img.setAttribute("src", obj[i].filename);
                            img.setAttribute("class", "thumb");
                            img.setAttribute("onmouseover", "big(this)");
                            img.setAttribute("onmouseout", "normal(this)");
                            box.appendChild(img);
                            var button = document.createElement("button");
                            button.setAttribute("onclick", "descr(this)");
                            button.innerHTML = "Show Description";
                            box.appendChild(document.createElement("br"));
                            box.appendChild(button);
                            cont.appendChild(box);
                        }
                    }
                };
            }
            function big(img)
            {
                var xhr = new XMLHttpRequest();
                xhr.open("GET","file3.json", true);
                xhr.send();
                xhr.onreadystatechange = function()
                {
                    if(this.readyState == 4 && this.status == 200)
                    {
                        var obj = JSON.parse(this.responseText);
                        for(var i = 0;i<obj.length; i++)
                        {
                            if(obj[i].id == img.parentNode.id)
                            {
                            img.setAttribute("src", obj[i].bigname);
                            }
                        }
                    }
                }
            }
            function normal(img)
            {
                var xhr = new XMLHttpRequest();
                xhr.open("GET","file4.json", true);
                xhr.send();
                xhr.onreadystatechange = function()
                {
                    if(this.readyState == 4 && this.status == 200)
                    {
                        var obj = JSON.parse(this.responseText);
                        for(var i = 0;i<obj.length; i++)
                        {
                            if(obj[i].id == img.parentNode.id)
                            {
                                img.setAttribute("src", obj[i].name);
                            }
                        }
                    }
                }
            }
            function descr(button)
            {
                var xhr = new XMLHttpRequest();
                xhr.open("GET","file2.json", true);
                xhr.send();
                xhr.onreadystatechange = function()
                {
                    if(this.readyState == 4 && this.status == 200)
                    {
                        var obj = JSON.parse(this.responseText);
                        for(var i = 0;i<obj.length; i++)
                        {
                            if(obj[i].id == button.parentNode.id)
                            {
                            button.parentNode.innerHTML += "<br><br>" + obj[i].desc;
                            }
                        }
                    }
                }
            }
        </script>
    </head>
    <body onload = "display()">
        <h2> Product Catalog </h2>
        <div id = "display"> </div>
    </body>
</html>