var updateFunc = function()
{
	var username = document.getElementById("username");
    jsobject.upAction(username.value);
}

var updateName = function(name)
{
    document.getElementById("username").value = name;
}

var testFunc = function()
{
    jsobject.test();
}
