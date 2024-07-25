script {
        use 0x98fed12532a6876d42810bd3e94a044f83b00c1dff1b8e2fabe53179945007c7::CarbonCreditToken;


    fun main(account: &signer, to: address, token_id: u64) {
        CarbonCreditToken::transfer(account, to, token_id);
    }
}
