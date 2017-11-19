// Copyright (c) 2009-2010 Satoshi Nakamoto
// Copyright (c) 2009-2015 The Bitcoin Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef BITCOIN_SPENTINDEX_H
#define BITCOIN_SPENTINDEX_H

#include "uint256.h"

struct CSpentIndexKey {
    uint256 txid;
    unsigned int outputIndex;

    IMPLEMENT_SERIALIZE (
        READWRITE(txid);
        READWRITE(outputIndex);
    )

    CSpentIndexKey(uint256 t, unsigned int i) {
        txid = t;
        outputIndex = i;
    }

    CSpentIndexKey() {
        SetNull();
    }

    void SetNull() {
        txid = uint256();
        outputIndex = 0;
    }

};

struct CSpentIndexValue {
    uint256 txid;
    unsigned int inputIndex;
    int blockHeight;
    int64_t satoshis;
    int addressType;
    uint160 addressHash;

    IMPLEMENT_SERIALIZE (
        READWRITE(txid);
        READWRITE(inputIndex);
        READWRITE(blockHeight);
        READWRITE(satoshis);
        READWRITE(addressType);
        READWRITE(addressHash);
    )

    CSpentIndexValue(uint256 t, unsigned int i, int h, int64_t s, int type, uint160 a) {
        txid = t;
        inputIndex = i;
        blockHeight = h;
        satoshis = s;
        addressType = type;
        addressHash = a;
    }

    CSpentIndexValue() {
        SetNull();
    }

    void SetNull() {
        txid = uint256();
        inputIndex = 0;
        blockHeight = 0;
        satoshis = 0;
        addressType = 0;
        addressHash = uint160();
    }

    bool IsNull() const {
        return txid == uint256();
    }
};

struct CSpentIndexKeyCompare
{
    bool operator()(const CSpentIndexKey& a, const CSpentIndexKey& b) const {
        if (a.txid == b.txid) {
            return a.outputIndex < b.outputIndex;
        } else {
            return a.txid < b.txid;
        }
    }
};

#endif // BITCOIN_SPENTINDEX_H
