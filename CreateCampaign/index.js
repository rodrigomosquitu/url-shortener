const AWS = require('aws-sdk');
var { nanoid } = require('nanoid');

const dynamo = new AWS.DynamoDB.DocumentClient();

exports.handler = async (event, context) => {

    let CLOUDFRONT_URL = process.env.CLOUDFRONT_URL
    console.log("==== CLOUDFRONT_URL: " + CLOUDFRONT_URL)

    console.log("==== EVENT: " + JSON.stringify(event))

    let eventBody = JSON.parse(event.body)

    console.log("==== EVENT BODY: " + JSON.stringify(eventBody))
    console.log("==== LONG URL: " + eventBody.long_url)

    let body;
    let shortId;
    let statusCode = '200';
    const headers = {
        'Content-Type': 'application/json',
    };

    try {

        shortId = nanoid(10)

        var params = {
            TableName: 'url-campaign-222',
            Item: {
                'short_id': shortId,
                'long_url': eventBody.long_url
            }
        };

        await dynamo.put(params).promise();

    } catch (err) {
        statusCode = '400';
        body = err.message;
    } finally {

        var respBody = {
            'short_url': CLOUDFRONT_URL + '/t/' + shortId,
            'long_url': eventBody.long_url
        };

        body = JSON.stringify(respBody);
    }

    return {
        statusCode,
        body,
        headers,
    };

}

