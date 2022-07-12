@IsTest
private class AddressEncodingTests {
    @IsTest
    static void testEncodeStreetAddress() {
        String origStreet = '123 Hot & Cold Ln #55';
        
        Test.startTest();
        AddressHelper addrHelper = new AddressHelper();
        String encoded = addrHelper.encodeStreetAddress(origStreet);
        Test.stopTest();
        
        System.assertNotEquals(origStreet, encoded);
    }

    @IsTest
    static void testAccountAddressEncodingOnInsert() {
        String origStreet = '123 Hot & Cold Ln #55';

        Test.startTest();
        Account acct1 = new Account();
        acct1.Name = 'Test Account 1';
        acct1.BillingStreet = origStreet;
        acct1.Encoded_Billing_Street__c = origStreet;
        acct1.ShippingStreet = origStreet;
        acct1.Encoded_Shipping_Street__c = origStreet;

        insert acct1;
        Test.stopTest();

        acct1 = [SELECT Id, BillingStreet, ShippingStreet, Encoded_Billing_Street__c, Encoded_Shipping_Street__c FROM Account WHERE Id = :acct1.Id];
        
        System.assertNotEquals(null, acct1.Encoded_Billing_Street__c);
        System.assertNotEquals(null, acct1.Encoded_Shipping_Street__c);
        System.assertNotEquals(origStreet, acct1.Encoded_Billing_Street__c);
        System.assertNotEquals(origStreet, acct1.Encoded_Shipping_Street__c);
    }

    @IsTest
    static void testAccountAddressEncodingOnUpdate() {
        String origStreet = '123 Hot & Cold Ln #55';

        Account acct1 = new Account();
        acct1.Name = 'Test Account 1';
        acct1.BillingStreet = '456 Another Parkway';
        acct1.ShippingStreet = origStreet;
        insert acct1;

        Test.startTest();
        acct1.BillingStreet = origStreet;
        acct1.ShippingStreet = null;
        acct1.Encoded_Billing_Street__c = origStreet;
        acct1.Encoded_Shipping_Street__c = 'derp';

        update acct1;
        Test.stopTest();

        acct1 = [SELECT Id, BillingStreet, ShippingStreet, Encoded_Billing_Street__c, Encoded_Shipping_Street__c FROM Account WHERE Id = :acct1.Id];
        
        System.assertNotEquals(null, acct1.Encoded_Billing_Street__c);
        System.assertEquals(null, acct1.Encoded_Shipping_Street__c);
        System.assertNotEquals(origStreet, acct1.Encoded_Billing_Street__c);
    }

    @IsTest
    static void testContactAddressEncodingOnInsert() {
        String origStreet = '123 Hot & Cold Ln #55';

        Test.startTest();
        Contact cont1 = new Contact();
        cont1.FirstName = 'Test';
        cont1.LastName = ' Contact 1';
        cont1.MailingStreet = origStreet;
        cont1.Encoded_Mailing_Street__c = origStreet;
        cont1.OtherStreet = origStreet;
        cont1.Encoded_Other_Street__c = origStreet;

        insert cont1;
        Test.stopTest();

        cont1 = [SELECT Id, MailingStreet, OtherStreet, Encoded_Mailing_Street__c, Encoded_Other_Street__c FROM Contact WHERE Id = :cont1.Id];
        
        System.assertNotEquals(null, cont1.Encoded_Mailing_Street__c);
        System.assertNotEquals(null, cont1.Encoded_Other_Street__c);
        System.assertNotEquals(origStreet, cont1.Encoded_Mailing_Street__c);
        System.assertNotEquals(origStreet, cont1.Encoded_Other_Street__c);
    }

    @IsTest
    static void testContactAddressEncodingOnUpdate() {
        String origStreet = '123 Hot & Cold Ln #55';

        Contact cont1 = new Contact();
        cont1.FirstName = 'Test';
        cont1.LastName = ' Contact 1';
        cont1.MailingStreet = '456 Another Parkway';
        cont1.OtherStreet = origStreet;
        insert cont1;

        Test.startTest();
        cont1.MailingStreet = origStreet;
        cont1.OtherStreet = null;
        cont1.Encoded_Mailing_Street__c = origStreet;
        cont1.Encoded_Other_Street__c = 'derp';

        update cont1;
        Test.stopTest();

        cont1 = [SELECT Id, MailingStreet, OtherStreet, Encoded_Mailing_Street__c, Encoded_Other_Street__c FROM Contact WHERE Id = :cont1.Id];
        
        System.assertNotEquals(null, cont1.Encoded_Mailing_Street__c);
        System.assertEquals(null, cont1.Encoded_Other_Street__c);
        System.assertNotEquals(origStreet, cont1.Encoded_Mailing_Street__c);
    }

    @IsTest
    static void testLeadAddressEncodingOnInsert() {
        String origStreet = '123 Hot & Cold Ln #55';

        Test.startTest();
        Lead ld1 = new Lead();
        ld1.FirstName = 'Test';
        ld1.LastName = ' Lead 1';
        ld1.Company = 'Test Company 1';
        ld1.Street = origStreet;
        ld1.Encoded_Street__c = origStreet;

        insert ld1;
        Test.stopTest();

        ld1 = [SELECT Id, Street, Encoded_Street__c FROM Lead WHERE Id = :ld1.Id];
        
        System.assertNotEquals(null, ld1.Encoded_Street__c);
        System.assertNotEquals(origStreet, ld1.Encoded_Street__c);
    }

    @IsTest
    static void testLeadAddressEncodingOnUpdate1() {
        String origStreet = '123 Hot & Cold Ln #55';

        Lead ld1 = new Lead();
        ld1.FirstName = 'Test';
        ld1.LastName = ' Lead 1';
        ld1.Company = 'Test Company 1';
        ld1.Street = '456 Another Parkway';
        insert ld1;

        Test.startTest();
        ld1.Street = origStreet;
        ld1.Encoded_Street__c = origStreet;

        update ld1;
        Test.stopTest();

        ld1 = [SELECT Id, Street, Encoded_Street__c FROM Lead WHERE Id = :ld1.Id];
        
        System.assertNotEquals(null, ld1.Encoded_Street__c);
        System.assertNotEquals(origStreet, ld1.Encoded_Street__c);
    }

    @IsTest
    static void testLeadAddressEncodingOnUpdate2() {
        String origStreet = '123 Hot & Cold Ln #55';

        Lead ld1 = new Lead();
        ld1.FirstName = 'Test';
        ld1.LastName = ' Lead 1';
        ld1.Company = 'Test Company 1';
        ld1.Street = origStreet;
        insert ld1;

        Test.startTest();
        ld1.Street = null;
        ld1.Encoded_Street__c = 'derp';

        update ld1;
        Test.stopTest();

        ld1 = [SELECT Id, Street, Encoded_Street__c FROM Lead WHERE Id = :ld1.Id];
        
        System.assertEquals(null, ld1.Encoded_Street__c);
    }
}
