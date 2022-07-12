trigger LeadTrigger on Lead (before insert, before update) {
    for(Lead ld : Trigger.new) {
        ld.Encoded_Street__c = null;
        
        if(String.isNotBlank(ld.Street)) {
            // encode any special characters in the street address
            ld.Encoded_Street__c = EncodingUtil.urlEncode(ld.Street, 'UTF-8');
        }
    }
}