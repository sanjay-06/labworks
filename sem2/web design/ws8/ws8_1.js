var city;
var state;
var present_value;
function load()
{
    search();
}
function generate(parsed)
{
    $("#contact_list").html("");
    for (var i = 0; i < parsed.length; i++)
    {
        if (parsed[i].last.includes(present_value))
        {
            var box = $("<div></div>");
            box.attr("id", "box");
            box.attr("align", "center");
            var a = $("<a></a>");
            a.append($("<h3></h3>").text(parsed[i].first + " " + parsed[i].last));
            a.attr("href", "#collapse" + i);
            a.attr("data-toggle", "collapse");
            var collapse = $("<div></div>");
            collapse.addClass("collapse");
            collapse.attr("id","collapse" + i);
            var street = $("<p></p>").text( parsed[i].street+ " " + parsed[i].zipcode);
            var city = $("<p></p>").text( parsed[i].city);
            var state = $("<p></p>").text( parsed[i].state);
            var number = $("<p></p>").text( parsed[i].t_number);
            collapse.append(street);
            collapse.append(city);
            collapse.append(state);
            collapse.append(number);
            box.append(a);
            box.append(collapse);
            $("#contact_list").append(box);
        }
    }
}
function search()
{
    document.getElementById('search').style.visibility = "visible";
    document.getElementById('add').style.visibility = "hidden";
}
function add()
{
    $("#contact_list").html("");
    document.getElementById('search').style.visibility = "hidden";
    document.getElementById('add').style.visibility = "visible";
}
function getDetails()
{
    var clientKey ="js-WbIEl7R6bwKV40RZXPKJtOkHPrmrVQnstd8tEc2EW0PrLZu78pCUN7Qls0f3Ikju";
    var zipcode = document.getElementById('zipcode').value;
    var xhr = new XMLHttpRequest(); var url = "https://www.zipcodeapi.com/rest/"+clientKey+"/info.json/" + zipcode + "/radians";
    xhr.open("GET", url, true);
    xhr.send();
    xhr.onreadystatechange =function()
    {
        if(this.readyState == 4)
        {
            var output = this.status + this.responseText;
            if (this.status == 200)
            {
                var data = JSON.parse(this.responseText);
                document.getElementById('city').innerHTML += data.city;
                document.getElementById('city_input').value = data.city;
                city = data.city;
                document.getElementById('state').innerHTML += data.state;
                document.getElementById('state_input').value = data.state;
                state = data.state;
            }
            else
            {
                document.getElementById('text-error').innerHTML = this.responseText;
            }
        }
    };
}
function sendForm()
{
    var inputs = document.getElementsByClassName("add");
    console.log(inputs);
    var data = "";
    data += ("first="+inputs[0].value);
    data += ("&last="+inputs[1].value);
    data += ("&street="+inputs[2].value);
    data += ("&city="+inputs[3].value);
    data += ("&state="+inputs[4].value);
    data += ("&zipcode="+inputs[5].value);
    data += ("&phone="+inputs[6].value);
    const searchExp = /\s/g;
    data = data.replace(searchExp, '+');
    console.log(data);
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "ws8_1.php", true);
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhr.send(data);
    xhr.onreadystatechange = function()
    {
        if(this.readyState == 4 && this.status == 200)
        {
            console.log("Posted successfully");
            console.log(this.responseText);
        }
    };
}
function sendDetails()
{
    var input = document.getElementById("search_1");
    console.log(input.value);
    var data = "search=" + input.value;
    present_value = input.value;
    console.log(data);
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "ws8_1.php", true);
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhr.send(data);
    xhr.onreadystatechange = function()
    {
        if(this.readyState == 4 && this.status == 200)
        {
            console.log("Posted successfully");
            var parsed = JSON.parse(this.responseText);
            generate(parsed);
        }
    };
}