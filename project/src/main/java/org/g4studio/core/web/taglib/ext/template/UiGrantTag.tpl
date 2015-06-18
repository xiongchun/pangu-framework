<script type="text/javascript">
Ext.onReady(function() {
#foreach($grant in $grantList)
	if(Ext.getCmp('${grant.cmpid}')){
	    #if(${grant.partauthtype} == "1")
            Ext.getCmp('${grant.cmpid}').disable();
            #if(${grant.cmptype} == "2")
            Ext.getCmp('${grant.cmpid}').addClass('x-custom-field-disabled');
            #end
        #end 
	    #if(${grant.partauthtype} == "2")
	        Ext.getCmp('${grant.cmpid}').enable();
	        #if(${grant.cmptype} == "2")
            Ext.getCmp('${grant.cmpid}').removeClass('x-custom-field-disabled');
            #end
        #end 
        #if(${grant.partauthtype} == "3")
            #if(${grant.cmptype} == "2")
              Ext.getCmp('${grant.cmpid}').setReadOnly(true);
              Ext.getCmp('${grant.cmpid}').addClass('x-custom-field-disabled');
            #end
        #end 
        #if(${grant.partauthtype} == "4")
            #if(${grant.cmptype} == "2")
              Ext.getCmp('${grant.cmpid}').setReadOnly(false);
              Ext.getCmp('${grant.cmpid}').removeClass('x-custom-field-disabled');
            #end
        #end 
        #if(${grant.partauthtype} == "5")
            Ext.getCmp('${grant.cmpid}').show();
            #if(${grant.cmptype} == "2")
              Ext.getCmp('${grant.cmpid}').getEl().up('.x-form-item').setDisplayed(true);
            #end
        #end 
        #if(${grant.partauthtype} == "6")
            Ext.getCmp('${grant.cmpid}').hide();
            #if(${grant.cmptype} == "2")
              Ext.getCmp('${grant.cmpid}').getEl().up('.x-form-item').setDisplayed(false);
            #end
        #end
	}
#end
});
</script>