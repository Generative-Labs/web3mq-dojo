# web3mq dojo

# Introduction

web3mq-dojo is a project based on [dojo](https://github.com/dojoengine), which is used to store on-chain gaming social relationship.

# Running

You need to learn on [dojo book](https://book.dojoengine.org/cairo/hello-dojo.html) firstly.

running this project:

- build

```rust
sozo build
```

- test

```rust
sozo test
```

# Design

### Component

```rust
#[derive(Component, Copy, Drop, Serde, SerdeLen)]
struct FollowEvent{
    #[key]
    sender: ContractAddress,
    #[key]
    target: ContractAddress,
    follow: bool
}

#[derive(Component, Copy, Drop, Serde, SerdeLen)]
struct BlockEvent{
    #[key]
    sender: ContractAddress,
    #[key]
    target: ContractAddress,
    block: bool
}

#[derive(Component, Copy, Drop, Serde, SerdeLen)]
struct PermissionChangedEvent{
    #[key]
    sender: ContractAddress,
    permission: u32
}
```

### System

- follow

```rust
#[system]
mod follow{
    fn execute(ctx: Context, sender_address:ContractAddress, target_address:ContractAddress, follow: bool)
}
```

- block

```rust
#[system]
mod block{
    fn execute(ctx: Context, sender_address:ContractAddress, target_address:ContractAddress, block: bool)
}
```

- permission

```rust
#[system]
mod permission{
    fn execute(ctx: Context, sender_address:ContractAddress, permission:u32)
}
```
