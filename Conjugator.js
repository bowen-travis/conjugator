function test_the_string(text_box_id, correct_string, test_string)
{
  if ((trim(test_string) == "") || (test_string == null))
  {
	  document.getElementById(text_box_id).className="white";
  }
  else if(correct_string == trim(test_string))
  {
	  document.getElementById(text_box_id).className="green";
  }
  //For yellow, main test will be if entered string matches beginning of answer.
  //Also, test for case when last character is diacritic.
  //In OS X, diacritic is entered first and then base letter.
  //Diacritic will be seen as parseable cgharacter, and we do not want
  //  the field turning red before the letter is input.
  //Test for unicode number of last character:
  //  180 = acute accent
  else if((left_trim(test_string) == 
            correct_string.substr(0, left_trim(test_string).length))
          || ((test_string.charCodeAt(test_string.length - 1)) == 180)
          || ((test_string.charCodeAt(test_string.length - 1)) == 710)
          || ((test_string.charCodeAt(test_string.length - 1)) == 168)
          || ((test_string.charCodeAt(test_string.length - 1)) == 732)
          || ((test_string.charCodeAt(test_string.length - 1)) == 96))
  {
	  document.getElementById(text_box_id).className="yellow";
  }
  else
  {
	  document.getElementById(text_box_id).className="red";
  }
}

function trim(s)
{
    var l=0; var r=s.length -1;
    while(l < s.length && s[l] == ' ')
    {     l++; }
    while(r > l && s[r] == ' ')
    {     r-=1;     }
    return s.substring(l, r+1);
} 


function left_trim(s)
{
    var l=0; var r=s.length -1;
    while(l < s.length && s[l] == ' ')
    {     l++; }
    return s.substring(l, r+1);
} 

function load_verbs(lang, verb)
{

	var xmlHttp;

	try
	{
		// Firefox, Opera 8.0+, Safari
		xmlHttp=new XMLHttpRequest();
	}
	catch (e)
	{
		// Internet Explorer
		try
		{
			xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
		}
		catch (e)
		{
			try
			{
				xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
			}
			catch (e)
			{
				alert("Your browser does not support AJAX!");
				return false;
			}
		}
	}

	xmlHttp.onreadystatechange=function()
	{
		if(xmlHttp.readyState==4)
		{
			vrb_selector = document.getElementById("verb_selector");

      temp_array = xmlHttp.responseText.split(',');
      temp_array.sort();
		
			for(i in temp_array)	
			{ 
				if ((lang + "_") == temp_array[i].substring(0, lang.length + 1))
				{
					current_verb = temp_array[i].substring(lang.length + 1);
          current_verb = current_verb.substring(0, current_verb.length-4);

					if(current_verb != "default")
					{
						new_option=document.createElement('option');
  					//new_option.text=temp_array[i].substring(lang.length + 1);
  					new_option.text=current_verb;
  					new_option.value=current_verb;
						try
						{
							vrb_selector.add(new_option,null); // standards compliant
						}
						catch(ex)
						{
							vrb_selector.add(new_option); // IE only
						}
					}
				}
			}

      index=0;
      verb_list=vrb_selector.options;
      while(verb_list[index].text  != verb)
			{
				index++
			}
			vrb_selector.selectedIndex = index;
		}
	}

	var url = "LoadVerbs.php"
	xmlHttp.open("GET", url, true);
	xmlHttp.send(null); 
 
}



function load_languages(lang)
{
	var xmlHttp;

	try
	{
		// Firefox, Opera 8.0+, Safari
		xmlHttp=new XMLHttpRequest();
	}
	catch (e)
	{
		// Internet Explorer
		try
		{
			xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
		}
		catch (e)
		{
			try
			{
				xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
			}
			catch (e)
			{
				alert("Your browser does not support AJAX!");
				return false;
			}
		}
	}

	xmlHttp.onreadystatechange=function()
	{
		if(xmlHttp.readyState==4)
		{
			lang_selector = document.getElementById("language_selector");

      temp_array = xmlHttp.responseText.split(',');
		
			for(i in temp_array)	
			{ 
					new_option=document.createElement('option');
  				new_option.text=temp_array[i];
					new_option.value=temp_array[i];
					try
					{
						lang_selector.add(new_option,null); // standards compliant
					}
					catch(ex)
					{
						lang_selector.add(new_option); // IE only
					}
			}

      index=0;
      lang_list=lang_selector.options;
      while(lang_list[index].text  != lang)
			{
				index++
			}
			lang_selector.selectedIndex = index;
		}
	}

	var url = "LoadLanguages.php"
	xmlHttp.open("GET", url, true);
	xmlHttp.send(null); 
 
}

function select_language(lang)
{
	if(lang == "None")
		location.replace("Conjugator.xml");
	else location.replace(lang + "_default.xml");
}


function select_verb(lang, verb)
{
	if(verb != "None")
		location.replace(lang + "_" + verb + ".xml");
	else location.replace(lang + "_default.xml");
}
