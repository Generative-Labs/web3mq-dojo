use starknet::ContractAddress;

#[derive(Component, Copy, Drop, Serde, SerdeLen)]
struct Bind{
    #[key]
    sender: ContractAddress,
		web3mq_id: felt252
}

#[derive(Component, Copy, Drop, Serde, SerdeLen)]
struct Follow{
    #[key]
    sender: ContractAddress,
		#[key]
    target: ContractAddress,
		follow: bool
}

#[derive(Component, Copy, Drop, Serde, SerdeLen)]
struct Block{
    #[key]
    sender: ContractAddress,
		#[key]
    target: ContractAddress,
		block: bool
}

#[derive(Component, Copy, Drop, Serde, SerdeLen)]
struct Permission{
    #[key]
    sender: ContractAddress,
    permission: u32
}