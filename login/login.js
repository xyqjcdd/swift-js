var updateFunc = function()
{
	var username = document.getElementById("username");
    jsobject.upAction(username.value);
    jsobject.update("test111111111","test222222222");
}

var updateName = function(name)
{
    document.getElementById("username").value = name;
}

var testFunc = function()
{
    jsobject.test();
}
