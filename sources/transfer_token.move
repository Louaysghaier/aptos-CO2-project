script {
    use 0x1::Account;
    use CarbonCreditToken;

    fun main(account: &signer, to: address, token_id: u64) {
        CarbonCreditToken::transfer(account, to, token_id);
    }
}
