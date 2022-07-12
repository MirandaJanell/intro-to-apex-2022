trigger LeadTrigger on Lead (before insert, before update) {
    AddressHelper addrHelper = new AddressHelper();

    for(Lead ld : Trigger.new) {
        ld.Encoded_Street__c = addrHelper.encodeStreetAddress(ld.Street);
    }
}