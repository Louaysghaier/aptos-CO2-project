script {
    use 0x1::Account;
    use CarbonCreditToken;

    fun main(account: &signer) {
        CarbonCreditToken::initialize(account);
    }
}
