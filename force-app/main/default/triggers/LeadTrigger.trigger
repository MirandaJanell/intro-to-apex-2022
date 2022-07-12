trigger LeadTrigger on Lead (before insert, before update) {
    for(Lead ld : Trigger.new) {
        // encode any special characters in the street address
        ld.Encoded_Street__c = EncodingUtil.urlEncode(ld.Street, 'UTF-8');
    }
}