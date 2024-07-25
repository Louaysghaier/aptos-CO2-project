module 0x98fed12532a6876d42810bd3e94a044f83b00c1dff1b8e2fabe53179945007c7::CarbonCreditToken {
    use aptos_framework::coin::Coin;
    use aptos_framework::coin::register;
    use aptos_framework::coin::transfer;
    use aptos_framework::aptos_account::AptosAccount;

    struct CarbonCreditToken has copy, drop, store {
        id: u64,
        amount: u64,
        description: vector<u8>,
        owner: address,
    }

    resource struct TokenManager {
        next_id: u64,
    }

    public fun initialize(account: &signer) {
        let token_manager = TokenManager { next_id: 0 };
        move_to(account, token_manager);
    }

    public fun mint(account: &signer, amount: u64, description: vector<u8>) {
        let manager = borrow_global_mut<TokenManager>(signer::address_of(account));
        let new_id = manager.next_id;
        manager.next_id = manager.next_id + 1;

        let new_token = CarbonCreditToken {
            id: new_id,
            amount: amount,
            description: description,
            owner: signer::address_of(account),
        };

        move_to(account, new_token);
    }

    public fun transfer(account: &signer, to: address, token_id: u64) {
        let token = borrow_global_mut<CarboCreditToken>(signer::address_of(account), token_id);
        assert!(token.owner == signer::address_of(account), 1);
        token.owner = to;
    }

    public fun get_token_details(account: &signer, token_id: u64): (u64, u64, vector<u8>, address) {
        let token = borrow_global<CarboCreditToken>(signer::address_of(account), token_id);
        (token.id, token.amount, token.description, token.owner)
    }
}
