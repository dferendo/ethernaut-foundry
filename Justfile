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
    -vvvv 