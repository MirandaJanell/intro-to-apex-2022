trigger AccountTrigger on Account (before insert, before update) {
    AddressHelper addrHelper = new AddressHelper();

    for(Account acct : Trigger.new) {
        acct.Encoded_Billing_Street__c = addrHelper.encodeStreetAddress(acct.BillingStreet);
        acct.Encoded_Shipping_Street__c = addrHelper.encodeStreetAddress(acct.ShippingStreet);
    }
}