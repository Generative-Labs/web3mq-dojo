#[cfg(test)]
mod tests {
    use web3mq_dojo::components::{follow, Follow};
    use web3mq_dojo::components::{block, Block};
    use web3mq_dojo::components::{permission, Permission};
    use web3mq_dojo::components::{bind, Bind};
    use web3mq_dojo::systems::follow::follow_;
    use web3mq_dojo::systems::block::block_;
    use web3mq_dojo::systems::permission::permission_;
    use web3mq_dojo::systems::bind::bind_;
    use dojo::world::{IWorldDispatcherTrait, IWorldDispatcher};
    use dojo::test_utils::spawn_test_world;
    use debug::PrintTrait;
    fn setup_world() -> IWorldDispatcher {
        // components
        let mut components = array![follow::TEST_CLASS_HASH, block::TEST_CLASS_HASH, permission::TEST_CLASS_HASH, bind::TEST_CLASS_HASH];
        // systems
        let mut systems = array![follow_::TEST_CLASS_HASH, block_::TEST_CLASS_HASH, permission_::TEST_CLASS_HASH, bind_::TEST_CLASS_HASH];
        let world = spawn_test_world(components, systems);
        return world;
    }

    #[test]
    #[available_gas(3000000000000000)]
    fn test_all(){
        let world = setup_world();
        world.execute('follow_', array![1_felt252, 2_felt252, 1_felt252]);
        let follow_event_1 = get !(world, (1_felt252, 2_felt252),Follow);
        assert(follow_event_1.follow, 'follow error');
        world.execute('follow_', array![1_felt252, 2_felt252, 0_felt252]);
        let follow_event_2 = get !(world, (1_felt252, 2_felt252),Follow);
        assert(!follow_event_2.follow, 'unfollow error');

        world.execute('block_', array![1_felt252, 2_felt252, 1_felt252]);
        let block_event_1 = get !(world, (1_felt252, 2_felt252),Block);
        assert(block_event_1.block, 'block error');
        world.execute('block_', array![1_felt252, 2_felt252, 0_felt252]);
        let block_event_2 = get !(world, (1_felt252, 2_felt252),Block);
        assert(!block_event_2.block, 'unblock error');

        world.execute('permission_', array![1_felt252, 0_felt252]);
        let permission_changed_event = get !(world, 1_felt252,Permission);
        assert(permission_changed_event.permission == 0, 'permission error');

        world.execute('bind_', array![1_felt252, 3_felt252]);
        let bind_changed_event = get !(world, 1_felt252, Bind);
        assert(bind_changed_event.web3mq_id == 3_felt252, 'bind error');
    }
}