public with sharing class AddressHelper {
    public String encodeStreetAddress(String street) {
        String encoded = null;
        
        if(String.isNotBlank(street)) {
            // encode any special characters in the street address
            encoded = EncodingUtil.urlEncode(street, 'UTF-8');
        }
        
        return encoded;
    }
}
