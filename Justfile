set positional-arguments
set dotenv-load

ethernaut level:
  forge script ./scripts/$1*.sol \
    --rpc-url $RPC_URL \
    --chain-id $CHAIN_ID \
    --sender $SENDER \
    --private-key $PRIV_KEY \
    --slow \
    -vvvv 

ethernaut-broadcast level:
  forge script ./scripts/$1*.sol \
    --rpc-url $RPC_URL \
    --chain-id $CHAIN_ID \
    --sender $SENDER \
    --private-key $PRIV_KEY \
    --broadcast \
    --slow \
    --skip-simulation \
    -vvvv 

# For Level 3 use the following
ethernaut-skip-simulation level:
  forge script ./scripts/$1*.sol \
    --rpc-url $RPC_URL \
    --chain-id $CHAIN_ID \
    --sender $SENDER \
    --private-key $PRIV_KEY \
    --slow \
    --skip-simulation \
    -vvvv 

ethernaut-skip-simulation-broadcast level:
  forge script ./scripts/$1*.sol \
    --rpc-url $RPC_URL \
    --chain-id $CHAIN_ID \
    --sender $SENDER \
    --private-key $PRIV_KEY \
    --broadcast \
    --slow \
    --skip-simulation \
    -vvvv 