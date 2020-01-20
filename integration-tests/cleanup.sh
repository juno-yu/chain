#!/bin/bash
cd "$(dirname "${BASH_SOURCE[0]}")"

if [ -f data/supervisord.pid ]; then
    echo 'Quit supervisord...'
    kill -QUIT `cat data/supervisord.pid` 2> /dev/null && sleep 3
fi
if [ -f supervisord.log ]; then
    rm -f supervisord.log
fi
if [ -d data ]; then
    rm -rf data
fi
if [ -f tx_query_enclave.signed.so ]; then
    rm tx_query_enclave.signed.so
fi
if [ -f tx_validation_enclave.signed.so ]; then
    rm tx_validation_enclave.signed.so
fi
exit 0