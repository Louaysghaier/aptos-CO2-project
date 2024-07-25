script {
    use 0x1::Account;
    use 0x1::String;
    use CarbonCreditToken;

    fun main(account: &signer, amount: u64, description: String::String) {
        CarbonCreditToken::mint(account, amount, description);
    }
}
