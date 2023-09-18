#[system]
mod bind_{
    use dojo::world::Context;
    use starknet::ContractAddress;
    use web3mq_dojo::components::{Bind};
    fn execute(ctx: Context, sender_address:ContractAddress, web3mq_id:felt252){
        set !(ctx.world, Bind{
            sender: sender_address,
            web3mq_id: web3mq_id
        });
    }
}