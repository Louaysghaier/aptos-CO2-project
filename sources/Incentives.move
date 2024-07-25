//4. Incentive Mechanisms: Reward systems for carbon-reducing activities.
module {{addresses.GreenChain}}::Incentives {
    use aptos_framework::coin::Coin;
    use aptos_framework::aptos_account::AptosAccount;
    use aptos_framework::aptos_coin::AptosCoin;

    resource struct RewardPool {
        total_rewards: u64,
        distributed_rewards: u64,
    }

    public fun initialize(account: &signer) {
        let reward_pool = RewardPool { total_rewards: 1000000, distributed_rewards: 0 };
        move_to(account, reward_pool);
    }

    public fun distribute_reward(account: &signer, to: address, amount: u64) {
        let reward_pool = borrow_global_mut<RewardPool>(signer::address_of(account));
        assert!(reward_pool.total_rewards >= reward_pool.distributed_rewards + amount, 1);

        let coin = Coin { value: amount };
        transfer::transfer(account, to, &coin);
        reward_pool.distributed_rewards = reward_pool.distributed_rewards + amount;
    }
}
module {{addresses.GreenChain}}::Incentives {
    use aptos_framework::coin::Coin;
    use aptos_framework::aptos_account::AptosAccount;
    use aptos_framework::aptos_coin::AptosCoin;

    resource struct RewardPool {
        total_rewards: u64,
        distributed_rewards: u64,
    }

    public fun initialize(account: &signer) {
        let reward_pool = RewardPool { total_rewards: 1000000, distributed_rewards: 0 };
        move_to(account, reward_pool);
    }

    public fun distribute_reward(account: &signer, to: address, amount: u64) {
        let reward_pool = borrow_global_mut<RewardPool>(signer::address_of(account));
        assert!(reward_pool.total_rewards >= reward_pool.distributed_rewards + amount, 1);

        let coin = Coin { value: amount };
        transfer::transfer(account, to, &coin);
        reward_pool.distributed_rewards = reward_pool.distributed_rewards + amount;
    }
}
