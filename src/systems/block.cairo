#[system]
mod block_{
    use dojo::world::Context;
    use starknet::ContractAddress;
    use web3mq_dojo::components::{Block};
    fn execute(ctx: Context, sender_address:ContractAddress, target_address:ContractAddress, block: bool){
        set !(ctx.world, Block{
            sender: sender_address,
            target: target_address,
            block: block
        });
    }
}