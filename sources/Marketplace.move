module 0x98fed12532a6876d42810bd3e94a044f83b00c1dff1b8e2fabe53179945007c7::Marketplace {
    use aptos_framework::coin::Coin;
    use aptos_framework::transfer;
    use aptos_framework::signer;
    use 0x98fed12532a6876d42810bd3e94a044f83b00c1dff1b8e2fabe53179945007c7::CarbonCreditToken;

    struct Listing has copy, drop, store {
        token_id: u64,
        price: u64,
        seller: address,
    }

    struct Marketplace has key {
        listings: vector<Listing>,
    }

    public fun initialize(account: &signer) {
        let marketplace = Marketplace { listings: vector<Listing>() };
        move_to(account, marketplace);
    }

    public fun list_token(account: &signer, token_id: u64, price: u64) {
        let marketplace = borrow_global_mut<Marketplace>(signer::address_of(account));
        let new_listing = Listing {
            token_id: token_id,
            price: price,
            seller: signer::address_of(account),
        };
        vector::push_back(&mut marketplace.listings, new_listing);
    }

    public fun buy_token(account: &signer, seller: address, token_id: u64, price: u64) {
        let marketplace = borrow_global_mut<Marketplace>(seller);
        let coin = Coin { value: price };
        transfer::transfer(account, seller, &coin);

        let index = vector::index_of(&marketplace.listings, Listing { token_id: token_id, price: price, seller: seller });
        vector::remove(&mut marketplace.listings, index);

        CarbonCreditToken::transfer(&signer::borrow_global<CarbonCreditToken>(seller, token_id), signer::address_of(account));
    }
}
