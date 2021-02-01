const { toWei, toBN } = web3.utils;

const { MedianizerPriceFeed } = require("../../src/price-feed/MedianizerPriceFeed");
const { PriceFeedMock } = require("../../src/price-feed/PriceFeedMock");

contract("MedianizerPriceFeed.js", function() {
  it("Update", async function() {
    const priceFeeds = [new PriceFeedMock()];

    const medianizerPriceFeed = new MedianizerPriceFeed(priceFeeds);
    await medianizerPriceFeed.update();
    await medianizerPriceFeed.update();

    assert.equal(priceFeeds[0].updateCalled, 2);
  });

  it("Basic medians", async function() {
    const priceFeeds = [
      //                currentPrice      historicalPrice    lastUpdatedTime
      new PriceFeedMock(toBN(toWei("1")), toBN(toWei("25")), 100),
      new PriceFeedMock(toBN(toWei("2")), toBN(toWei("57")), 50000),
      new PriceFeedMock(toBN(toWei("9")), toBN(toWei("10")), 25)
    ];

    const medianizerPriceFeed = new MedianizerPriceFeed(priceFeeds);

    // Should return the median current price.
    assert.equal(medianizerPriceFeed.getCurrentPrice(), toWei("2"));

    // Should return the median historical price (because we're using mocks, the timestamp doesn't matter).
    const arbitraryHistoricalTimestamp = 1000;
    assert.equal(medianizerPriceFeed.getHistoricalPrice(arbitraryHistoricalTimestamp), toWei("25"));

    // Should return the *maximum* lastUpdatedTime.
    assert.equal(medianizerPriceFeed.getLastUpdateTime(), 50000);
    assert.equal(medianizerPriceFeed.getLookback(), 3600);
  });

  it("Basic means", async function() {
    const priceFeeds = [
      //                currentPrice      historicalPrice    lastUpdatedTime
      new PriceFeedMock(toBN(toWei("1")), toBN(toWei("25")), 100),
      new PriceFeedMock(toBN(toWei("2")), toBN(toWei("57")), 50000),
      new PriceFeedMock(toBN(toWei("9")), toBN(toWei("11")), 25)
    ];

    const medianizerPriceFeed = new MedianizerPriceFeed(priceFeeds, true);

    // Should return the mean current price.
    assert.equal(medianizerPriceFeed.getCurrentPrice(), toWei("4"));

    // Should return the mean historical price (because we're using mocks, the timestamp doesn't matter).
    const arbitraryHistoricalTimestamp = 1000;
    assert.equal(medianizerPriceFeed.getHistoricalPrice(arbitraryHistoricalTimestamp), toWei("31"));

    // Should return the *maximum* lastUpdatedTime.
    assert.equal(medianizerPriceFeed.getLastUpdateTime(), 50000);
  });

  it("Even count median", async function() {
    const priceFeeds = [
      //                currentPrice      historicalPrice    lastUpdatedTime
      new PriceFeedMock(toBN(toWei("1")), toBN(toWei("17")), 100),
      new PriceFeedMock(toBN(toWei("2")), toBN(toWei("58")), 50000),
      new PriceFeedMock(toBN(toWei("3")), toBN(toWei("45")), 25),
      new PriceFeedMock(toBN(toWei("4")), toBN(toWei("100")), 25)
    ];

    const medianizerPriceFeed = new MedianizerPriceFeed(priceFeeds);

    // Should return the average of 3 and 2 since there are an even number of elements.
    assert.equal(medianizerPriceFeed.getCurrentPrice(), toWei("2.5"));

    // Should return the average of 58 and 45 since there are an even number of elements.
    // Note: because we're using mocks, the timestamp doesn't matter.
    const arbitraryHistoricalTimestamp = 1000;
    assert.equal(medianizerPriceFeed.getHistoricalPrice(arbitraryHistoricalTimestamp), toWei("51.5"));
  });

  it("Even count means", async function() {
    const priceFeeds = [
      //                currentPrice      historicalPrice    lastUpdatedTime
      new PriceFeedMock(toBN(toWei("1")), toBN(toWei("17")), 100),
      new PriceFeedMock(toBN(toWei("2")), toBN(toWei("58")), 50000),
      new PriceFeedMock(toBN(toWei("3")), toBN(toWei("45")), 25),
      new PriceFeedMock(toBN(toWei("4")), toBN(toWei("100")), 25)
    ];

    const medianizerPriceFeed = new MedianizerPriceFeed(priceFeeds, true);

    // Should return the mean, which is not neccessarily the average of 3 and 2.
    assert.equal(medianizerPriceFeed.getCurrentPrice(), toWei("2.5"));
    const arbitraryHistoricalTimestamp = 1000;
    assert.equal(medianizerPriceFeed.getHistoricalPrice(arbitraryHistoricalTimestamp), toWei("55"));
  });

  it("sub-pricefeeds either return null or throw an error", async function() {
    const priceFeeds = [
      //                currentPrice      historicalPrice    lastUpdatedTime
      new PriceFeedMock(toBN(toWei("1")), toBN(toWei("17")), 100),
      new PriceFeedMock(null, null, null),
      new PriceFeedMock(null, null, null)
    ];

    const medianizerPriceFeed = new MedianizerPriceFeed(priceFeeds);

    // Should return null since there was a null price output.
    assert.equal(medianizerPriceFeed.getCurrentPrice(), null);

    // Should throw an error for each null price output.
    const arbitraryHistoricalTimestamp = 1000;
    try {
      medianizerPriceFeed.getHistoricalPrice(arbitraryHistoricalTimestamp);
    } catch (err) {
      assert.equal(err.length, 2);
    }
    assert.throws(() => medianizerPriceFeed.getHistoricalPrice(arbitraryHistoricalTimestamp));

    // Should return null since there was a null input.
    assert.equal(medianizerPriceFeed.getLastUpdateTime(), null);

    // Make one of the pricefeeds throw an error and make sure the error gets bubbled up.
    priceFeeds[1].setHistoricalPriceReturnError();
    try {
      medianizerPriceFeed.getHistoricalPrice(arbitraryHistoricalTimestamp);
    } catch (err) {
      // First error message should bubble up the price feed's error
      assert.equal(err[0].message, "PriceFeedMock expected error thrown");
      // Second error message should be generic about a null price
      assert.equal(err[1].message, "Missing historical price");
    }
  });

  it("undefined inputs", async function() {
    const priceFeeds = [
      //                currentPrice      historicalPrice    lastUpdatedTime
      new PriceFeedMock(toBN(toWei("1")), toBN(toWei("17")), 100),
      new PriceFeedMock(undefined, undefined, undefined)
    ];

    const medianizerPriceFeed = new MedianizerPriceFeed(priceFeeds);

    // Should return null since there was an undefined price output.
    assert.equal(medianizerPriceFeed.getCurrentPrice(), null);

    // Should throw since there was an undefined price output.
    const arbitraryHistoricalTimestamp = 1000;
    assert.throws(() => medianizerPriceFeed.getHistoricalPrice(arbitraryHistoricalTimestamp));

    // Should return null since there was an undefined output.
    assert.equal(medianizerPriceFeed.getLastUpdateTime(), null);
  });
  it("Validates feeds decimals correctly", async function() {
    // Create three feeds, one with a diffrent number of decimals. Medianizer should reject this when checking the decimals.
    const validDecimalsPriceFeeds = [
      //                currentPrice      historicalPrice    lastUpdatedTime    PriceFeed decimals
      new PriceFeedMock(toBN(toWei("1")), toBN(toWei("25")), 100, 18),
      new PriceFeedMock(toBN(toWei("2")), toBN(toWei("57")), 50000, 18),
      new PriceFeedMock(toBN(toWei("9")), toBN(toWei("10")), 25, 18)
    ];

    const validMedianizerPriceFeed = new MedianizerPriceFeed(validDecimalsPriceFeeds);

    let didThrow = false;
    try {
      const feedDecimals = validMedianizerPriceFeed.getPriceFeedDecimals();
      assert.equal(feedDecimals, 18);
    } catch (error) {
      didThrow = true;
    }

    assert.isFalse(didThrow);

    const inValidDecimalsPriceFeeds = [
      //                currentPrice      historicalPrice    lastUpdatedTime    PriceFeed decimals
      new PriceFeedMock(toBN(toWei("1")), toBN(toWei("25")), 100, 18),
      new PriceFeedMock(toBN(toWei("2")), toBN(toWei("57")), 50000, 18),
      new PriceFeedMock(toBN(toWei("9")), toBN(toWei("10")), 25, 17)
    ];

    const invalidMedianizerPriceFeed = new MedianizerPriceFeed(inValidDecimalsPriceFeeds);
    try {
      invalidMedianizerPriceFeed.getPriceFeedDecimals();
    } catch (error) {
      didThrow = true;
    }
    assert.isTrue(didThrow);
  });
});
