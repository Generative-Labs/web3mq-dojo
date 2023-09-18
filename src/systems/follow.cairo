#[system]
mod follow_{
    use dojo::world::Context;
    use starknet::ContractAddress;
    use web3mq_dojo::components::{Follow};
    fn execute(ctx: Context, sender_address:ContractAddress, target_address:ContractAddress, follow: bool){
        set !(ctx.world, Follow{
            sender: sender_address,
            target: target_address,
            follow: follow
        });
    }
}