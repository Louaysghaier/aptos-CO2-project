script {
        use 0x98fed12532a6876d42810bd3e94a044f83b00c1dff1b8e2fabe53179945007c7::CarbonCreditToken;


    fun main(account: &signer, token_id: u64) {
        let (id, amount, description, owner) = CarbonCreditToken::get_token_details(account, token_id);
        
        // Printing details (this is a placeholder, actual implementation may vary)
        // In a real scenario, you would return this data to be handled by the frontend.
        debug::print(&format!("Token ID: {}\nAmount: {}\nDescription: {}\nOwner: {}\n",
            id,
            amount,
            String::utf8(description),
            owner,
        ));
    }
}
