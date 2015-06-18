var ${field}Store = new Ext.data.SimpleStore({
  fields : ['value', 'text'],
  data : [
  #set($size = $codeList.size())
  #foreach($code in $codeList)
    ['${code.code}', '#if(${showCode}=="true")${code.code} #end${code.codedesc}']
    #if($velocityCount != $size)
      ,
    #end
  #end
  ]
});