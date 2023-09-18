#[system]
mod permission_{
    use dojo::world::Context;
    use starknet::ContractAddress;
    use web3mq_dojo::components::{Permission};
    fn execute(ctx: Context, sender_address:ContractAddress, permission:u32){
        set !(ctx.world, Permission{
            sender: sender_address,
            permission: permission
        });
    }
}