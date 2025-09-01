public with sharing class AccountController {

    @AuraEnabled(cacheable=true)
    public static List<Account> findAccounts(String searchKey) {
        system.debug('deployed by devindrappa');
        String key = '%' + searchKey + '%';
        return [SELECT Id,Sales__c, Name, AccountNumber FROM Account WHERE Name LIKE :key  LIMIT 10];
    }

}