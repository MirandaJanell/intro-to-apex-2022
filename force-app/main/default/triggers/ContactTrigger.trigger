trigger ContactTrigger on Contact (before insert, before update) {
    AddressHelper addrHelper = new AddressHelper();

    for(Contact cont : Trigger.new) {
        cont.Encoded_Mailing_Street__c = addrHelper.encodeStreetAddress(cont.MailingStreet);
        cont.Encoded_Other_Street__c = addrHelper.encodeStreetAddress(cont.OtherStreet);
    }
}