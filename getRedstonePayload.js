const timestampMilliseconds = Date.now();
const mockWallets = [];

const dataPoints = [
    { dataFeedId: "ETH", value: 1670.99 },
    { dataFeedId: "BTC", value: 23077.68 },
];

const signedDataPackages = {
    ETH: [],
    BTC: [],
};

for (const mockWallet of mockWallets) {
    for (const dataPointObj of dataPoints) {
        const dataPoint = new NumericDataPoint(dataPointObj);
        const mockDataPackage = {
            signer: mockWallet.address,
            dataPackage: new DataPackage([dataPoint], timestampMilliseconds),
        };
        const privateKey = mockWallet.privateKey;
        const signedDataPackage = mockDataPackage.dataPackage.sign(privateKey);
        signedDataPackages[dataPointObj.dataFeedId].push(
            signedDataPackage
        );
    }
}

signedDataPackages;