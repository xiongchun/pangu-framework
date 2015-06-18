function ${field}Render(value) {
  #foreach($code in $codeList)
  	if (value == '${code.code}') return '${code.codedesc}';
  #end 
    else return value;
}

